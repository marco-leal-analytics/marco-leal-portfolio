library(shiny)

# A aba inicial não possui controles reativos; o conteúdo vem do iframe Quarto.
mod_home_server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}
