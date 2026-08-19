
library(shiny)
source("utils/send_email.R")
readRenviron(".Renviron")
mod_contact_server <- function(id) {

  moduleServer(id, function(input, output, session) {

   observeEvent(input$send, {

  name <- sanitize_input(input$name)
  email <- sanitize_input(input$email)
  message <- sanitize_input(input$message)

  if (
    !nzchar(name) ||
    !nzchar(email) ||
    !nzchar(message)
  ) {

    showNotification(
      "Por favor preencha todos os campos.",
      type = "error"
    )

    return()
  }

  tryCatch({

    send_contact_email(
      name = name,
      email = email,
      message = message
    )

    updateTextInput(
      session,
      "name",
      value = ""
    )

    updateTextInput(
      session,
      "email",
      value = ""
    )

    updateTextAreaInput(
      session,
      "message",
      value = ""
    )

    showNotification(
      "Mensagem enviada com sucesso!",
      type = "message"
    )

  }, error = function(e) {

    showNotification(
      paste("Erro ao enviar:", e$message),
      type = "error"
    )

  })

})

  })

}