library(shiny)

mod_projects_ui <- function(id) {
  ns <- NS(id)
  tagList(
  tags$section(class = "module-shell projects-module",
    tags$div(class = "mla-hero module-hero",
      tags$div(class = "hero-copy",
        tags$span(class = "eyebrow", "MARCO LEAL · PORTFÓLIO"),
        tags$h1("Projetos que chegam à decisão"),
        tags$p(class = "hero-summary", "Explore soluções de dados, dashboards e automações construídas para resolver problemas reais de negócio."),
        tags$div(class = "tag-row", tags$span(class = "mla-tag accent", "Analytics"), tags$span(class = "mla-tag", "Data Science"), tags$span(class = "mla-tag", "Business Intelligence"))
      ),
      tags$div(class = "hero-visual hero-mark", tags$span("PROJETOS"))
    ),
    div(class = "page-header module-header",
      h2("Projetos"),
      div(class = "filters",
        textInput(ns("q"), "Pesquisar", placeholder = "Buscar por título ou tecnologia...")
      )
    ),

    div(class = "projects-tabs", uiOutput(ns("projects_tabs_ui")))
  )
  )
}
