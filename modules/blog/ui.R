library(shiny)

mod_blog_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$section(class = "module-shell blog-module",
      tags$div(class = "mla-hero module-hero",
        tags$div(class = "hero-copy",
          tags$span(class = "eyebrow", "MARCO LEAL ANALYTICS · INSIGHTS"),
          tags$h1("Ideias para tornar dados úteis"),
          tags$p(class = "hero-summary", "Notas sobre design de produtos analíticos, engenharia de dados, visualização e decisões orientadas por evidências.")
        ),
        tags$div(class = "hero-visual hero-mark", tags$span("INSIGHT"))
      ),
      div(class = "page-header module-header", h2("Blog")),
      uiOutput(ns("posts"))
    )
  )
}
