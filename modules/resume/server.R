library(shiny)

mod_resume_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$resume_content <- renderUI({
      tagList(
        h3("Formação"),
        if (!is.null(EDUCATION_DATA)) {
          lapply(EDUCATION_DATA, function(e) tags$div(tags$strong(e$degree), tags$p(e$institution)))
        } else p("Nenhum dado de formação disponível.")
      )
    })
  })
}
