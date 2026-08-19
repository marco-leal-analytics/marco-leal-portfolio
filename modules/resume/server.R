library(shiny)

mod_resume_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$resume_content <- renderUI({
      tagList(
        h3("Formação"),
        if (!is.null(EDUCATION_DATA)) {
          lapply(EDUCATION_DATA, function(e) ui_card(title = e$degree, subtitle = e$institution, footer = tags$small(format_date_iso(e$start_date) %/% " - " %||% "")))
        } else p("Nenhum dado de formação disponível."),
        h3("Experiência"),
        if (!is.null(EXPERIENCE_DATA)) {
          lapply(EXPERIENCE_DATA, function(exp) ui_card(title = paste0(exp$title, " @ ", exp$company), subtitle = paste0(format_date_iso(exp$start_date), " - ", format_date_iso(exp$end_date)), footer = tags$ul(lapply(exp$responsibilities, tags$li))))
        } else p("Nenhuma experiência disponível."),
        h3("Certificações"),
        if (!is.null(CERTS_DATA)) {
          lapply(CERTS_DATA, function(c) ui_card(title = c$name, subtitle = c$issuer, footer = tags$small(format_date_iso(c$date))))
        } else p("Nenhuma certificação disponível.")
      )
    })
  })
}
