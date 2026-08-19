library(shiny)

mod_blog_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "page-header", h2("Blog")),
    uiOutput(ns("posts"))
  )
}
