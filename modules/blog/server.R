library(shiny)

mod_blog_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$posts <- renderUI({
      tags$p("Em breve: lista de posts e estudos técnicos.")
    })
  })
}
