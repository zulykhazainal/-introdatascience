library(shiny)
library(bslib)

# Define the UI
ui <- fluidPage(titlePanel("Calculator"),
                theme = bs_theme(version = 4, bootswatch = "minty"),
                sidebarLayout(
                  mainPanel(
                    h5("This is a simple calculator. You put the first and the second number, select the operator and there you go!"),
                    numericInput("num1", "Select the first number", 0),
                    numericInput("num2", "Select the second number", 0),
                    selectInput("operator", "Select the operator",choices = c("+","-","x", "÷"))),
                  
                  mainPanel(
                    h2("The result is:"),textOutput("output"))
                )
)


# Define the server code
server <- function(input, output) {
  output$output <- renderText({
    switch(input$operator,
           "+" = input$num1 + input$num2,
           "-" = input$num1 - input$num2,
           "x" = input$num1 * input$num2,
           "÷" = input$num1 / input$num2)
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)
