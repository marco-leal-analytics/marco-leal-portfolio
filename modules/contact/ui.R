library(shiny)

# A aba Contato atualmente exibe apenas links para redes profissionais.
mod_contact_ui <- function(id) {
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
          ),
          tags$div(
            class = "tag-row",
            tags$span(class = "mla-tag accent", "Statistics"),
            tags$span(class = "mla-tag accent", "Data Science"),
            tags$span(class = "mla-tag accent", "Data Analytics"),
            tags$span(class = "mla-tag accent", "Business Intelligence"),
            tags$span(class = "mla-tag accent", "Data Engineering")
          )
        ),

        tags$div(
          class = "hero-visual hero-mark",
          tags$span("CONNECT")
        ),

        div(
          class = "contact-panel",

          h3("Redes profissionais"),

          tags$ul(
            class = "social-links",

      
              tags$a(
                href = "https://github.com/marco-leal-analytics",
                target = "_blank",
                icon("github"),
                " GitHub"
              )
            ,

        
              tags$a(
                href = "https://www.linkedin.com/in/marco-a-v-leal/",
                target = "_blank",
                icon("linkedin"),
                " LinkedIn"
              )
            
          )
        )
      )
    )
  )
}