#

library(shiny)
library(igraph)


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
  stopifnot(all(People > 2))
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




#
ui <- fluidPage(

    # Application title
    titlePanel("Communication"),

    # Sidebar with a slider input for number of team members
    sidebarLayout(
        sidebarPanel(
            sliderInput("inpTeamMembers",
                        "People on the Team",
                        min = 2, max = 50,
                        value = 30),
            textOutput("comCount"),
            textOutput("comRelative"),
            hr(),
            p("Please note: The link between team communication and
              performance seems to be stronger when you focus on the
              quality, rather than the quantity of communication."),
            p("Brooks, F. P. (1995).", strong("'The Mythical Man Month'"), ". Addison-Wesley"),
            p("Marlow, S. L., Lacerenza, C. N., Paoletti, J., Burke, C. S., & Salas, E. (2018). 'Does team communication represent a one-size-fits-all approach?: A meta-analysis of team communication and performance'. Organizational Behavior and Human Decision Processes, 144, 145-170.")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("comPlot", height = "600px"),
           plotOutput("outProductiveTime", height = "600px")
        )
    )
)

# Define server logic
server <- function(input, output) {


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
    nodes <- 1:input$inpTeamMembers #letters[1:input$inpTeamMembers]
    edges <- combn(nodes, 2)
    graph <- make_graph( edges=edges, directed=FALSE ) %>%
      set_vertex_attr(name = "shape", value = "square") %>%
      set_vertex_attr(name = "color", value = "blue")
    layout <- layout_in_circle(graph, order = V(graph))
    plot(graph, layout=layout) # not ring shaped - nodes in the middle
  })

  output$outProductiveTime <- renderPlot({
    MemberCount <- 2:15
    ProductiveTime <- ProductiveTimeLeft(MemberCount, 0.05)
    plot(MemberCount, ProductiveTime)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
