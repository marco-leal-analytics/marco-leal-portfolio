library(shiny)

mod_contact_ui <- function(id) {
  ns <- NS(id)
  tagList(
    ui_card(title = "Contato",
            subtitle = "Fale comigo",
            footer = NULL,
            tags$div(
              textInput(ns("name"), "Nome"),
              textInput(ns("email"), "Email"),
              textAreaInput(ns("message"), "Mensagem"),
              actionButton(ns("send"), "Enviar", class = "btn-primary")
            )
    ),
    div(class = "py-4",
        h3("Redes"),
        tags$ul(
          tags$li(tags$a(href = "https://github.com/", "GitHub")),
          tags$li(tags$a(href = "https://www.linkedin.com/", "LinkedIn"))
        )
    )
  )
}
