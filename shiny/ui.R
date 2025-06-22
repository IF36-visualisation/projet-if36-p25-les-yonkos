library(shiny)
library(shinydashboard)
library(forcats)

dashboardPage(
  skin = "blue",
  dashboardHeader(
    title = span("Analyse UFC", style = "font-family: 'Segoe UI', sans-serif; font-weight: bold;")
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Top Ratios", tabName = "topratios", icon = icon("trophy")),
      menuItem("Longévité & Dommages", tabName = "longevite", icon = icon("heartbeat"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("
    body, .content-wrapper, .right-side {
      background: #fdf6e3 !important;
      font-family: 'Segoe UI', Arial, sans-serif;
    }
    .main-header .logo, .skin-blue .main-header .navbar {
      background: #3498db !important;
      color: #fff !important;
      font-weight: bold;
    }
    
    .main-header .logo {
      font-size: 22px;
      height: 60px; line-height: 60px;
    }
    .main-header .navbar { min-height: 60px; }
    .skin-blue .main-sidebar {
      background: #2c3e50 !important;
    }
    .skin-blue .sidebar-menu > li > a {
      color: #ecf0f1 !important;
      font-size: 17px;
      font-weight: 500;
    }
    .skin-blue .sidebar-menu > li.active > a {
      background: #3498db !important;
      color: #fff !important;
      font-weight: bold;
    }
    .main-sidebar .sidebar { padding-top: 30px; }
    .box {
      border-radius: 14px !important;
      box-shadow: 0 2px 16px rgba(44,62,80,0.10);
      border: none !important;
      background: #fff !important;
      margin-bottom: 30px;
    }
    .box-header {
      background: #3498db !important;
      border-radius: 14px 14px 0 0 !important;
      padding: 18px 20px 12px 20px;
      border-bottom: none !important;
    }
    .box-title {
      color: #fff !important;
      font-weight: bold;
      font-size: 24px;
      letter-spacing: 1px;
    }
    .box-body { padding: 30px 30px 20px 30px; }
    .content { padding: 40px 2vw; max-width: 1800px; margin: 0 auto; }
    .slider-animate-container, .irs-bar, .irs-bar-edge, .irs-single, .irs-grid-pol,
    .irs--shiny .irs-bar, .irs--shiny .irs-handle,
    .irs--shiny .irs-single, .irs--shiny .irs-from, .irs--shiny .irs-to {
      background: #3498db !important;
      border-color: #3498db !important;
      color: #fff !important;
    }
    .irs--shiny .irs-bar, .irs--shiny .irs-handle { background: #1b9e77 !important; border-color: #1b9e77 !important; }
    .irs--shiny .irs-min, .irs--shiny .irs-max, .irs--shiny .irs-grid-text {
      color: #1b9e77 !important;
    }
    .selectize-input {
      border-radius: 8px !important;
      border-color: #3498db !important;
      font-size: 16px;
    }
    .form-group label {
      font-weight: bold;
      color: #1b9e77;
      font-size: 17px;
    }
  "))
    ),
    tabItems(
      tabItem(tabName = "topratios",
              fluidRow(
                box(
                  width = 12, status = "primary", solidHeader = TRUE,
                  title = "Classement des 10 meilleurs combattants (ratio victoires / défaites et no contest)",
                  sliderInput("minFights", 
                              "Nombre minimum de combats :", 
                              min = 10, max = 30, value = 10, step = 5),
                  plotOutput("topRatio", height = "500px")
                )
              )
      ),
      tabItem(tabName = "longevite",
              fluidRow(
                box(
                  width = 12, status = "success", solidHeader = TRUE,
                  title = "Impact des Coups Absorbés sur la Durée de Carrière",
                  selectInput("damage_type", "Type de coups absorbés :", 
                              choices = c(
                                "Par minute" = "pm",
                                "Par combat" = "per_fight",
                                "Total carrière" = "total"
                              ),
                              selected = "pm"),
                  plotOutput("damagePlot", height = "500px"),
                  tags$div(style="margin-top:15px; color:#888; font-size:13px;",
                           "Source: Données UFC")
                )
              )
      )
    )
  )
)