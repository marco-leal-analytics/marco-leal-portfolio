library(shiny)

mod_home_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$kpis <- renderUI({
      tags$div(class = "kpi-row",
               tags$div(class = "kpi", tags$strong("Projects:"), " ",  length(PROJECTS_DATA)),
               tags$div(class = "kpi", tags$strong("Certs:"), " ", length(CERTS_DATA))
      )
    })
  })
}
