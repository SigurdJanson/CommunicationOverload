#
library(shiny)
library(igraph)
library(ggplot2)
library(ggrepel)
library(bslib)
library(thematic)
library(ragg)

# Theming
thematic::thematic_shiny(font = "auto")
.PrimaryCol = "#df691a"
.FGCol = "#F3FBF9"
.BGCol = "#092B36"
.MemberRange = c(2, 25)


source("./helpers.R")

#' PathsOfTalk
#' Returns the number of communication paths in a team with the given
#' number of team members.
#' @param People The number of people on the team
#' @details The result represents the un-directed node edges of a graph
#' connecting all elements with each other.
#' @return Number of communication paths within the team
#' @references Brooks, F. P. (1995). 'The Mythical Man Month'. Addison-Wesley
#' @examples
#' PathsOfTalk(3:5)
#' #> [1]  3  6 10
PathsOfTalk <- function(People) {
  stopifnot(all(People > 1))
  People * (People-1) / 2
}


#' ProductiveTimeLeft
#'
#' @param People Members on the team
#' @param ComPercentage Assumed average percentage of each team member to
#' be spent on communication with other team members that serves the purpose
#' of relationship maintenance but is not goal-oriented.
#' @return The time team members have left to work productively (vectorised)
#' @examples
ProductiveTimeLeft <- function(People, ComPercentage) {
  Paths <- PathsOfTalk(People)
  TotalTime <- Paths * ComPercentage
  return(pmax((1-TotalTime) * People, rep(0, length(People))))
}






# UI
ui <- fluidPage(
  theme = bs_theme(bootswatch = "superhero", fg = .FGCol, bg = .BGCol,
                   font_scale = NULL, `enable-rounded` = FALSE, primary = .PrimaryCol,
                   base_font = bslib::font_google("Inter")),
  # Application title
  titlePanel("Team Communication"),

  # Sidebar with a slider input for number of team members
  wellPanel(
  fluidRow(
         column(3,
           h3("Team Relationships"),
           p("How many relationships between pairs of team members must be
             maintained depending on the size of the team?
             Adjust the slider to show this the effect."),
           sliderInput("inpTeamMembers",
                       "People on the Team",
                       min = min(.MemberRange),
                       max = max(.MemberRange),
                       value = mean(.MemberRange)),
           textOutput("comCount"),
           textOutput("comRelative"),
         ),
         column(6,
           # Show a plot of the generated distribution
           plotOutput("comPlot", height = "500px")
         ),
         column(3L,
                p("The number of relationships to maintain in a team
                  is sometimes called Brookes law (according to Brookes, 1995)"),
                p("Please note: The link between team communication and
                performance seems to be stronger when you focus on the
                quality, rather than the quantity of communication."),
                p("Reading"),
                FormatBib("Brooks, F. P.", "The Mythical Man Month", 1995, "Addison-Wesley"),
                FormatBib("Marlow, S. L., Lacerenza, C. N., Paoletti, J., Burke, C. S., & Salas, E.",
                          "Does team communication represent a one-size-fits-all approach?: A meta-analysis of team communication and performance",
                          "2018", journal="Organizational Behavior and Human Decision Processes",
                          issue=144, pg="145-170"),
                p("Marlow, S. L., Lacerenza, C. N., Paoletti, J., Burke, C. S., & Salas, E. (2018).
                  'Does team communication represent a one-size-fits-all approach?: A meta-analysis
                  of team communication and performance'.
                  Organizational Behavior and Human Decision Processes, 144, 145-170."),
         )
  )),

  wellPanel(
      fluidRow(
         column(3L,
                h3("Simulation"),
                p(span(class=".small", "Assumption: there is a small reduction of team performance",
                       tags$sup("🕂", .noWS = "before"), "caused by each pair of team members.
                       Adjust the slider to simulate the effect.")),
                sliderInput("inpCommunctionWaste",
                            "Average percentage of time lost due to ineffective communication per team member",
                            min = 0, max = 5, step = 0.1,
                            value = 1, post = "%")),
         column(6L,
                plotOutput("outProductiveTime", height = "500px")
         ),
         column(3L,
                p(tags$sup("🕂", .noWS = "outside"), "Such a reduction could be because of ...",
                  tags$ul(
                    tags$li("an increased difficulty to develop quality relationships,"),
                    tags$li("unrelated communcation that does not contribute to performance,"),
                    tags$li("the ", a("Ringelmann Effect",
                                 href = "https://en.wikipedia.org/w/index.php?title=Ringelmann_effect&oldid=1067453356"))
                  )
                ),
                p("The assumption in this simulation is a linear relationship between the number
                  of team members and the loss in productivity.")
         )
    )
  )
)

# Define server logic
server <- function(input, output) {
  #bs_themer()


  output$comCount <- renderText({
    Members <- (input$inpTeamMembers-1):(input$inpTeamMembers+1)
    Paths <- PathsOfTalk(Members)
    paste("Count:", paste(Paths, collapse = " / "))
  })

  output$comRelative <- renderText({
    Members <- (input$inpTeamMembers-1):(input$inpTeamMembers+1)
    Paths <- PathsOfTalk(Members)
    paste("Relation:", paste(Paths / Members, collapse = " / "))
  })

  output$comPlot <- renderPlot({
    nodes <- 1:input$inpTeamMembers
    edges <- combn(nodes, 2)

    ## Formatting
    graph <- make_graph( edges=edges, directed=FALSE ) %>%
      set_vertex_attr("label", value = rep("", input$inpTeamMembers))
    layout <- layout_in_circle(graph, order = V(graph))

    ## PLOT
    plot(graph, layout=layout,
         vertex.size = 10, color = .PrimaryCol,
         vertex.frame.width = 1,
         vertex.shape = "circle", frame = TRUE)
  })



  output$outProductiveTime <- renderPlot({
    MemberCount <- min(.MemberRange):max(.MemberRange)
    Waste <- input$inpCommunctionWaste / 100
    ProductiveTime <- ProductiveTimeLeft(MemberCount, Waste)

    ggplot(data.frame(Members = MemberCount, ProductiveTime = ProductiveTime),
           aes(x = Members, y = ProductiveTime, label = format(ProductiveTime))) +
      geom_line() + geom_point() +
      ggrepel::geom_text_repel() +
      geom_vline(xintercept = input$inpTeamMembers, color = .PrimaryCol) +
      theme(axis.text.y   = element_text(size=12),
            axis.text.x   = element_text(size=12),
            axis.title.y  = element_text(size=14),
            axis.title.x  = element_text(size=14),
            panel.background = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            axis.line = element_line(colour=.FGCol),
            panel.border = element_rect(colour=.FGCol, fill=NA, size=1))
  })
}



# Run the application
shinyApp(ui = ui, server = server)
