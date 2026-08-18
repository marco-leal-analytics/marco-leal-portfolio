library(shiny)

mod_contact_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("Contato"),
    textInput(ns("name"), "Nome"),
    textInput(ns("email"), "Email"),
    textAreaInput(ns("message"), "Mensagem"),
    actionButton(ns("send"), "Enviar")
  )
}
