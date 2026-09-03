library(shiny)

# Aba Sobre: apresenta o posicionamento profissional e uma lista dinâmica de tecnologias.
mod_about_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$section(class = "module-shell about-module",
      tags$div(class = "mla-hero module-hero",
        tags$div(class = "hero-copy",
          tags$span(class = "eyebrow", "MARCO LEAL ANALYTICS · SOBRE"),
          tags$h1("Dados que transformam decisões"),
          tags$p(class = "hero-summary", "Engenharia de dados, estatística aplicada e visualização orientadas a impacto mensurável.")
        ),
        tags$div(class = "hero-visual hero-mark", tags$span("MLA"))
      ),
      tags$div(class = "insight-grid about-grid",
        tags$article(class = "insight-box highlight", tags$strong("Missão"), tags$p("Construir soluções analíticas confiáveis que aproximam dados de decisões melhores.")),
        tags$article(class = "insight-box", tags$strong("Método"), tags$p("Combinar engenharia, análise e comunicação para entregar clareza em ciclos curtos.")),
        tags$article(class = "insight-box", tags$strong("Valor"), tags$p("Reduzir fricção operacional e transformar complexidade em ação executiva."))
      ),
      ui_card(
        title = "Sobre",
        subtitle = "Biografia e proposta de valor",
        image = NULL,
        footer = NULL,
        tags$div(
        tags$p("Sou um profissional de dados com foco em construir soluções analíticas e produtos de dados que transformam decisões de negócio. Minha abordagem combina engenharia de dados, análise avançada e visualização para entregar insights acionáveis rapidamente."),
        tags$p("Este portfólio apresenta experiências, projetos e competências organizadas para uma leitura objetiva — ideal para recrutadores e gestores que precisam avaliar fit técnico e impacto em menos de 10 segundos."),
        tags$h4("Proposta de valor"),
        tags$ul(
          tags$li("Entregar dashboards e pipelines confiáveis que reduzem o tempo para decisão"),
          tags$li("Traduzir problemas de negócio em análises replicáveis e automatizadas"),
          tags$li("Comunicar resultados com clareza para times técnicos e não-técnicos")
        ),
        tags$h4("Principais conquistas"),
        tags$ul(
          tags$li("Liderança técnica em projetos de analytics end-to-end"),
          tags$li("Implementação de pipelines que reduziram latência de dados e custos operacionais"),
          tags$li("Desenvolvimento de soluções de machine learning para classificação e recomendação")
        ),
        tags$h4("Call to action"),
        tags$p("Para um resumo detalhado, faça download do CV ou veja a aba Home. Para contato direto, use a seção 'Contatos' no lado esquerdo."),
        tags$p(tags$a(href = "assets/www/Marco-Aurelio-Valles-Leal.pdf", "Download CV (PDF)", target = "_blank", rel = "noopener noreferrer"))
        )
      ),

    div(class = "py-4 module-section",
        h3("Competências técnicas e ferramentas"),
        uiOutput(ns("skills")),
        tags$p("Principais áreas: Análise de Dados, Engenharia de Dados, Estatística Aplicada, Visualização e Machine Learning.")
      )
    )
  )
}
