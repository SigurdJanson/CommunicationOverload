#

library(shiny)
library(igraph)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Communication"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "People on the Team",
                        min = 2, max = 50,
                        value = 30),
            textOutput("comCount")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("comPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$comCount <- renderText(input$bins*(input$bins-1) / 2)

  output$comPlot <- renderPlot({
    nodes <- 1:input$bins #letters[1:input$bins]
    #edges <- c(nodes[1], rep(nodes[2:(input$bins-1)], each=2), nodes[1])
    edges <- combn(nodes, 2)
    graph <- make_graph( edges=edges, directed=FALSE ) %>%
      set_vertex_attr(name = "shape", value = "square") %>%
      set_vertex_attr(name = "color", value = "blue")
    layout <- layout_in_circle(graph, order = V(graph))
    plot(graph, layout=layout) # not ring shaped - nodes in the middle
    #plot(make_ring(input$bins, directed=FALSE ))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
