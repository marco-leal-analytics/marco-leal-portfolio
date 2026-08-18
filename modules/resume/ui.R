library(shiny)

mod_resume_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("Currículo"),
    uiOutput(ns("resume_content"))
  )
}
