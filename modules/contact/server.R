library(shiny)

mod_contact_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$send, {
      name <- sanitize_input(input$name)
      email <- sanitize_input(input$email)
      message <- sanitize_input(input$message)
      # Basic validation
      if (nzchar(name) && nzchar(email) && nzchar(message)) {
        showNotification("Mensagem enviada (simulada)", type = "message")
      } else {
        showNotification("Por favor preencha todos os campos.", type = "error")
      }
    })
  })
}
