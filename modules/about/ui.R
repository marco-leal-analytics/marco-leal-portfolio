library(shiny)

# Incorpora a página Quarto que documenta a plataforma do portfólio.
mod_about_ui <- function(id) {
  document_path <- file.path("modules", "about", "about-marco-leal-platform.html")
  document_mtime <- file.info(document_path)$mtime
  document_version <- if (is.na(document_mtime)) "latest" else format(document_mtime, "%Y%m%d%H%M%S")

  tags$div(class = "qmd-home-wrapper",
    tags$section(class = "resume-main qmd-document-shell",
      tags$iframe(
        class = "qmd-document-frame",
        src = paste0("about-document/about-marco-leal-platform.html?v=", document_version),
        title = "Sobre a plataforma Marco Leal Portfolio",
        scrolling = "no",
        onload = "this.style.height = this.contentWindow.document.documentElement.scrollHeight + 'px';"
      )
    )
  )
}
