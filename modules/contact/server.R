
library(shiny)

# A aba Contato não possui fluxo no servidor enquanto o envio de mensagens estiver desativado.
mod_contact_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}