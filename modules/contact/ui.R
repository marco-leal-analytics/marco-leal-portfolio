library(shiny)
mod_contact_ui <- function(id) {
  print(id)
  print(class(id))
  print(typeof(id))
  ns <- shiny::NS(id)

  tagList(
    tags$section(
      class = "module-shell contact-module",

      tags$div(
        class = "mla-hero module-hero",

        tags$div(
          class = "hero-copy",
          tags$span(
            class = "eyebrow",
            "MARCO LEAL · CONTATO"
          ),
          tags$h1("Vamos transformar dados em resultado"),
          tags$p(
            class = "hero-summary",
            "Converse sobre analytics, automação, estatística aplicada e produtos de dados."
          )
        ),

        tags$div(
          class = "hero-visual hero-mark",
          tags$span("CONNECT")
        )
      ),

      tags$div(
        class = "contact-layout",

        div(
  class = "contact-card",

  h2("Contato"),
  p("Envie uma mensagem"),

  textInput(
    ns("name"),
    "Nome"
  ),

  textInput(
    ns("email"),
    "E-mail"
  ),

  textAreaInput(
    ns("message"),
    "Mensagem",
    rows = 6
  ),

  actionButton(
    ns("send"),
    "Enviar mensagem"
  )
),

        div(
          class = "contact-panel",

          h3("Redes profissionais"),

          tags$ul(
            class = "social-links",

            tags$li(
              tags$a(
                href = "https://github.com/marcoleal",
                target = "_blank",
                icon("github"),
                " GitHub"
              )
            ),

            tags$li(
              tags$a(
                href = "https://linkedin.com/in/seu-linkedin",
                target = "_blank",
                icon("linkedin"),
                " LinkedIn"
              )
            )
          )
        )
      )
    )
  )
}