library(shiny)
library(htmltools)

# Generic UI Card
ui_card <- function(title = NULL, subtitle = NULL, image = NULL, footer = NULL, ... ) {
  tagList(
    div(class = "ui-card",
        if (!is.null(image)) tags$div(class = "card-image", tags$img(src = image, alt = safe_html(title))),
        tags$div(class = "card-body",
                 if (!is.null(title)) tags$h4(title),
                 if (!is.null(subtitle)) tags$p(class = "muted", subtitle),
                 tags$div(...)
        ),
        if (!is.null(footer)) tags$div(class = "card-footer", footer)
    )
  )
}

# KPI Card with main metric and optional delta/sparkline
kpi_card <- function(label, value, delta = NULL, sparkline = NULL, subtitle = NULL, width = NULL, id = NULL) {
  style <- if (!is.null(width)) paste0("width:", width, ";") else NULL
  tagList(
    div(class = "kpi-card", id = id, style = style,
        tags$div(class = "kpi-value", tags$strong(value)),
        tags$div(class = "kpi-label", label),
        if (!is.null(subtitle)) tags$div(class = "kpi-sub", subtitle),
        if (!is.null(delta)) tags$div(class = "kpi-delta", delta),
        if (!is.null(sparkline)) tags$div(class = "kpi-sparkline", sparkline)
    )
  )
}
