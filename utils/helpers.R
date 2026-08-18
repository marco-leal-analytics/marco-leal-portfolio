library(htmltools)
library(glue)

safe_html <- function(x) {
  if (is.null(x)) return("")
  htmltools::htmlEscape(as.character(x))
}

format_date_iso <- function(date) {
  if (is.null(date)) return("")
  tryCatch(as.character(as.Date(date)), error = function(e) as.character(date))
}

badge <- function(text, class = "badge bg-secondary") {
  tags$span(class = class, text)
}

sanitize_input <- function(x) {
  if (is.null(x)) return("")
  # basic trimming and escaping; for production, extend validation
  x <- as.character(x)
  x <- trimws(x)
  htmltools::htmlEscape(x)
}

