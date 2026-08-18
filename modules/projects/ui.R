library(shiny)

mod_projects_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("Projetos"),
    textInput(ns("q"), "Pesquisar"),
    uiOutput(ns("projects_list"))
  )
}
