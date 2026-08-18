library(shiny)

mod_contact_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$send, {
      name <- sanitize_input(input$name)
      email <- sanitize_input(input$email)
      message <- sanitize_input(input$message)
      # In production: validate and send email / webhook securely
      showNotification("Mensagem enviada (simulada)", type = "message")
    })
  })
}
