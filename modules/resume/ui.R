library(shiny)

mod_resume_ui <- function(id) {
  ns <- NS(id)
  tagList(
   
   
  
    tags$div(class = "mla-hero module-hero",
      tags$div(class = "hero-copy",
        tags$span(class = "eyebrow", "MARCO LEAL · CURRÍCULO"),
        tags$h1("Formação, experiência e trajetória profissional"),
        tags$p(
          class = "hero-summary",
          "Uma visão consolidada da minha jornada em Estatística, Ciência de Dados, Business Intelligence e desenvolvimento de soluções analíticas."
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
        tags$span("CURRÍCULO")
      )
    ),
    
      fluidRow(
         column(3,
                HTML('
                      <div class="callout-success">
                        <h2>Propósito</h2>
                        <p>
                          Trabalhar com dados, para mim, significa ajudar organizações a reduzir
                          incertezas e tomar decisões melhores. Quero desenvolver soluções que
                          aproximem dados, pessoas e decisões, transformando informação dispersa
                          em conhecimento acionável e processos manuais em soluções mais
                          estruturadas, automatizadas e escaláveis.
                        </p>
                      </div>
                    ')
               ),
         column(3,
               HTML('
                  <div class="callout-success">
                    <h2>Visão</h2>
                    <p>
                      Minha visão profissional é evoluir continuamente na construção de
                      soluções de Analytics, Ciência de Dados e Estatística Aplicada,
                      ampliando a capacidade de conectar métodos quantitativos, tecnologia
                      e estratégia.
                    </p>
                  </div>
                        ')
                  ),
         column(3,
                HTML('
                    <div class="callout-success">
                      <h2>Missão</h2>
                      <p>
                        Transformar dados em inteligência aplicada, utilizando estatística,
                        tecnologia e visão de negócio para desenvolver soluções analíticas
                        que apoiem decisões melhores e gerem valor mensurável.
                      </p>
                    </div>
                    ')
                  ),
         column(3,
                HTML('
    <div class="callout-success">
      <h2>Objetivo</h2>
      <p>
        Meu objetivo é continuar evoluindo como profissional de dados enquanto
        transformo problemas reais em soluções que façam diferença.
      </p>
    </div>
  ')
         )
                ),



    tags$div(class = "resume-wrapper",
      tags$aside(class = "resume-sidebar",
               tags$div(class = "resume-photo", tags$img(src = "assets/www/foto_perfil.jpg", alt = "Foto de Marco")),
               
               tags$div(class = "sidebar-row",
                        tags$div(class = "sidebar-section",
                                 tags$h4("Contatos"),
                                 uiOutput(ns("sidebar_contact"))
                        ),
                        tags$div(class = "sidebar-section",
                                 tags$h4("Links"),
                                 uiOutput(ns("sidebar_links"))
                        )
               ),
               
               tags$div(class = "sidebar-section",
                        tags$h4("Sobre"),
                        uiOutput(ns("about_text_short"))
               )
      ),

      tags$section(class = "resume-main",
                   tags$div(class = "resume-header",
                            tags$div(class = "resume-name", uiOutput(ns("name_title")) ),
                            tags$div(class = "resume-title", uiOutput(ns("headline")))
                   ),
     

                 

                   tags$div(class = "section", id = ns("experience"),
                            tags$div(class = "section-title", "Experiência Profissional"),
                            tags$div(class = "timeline", uiOutput(ns("experience_timeline")))
                   ),

                   tags$div(
                              class = "section",
                              id = ns("skills"),

                              tags$div(
                                class = "section-title",
                                "Habilidades"
                              ),
                              tags$div(uiOutput(ns("skills_text")))
                              # tags$div(
                              #   class = "two-col-row",
                              # 
                              #   tags$div(
                              #     class = "two-col-item",
                              #     tags$div(
                              #       class = "section-subtitle",
                              #       "Tech Stack"
                              #     ),
                              #     uiOutput(ns("tech_stack"))
                              #   ),
                              # 
                              #   tags$div(
                              #     class = "two-col-item",
                              #     tags$div(
                              #       class = "section-subtitle",
                              #       "Competências e Especialidades"
                              #     ),
                              #     uiOutput(ns("competencies_text"))
                              #   )
                              # )
                            ),
                   
                   tags$div(class = "section", id = ns("projects"),
                            tags$div(class = "section-title", "Projetos Relevantes"),
                            uiOutput(ns("highlight_projects"))
                   ),
                   tags$div(class = "section", id = ns("education"),
                            tags$div(class = "section-title", "Formação Acadêmica"),
                            tags$div(class = "timeline", uiOutput(ns("education_timeline")))
                   ),
                   tags$div(class = "section", id = ns("certifications"),
                            tags$div(class = "section-title", "Certificações"),
                            uiOutput(ns("certifications_list"))
                   ),

                   tags$div(class = "section", id = ns("languages"),
                            tags$div(class = "section-title", "Idiomas"),
                            uiOutput(ns("languages"))
                   ),

                   tags$div(class = "section", id = ns("footer"),
                            uiOutput(ns("footer_keywords"))
                   )
      )
    ),

    tags$nav(class = "sticky-side-nav",
   
             tags$a(href = paste0("#", ns("experience")), "Experiência"),
             tags$a(href = paste0("#", ns("skills")), "Habilidades"),
             tags$a(href = paste0("#", ns("projects")), "Projetos"),
             tags$a(href = paste0("#", ns("education")), "Formação"),
             tags$a(href = paste0("#", ns("certifications")), "Certificações"),
             tags$a(href = paste0("#", ns("languages")), "Idiomas")
            
    )
  )
}
