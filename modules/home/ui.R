library(shiny)

mod_home_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "hero",
        h1("Olá — Marco Leal"),
        p("Engenheiro de Dados e Cientista de Dados. Portfólio e projetos."),
        uiOutput(ns("kpis"))
    )
  )
}
