library(shiny)

# A página Sobre é um documento Quarto estático, sem controles reativos.
mod_about_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
