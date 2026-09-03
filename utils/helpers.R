library(htmltools)
library(glue)

# Escapa texto antes de inseri-lo no HTML gerado pelo Shiny.
safe_html <- function(x) {
  if (is.null(x)) return("")
  htmltools::htmlEscape(as.character(x))
}

# Formata datas para exibição e preserva valores que não podem ser convertidos.
format_date_iso <- function(date) {
  if (is.null(date)) return("")
  tryCatch(as.character(as.Date(date)), error = function(e) as.character(date))
}

# Cria a marcação compartilhada de badges para habilidades e status compactos.
badge <- function(text, class = "badge bg-secondary") {
  tags$span(class = class, text)
}

# Remove espaços da entrada e escapa HTML antes de validar ou exibir o valor.
sanitize_input <- function(x) {
  if (is.null(x)) return("")
  # basic trimming and escaping; for production, extend validation
  x <- as.character(x)
  x <- trimws(x)
  htmltools::htmlEscape(x)
}

