library(shiny)

mod_blog_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("Blog"),
    p("Artigos e estudos técnicos."),
    uiOutput(ns("posts"))
  )
}
