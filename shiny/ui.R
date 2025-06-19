library(shiny)
library(forcats)

ui <- navbarPage(
  title = "Analyse UFC",
  id = "main_navbar",
  
  # Style global
  header = tags$head(
    tags$style(HTML("
      body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', sans-serif;
      }
      .tab-pane {
        padding: 30px;
      }
      h2 {
        color: #1b9e77;
        font-weight: bold;
      }
      .well {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
      }
    "))
  ),
  
  
  tabPanel("Top Ratios",
           div(class = "well",
               sliderInput("minFights", 
                           "Nombre minimum de combats :", 
                           min = 10, max = 30, value = 10, step = 5),
               h2("Classement des 10 meilleurs combattants (ratio victoires / défaites et no contest)"),
               plotOutput("topRatio")
           )
  )
)
