library(shiny)

mod_home_ui <- function(id) {
  ns <- NS(id)
  tagList(
    
    tags$div(class = "qmd-home-wrapper",
  
      tags$section(class = "resume-main qmd-document-shell",
        tags$iframe(
          class = "qmd-document-frame",
          src = "home-document/home-marco-leal-analytics.html",
          title = "Sobre Marco Leal Analytics",
          scrolling = "no",
          onload = "this.style.height = this.contentWindow.document.documentElement.scrollHeight + 'px';"
        )
      )
    )
  )
}
