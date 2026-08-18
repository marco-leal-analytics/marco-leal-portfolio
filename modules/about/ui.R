library(shiny)

mod_about_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("Sobre"),
    p("Biografia curta. Competências técnicas e diferenciais.")
  )
}
