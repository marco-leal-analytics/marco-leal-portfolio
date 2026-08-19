library(shiny)

mod_about_ui <- function(id) {
  ns <- NS(id)
  tagList(
    ui_card(title = "Sobre",
            subtitle = "Biografia e competências",
            image = NULL,
            footer = NULL,
            tags$p("Biografia curta. Competências técnicas e diferenciais.")
    ),
    div(class = "py-4",
        h3("Competências"),
        uiOutput(ns("skills"))
    )
  )
}
