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
    uiOutput(ns("projects_list")),
    div(style = "text-align:center; margin-top:12px;", actionButton(ns("load_more"), "Carregar mais", class = "btn-primary"))
  )
}
