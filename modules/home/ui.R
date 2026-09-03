library(shiny)

# Aba inicial: incorpora a apresentação Quarto pré-renderizada em largura total.
mod_home_ui <- function(id) {
  document_path <- file.path("modules", "home", "home-marco-leal-analytics.html")
  document_mtime <- file.info(document_path)$mtime
  document_version <- if (is.na(document_mtime)) "latest" else format(document_mtime, "%Y%m%d%H%M%S")

  tagList(
    tags$div(class = "qmd-home-wrapper",
      tags$section(class = "resume-main qmd-document-shell",
        tags$iframe(
          class = "qmd-document-frame",
          src = paste0("home-document/home-marco-leal-analytics.html?v=", document_version),
          title = "Perfil de Marco Leal Analytics",
          scrolling = "auto",
          onload = paste0(
            "var frame=this;",
            "var resize=function(){var doc=frame.contentWindow.document;",
            "frame.style.height=Math.max(doc.documentElement.scrollHeight,doc.body.scrollHeight)+'px';};",
            "resize();",
            "if(frame.contentWindow.ResizeObserver){",
            "new frame.contentWindow.ResizeObserver(resize).observe(frame.contentWindow.document.documentElement);",
            "} else {setTimeout(resize,100);setTimeout(resize,500);}"
          )
        )
      )
    )
  )
}
