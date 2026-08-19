library(shiny)

mod_home_ui <- function(id) {
  ns <- NS(id)
  tagList(
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

                   tags$div(class = "section", id = ns("education"),
                            tags$div(class = "section-title", "Formação Acadêmica"),
                            tags$div(class = "timeline", uiOutput(ns("education_timeline")))
                   ),

                   tags$div(class = "section", id = ns("experience"),
                            tags$div(class = "section-title", "Experiência Profissional"),
                            tags$div(class = "timeline", uiOutput(ns("experience_timeline")))
                   ),

                   tags$div(class = "section", id = ns("tech"),
                            tags$div(class = "section-title", "Tech Stack · Competências · Certificações"),
                            tags$div(class = "three-col-row",
                                     tags$div(class = "three-col-item",
                                              tags$div(class = "section-subtitle", "Tech Stack"),
                                              uiOutput(ns("tech_stack"))
                                     ),
                                     tags$div(class = "three-col-item",
                                              tags$div(class = "section-subtitle", "Competências"),
                                              uiOutput(ns("competencies_text"))
                                     ),
                                     tags$div(class = "three-col-item",
                                              tags$div(class = "section-subtitle", "Certificações"),
                                              uiOutput(ns("certifications_list"))
                                     )
                            )
                   ),

                   tags$div(class = "section", id = ns("languages"),
                            tags$div(class = "section-title", "Idiomas"),
                            uiOutput(ns("languages"))
                   ),

                   tags$div(class = "section", id = ns("projects"),
                            tags$div(class = "section-title", "Projetos Relevantes"),
                            uiOutput(ns("highlight_projects"))
                   ),

                   tags$div(class = "section", id = ns("footer"),
                            uiOutput(ns("footer_keywords"))
                   )
      )
    ),

    tags$nav(class = "sticky-side-nav",
             tags$a(href = paste0("#", ns("education")), "Formação"),
             tags$a(href = paste0("#", ns("experience")), "Experiência"),
             tags$a(href = paste0("#", ns("tech")), "Tech Stack"),
             tags$a(href = paste0("#", ns("languages")), "Idiomas"),
             tags$a(href = paste0("#", ns("projects")), "Projetos")
    )
  )
}
