library(shiny)

# Dados provisórios do blog; substituir esta saída pelo repositório futuro de posts.
mod_blog_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$posts <- renderUI({
      # Placeholder: create sample cards
      tagList(
        div(class = "posts-grid",
            ui_card(title = "Artigo: Melhores práticas em Shiny", subtitle = "Design e performance", footer = tags$a(href="#", "Ler")),
            ui_card(title = "Estudo: Visualizações com echarts4r", subtitle = "Técnicas avançadas", footer = tags$a(href="#", "Ler"))
        )
      )
    })
  })
}
