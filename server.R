#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

BMI <- function(weight, height) {weight/(height^2)}

diagnostic_f <- function(weight,height) {
  BMI_Val <- weight/(height^2)
  ifelse(BMI_Val < 18.5, "Under weight", ifelse(BMI_Val < 25, "Normal weight", ifelse(BMI_Val < 30, "Over weight")))
}

shinyServer(
  function(input, output) {
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  } 
)
  