#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel(" Body Mass Index Calculator"),
    
    sidebarPanel(
      numericInput('weight', 'Insert your weight in kilograms', 65) ,
      numericInput('height', 'Insert your height in metres', 1.65, min = 0.2, max = 3, step = 0.01),
      submitButton('Submit')
    ),
    mainPanel(
      p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to the men and women.'),
      p('Regarding the BMI measure, the World Health Organization proposes the following classification:'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=30        : Obesity')
        )
      ),
      h4('Taking the values:'), 
      p('weight:'), verbatimTextOutput("inputweightvalue"),
      p('height:'), verbatimTextOutput("inputheightvalue"),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It says that you are:'),strong(verbatimTextOutput("diagnostic"))
      
    )
    
  )
)
