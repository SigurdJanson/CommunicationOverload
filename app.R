#
library(shiny)
library(igraph)
library(ggplot2)
library(bslib)
library(thematic)
library(ragg)
library(showtext)

# Theming
thematic::thematic_shiny(font = "auto")
ggplot2::theme_set(ggplot2::theme_minimal())
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
  TotalLoss <- Paths * ComPercentage
  return(pmax.int(People - TotalLoss, 0))
}






# UI
ui <- fluidPage(
  theme = bs_add_variables(
    bs_theme(bootswatch = "superhero", fg = .FGCol, bg = .BGCol,
                   font_scale = NULL, `enable-rounded` = FALSE, primary = .PrimaryCol,
                   base_font = bslib::font_google("Inter")),
    # cards should be less conspicuous
    `card-bg` = "rgba(243, 251, 249, .02)", `card-cap-bg` = "rgba(243, 251, 249, .02)",
    .where = "declarations"),


  # Sidebar with a slider input for number of team members
  layout_columns(
    # Application title
    titlePanel("Team Communication"),

    layout_columns(class="well",
      div(
        h3("Pairwise Relationships"),
        p("How many relationships between pairs of team members must be
               maintained depending on the size of the team? This is sometimes
               referred to as Brooks law (Brooks, 1995).", br(),
          "Adjust the slider to show it."),
        sliderInput("inpTeamMembers",
                    "People on the Team",
                    min = min(.MemberRange), max = max(.MemberRange),
                    value = 8L, step = 1L,
                    width = "100%")
      ),
      div(
        # Show a plot of the pairwise relationships
        div(style=paste0("border: 1px solid ", .FGCol),
            plotOutput("comPlot"),
        )
      ),
      div(
        # Show a plot of the generated distribution
        div(style=paste0("border: 1px solid ", .FGCol),
            plotOutput("relationshipsPlot")
        )
      ),

      div(
        h3("Productive Time"),
        p(span(class=".small", "Assumption: there is a small reduction of team performance",
               "caused by each pair of team members. Adjust the slider to simulate the effect.")),
        sliderInput("inpCommunctionWaste",
                    "Average percentage of time lost due to ineffective communication per team member",
                    min = 0L, max = 25L, step = 1L,
                    value = 10L, post = "%",
                    width = "100%"),
        withTags(small("Such a reduction could e.g. be caused by ...",
          ul(
          li("an increased difficulty to develop quality relationships,"),
          li("unrelated communication that does not contribute to performance,")
          ),
          "or other factors causing the ", a("Ringelmann Effect",
                  href = "https://en.wikipedia.org/w/index.php?title=Ringelmann_effect&oldid=1067453356")
          )),
        withTags(
          p(small("The assumption in this simulation is a linear relationship between the number
                      of team members and the loss in productivity."))
        )),
      div(
        div(style=paste0("border: 1px solid ", .FGCol),
            plotOutput("outProductiveTime")
        )
      ),
      col_widths = breakpoints(
        sm = 12,
        md = c(12, 4, 8,
               4,  8),
        lg = c(4, 2, 6,
               4, 8) #
      )
    ),
    wellPanel(
      h3("Further Reading"),
      layout_columns(
        # card(
        #   FormatBib("Brooks, F. P.", "The Mythical Man Month", 1995, "Addison-Wesley")
        # ),
        card(
          FormatBib("Brooks, F. P.", "The Mythical Man Month", 1995, "Addison-Wesley"),
          card_footer(
            class = "fs-6",
            tags$a(shiny::icon("wikipedia-w"), "Wikipedia", href="https://en.wikipedia.org/wiki/The_Mythical_Man-Month"),
            "✴",
            tags$a(shiny::icon("landmark"), "Internet Archive", href="https://archive.org/details/MythicalManMonth")
          )
        ),
        card(
          FormatBib("Marlow, S. L., Lacerenza, C. N., Paoletti, J., Burke, C. S., & Salas, E.",
                    "Does team communication represent a one-size-fits-all approach?: A meta-analysis of team communication and performance",
                    "2018", journal="Organizational Behavior and Human Decision Processes",
                    issue=144, pg="145-170"),
          card_footer(
            class = "fs-6", tags$a(shiny::icon("newspaper"), "doi", href="https://doi.org/10.1016/j.obhdp.2017.08.001")
          )
        ),
        col_widths = breakpoints(
          sm = 12,
          md = 6,
          lg = 6
        )
      )
    ),
    col_widths = breakpoints(
      sm = 12,
      md = c(12, 12, 12),
      lg = c(-1, 10, -1, # title
             -1, 10, -1
             -1, 10, -1) # references
    )
  )
)

# Define server logic
server <- function(input, output) {
  Relationships <- seq.int(.MemberRange[1], .MemberRange[2L]) * (seq.int(.MemberRange[1], .MemberRange[2L])-1) / 2

  output$comCount <- renderText({
    Members <- input$inpTeamMembers
    Paths <- PathsOfTalk(Members)
    paste("Relationships:", paste(Paths, collapse = " / "))
  })



  #
  # Plot Communication Pathways
  #
  output$comPlot <- renderPlot({
    nodes <- 1:input$inpTeamMembers
    edges <- combn(nodes, 2)

    ## Formatting
    graph <- make_graph( edges=edges, directed=FALSE ) %>%
      set_vertex_attr("label", value = rep("", input$inpTeamMembers))
    layout <- layout_in_circle(graph, order = V(graph))
    par.backup <- par(mar=c(0,0,0,0)+.1)

    ## PLOT
    plot(graph, layout=layout,
         vertex.size = 10, color = .PrimaryCol,
         vertex.frame.width = 0,
         vertex.shape = "circle", frame = FALSE)
    par(par.backup)
  })


  #
  # Plot the number of relationships based in team members
  #
  output$relationshipsPlot <- renderPlot({
    dt <- data.frame(Members = seq.int(.MemberRange[1], .MemberRange[2L]),
                     Relations = Relationships)

    ggplot(dt, aes(x = Members, y = Relationships, label = format(Relationships))) +
      geom_line() + geom_point() +
      geom_vline(xintercept = input$inpTeamMembers, color = .PrimaryCol) +
      geom_hline(yintercept = 0, color = .FGCol) +
      labs(x = "Team Members", y = "Relationships") +
      theme(axis.text.y   = element_text(size=12),
            axis.text.x   = element_text(size=12),
            axis.title.y  = element_text(size=14),
            axis.title.x  = element_text(size=14),
            panel.background = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.margin=margin(1,1,0.75,0.75, "cm"),
            panel.border = element_rect(colour=NA, fill=NA, linewidth=1),
            axis.line = element_line(colour=.FGCol))
  })


  #
  # Plot for Productivity
  #
  output$outProductiveTime <- renderPlot({
    CurrentMembers <- input$inpTeamMembers
    CurrentIndex <- CurrentMembers - 1# TODO: why `-1`? # + min(.MemberRange)

    MemberCount <- min(.MemberRange):max(.MemberRange)
    Waste <- input$inpCommunctionWaste / 100
    ProductiveTime <- ProductiveTimeLeft(MemberCount, Waste)

    RelPos <- ProductiveTime[CurrentIndex] / max(ProductiveTime)
    if (RelPos >= 0.84) {
      LabelDir <- "inward"
      LabelNudge <- -max(ProductiveTime)*16 # *0.2 * 100
    } else  if (RelPos <= 0.2 ) {
      LabelDir <- "inward"
      LabelNudge <- max(ProductiveTime)*16 # *0.2 * 100
    } else {
      LabelDir <- "top"
      LabelNudge <- max(ProductiveTime)*16 # *0.2 * 100
    }
    MaxPos <- which(ProductiveTime == max(ProductiveTime))
    if (CurrentIndex %in% MaxPos) {
      Direction <- "⯁"
    } else {
      Direction <- switch(sign(CurrentIndex - MaxPos[1])+2, "🡅", "⯁", "🡇")
    }

    dt <- data.frame(Members = MemberCount, ProductiveTime = ProductiveTime*100)
    ggplot(dt, aes(x = Members, y = ProductiveTime, label = format(ProductiveTime))) +
      geom_line() + geom_point() +
      geom_vline(linewidth = 1, xintercept = input$inpTeamMembers, color = .PrimaryCol) +
      geom_hline(yintercept = 0, color = .FGCol) +
      geom_label(data = dt[CurrentIndex,],
                 aes(label = sprintf("%3.0f %s", ProductiveTime, Direction), fontface = "bold", size = 20),
                 color = "#FFFFFF", alpha=1, fill = .PrimaryCol,
                 hjust = "center", nudge_y = LabelNudge,
                 show.legend = FALSE) +
      labs(x = "Team Members", y = "Total Productive Time (%)") +
      theme(axis.text.y   = element_text(size=12),
            axis.text.x   = element_text(size=12),
            axis.title.y  = element_text(size=14),
            axis.title.x  = element_text(size=14),
            panel.background = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.margin=margin(1,1,0.75,0.75, "cm"),
            panel.border = element_rect(colour=NA, fill=NA, linewidth=1),
            axis.line = element_line(colour=.FGCol))
  })

}



#
# Run the application
#
shinyApp(ui = ui, server = server)
