library(shiny)

mod_projects_ui <- function(id) {
  ns <- NS(id)
  tagList(
  div(class = "page-header",
    h2("Projetos"),
    div(class = "filters",
      textInput(ns("q"), "Pesquisar", placeholder = "Buscar por título ou tecnologia...")
    )
  ),

  div(class = "projects-tabs", uiOutput(ns("projects_tabs_ui")))
  )
}
