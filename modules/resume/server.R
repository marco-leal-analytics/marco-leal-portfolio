library(shiny)

mod_resume_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    projects_df <- reactive({ read_projects("data/projects.yml") })
    resume_data <- reactive({ read_yaml_safe(file.path(DATA_DIR, "resume_full.yml")) })

    # helper: format date strings to Brazilian format (MM/YYYY or YYYY)
    fmt_br <- function(d) {
      if (is.null(d) || !nzchar(d)) return("")
      # expected formats: YYYY-MM, YYYY-MM-DD, YYYY
      parts <- unlist(strsplit(d, "-"))
      if (length(parts) >= 2) {
        yr <- parts[1]
        mo <- parts[2]
        # pad month
        if (nchar(mo) == 1) mo <- sprintf("%02s", mo)
        return(paste0(mo, "/", yr))
      }
      return(d)
    }

    output$kpi_row <- renderUI({
      df <- projects_df()
      num_projects <- if (is.data.frame(df)) nrow(df) else 0
      num_certs <- if (!is.null(CERTS_DATA)) length(CERTS_DATA) else 0
      num_experience <- if (!is.null(EXPERIENCE_DATA)) length(EXPERIENCE_DATA) else 0

      tagList(
        div(class = "kpi-grid", 
            kpi_card("Projetos", num_projects, subtitle = "Destacados"),
            kpi_card("Certificações", num_certs),
            kpi_card("Experiências", num_experience)
        )
      )
    })

    output$professional_summary <- renderUI({
      rd <- resume_data()
      summary_text <- NULL
      if (!is.null(rd$summary)) summary_text <- rd$summary
      if (is.null(summary_text)) {
        # fallback constructed from known resume fields
        summary_text <- paste(
          "Cientista de Dados com formação em Estatística (UEM) e experiência prática em análise de dados, modelagem estatística,",
          "business intelligence, automação e engenharia de dados. Atuação em ambientes corporativos focados em crédito, finanças e tomada de decisão baseada em dados."
        )
      }
      tagList(
        tags$p(summary_text),
        tags$p(tags$strong("Formação: "), "Bacharelado em Estatística (UEM); MBA em Gestão Empresarial (FGV) em andamento."),
        tags$p(tags$strong("Perfil: "), "Experiência corporativa em Sicredi e Crefaz com entrega de pipelines, dashboards e automações que geram eficiência operacional e suporte à decisão." )
      )
    })

    output$keywords_tags <- renderUI({
      # keywords derived from CV
      kws <- c(
        "Data Science","Statistics","Machine Learning","Predictive Analytics","Data Analytics","Data Visualization",
        "Business Intelligence","Data Engineering","ETL","SQL","Python","R","Power BI","Shiny","Automation",
        "Credit Analytics","Risk Analytics","Statistical Modeling","Dashboard Development","Decision Support",
        "Data Pipelines","KPI Monitoring","Financial Analytics"
      )
      tags$div(class = "keywords-wrap", lapply(kws, function(k) tags$span(class = "tag keyword", k)))
    })

    output$impact_metrics <- renderUI({
      rd <- resume_data()
      # from parsed resume: 12k atendimentos, 5k exclusões, ~R$14k savings
      tagList(
        div(class = "kpi-grid",
            kpi_card("12k+", "Atendimentos automatizados", subtitle = "NLP & automação via WhatsApp"),
            kpi_card("5k+", "Associados excluídos automaticamente", subtitle = "Automação de processo"),
            kpi_card("R$14k", "Redução de custo mensal estimada", subtitle = "Impacto operacional")
        ),
        div(style = "margin-top:12px;",
            tags$p("Outros impactos: construção de pipelines ETL com Luigi e Postgres; dashboards executivos para monitoramento de políticas de crédito; automações que reduziriam trabalho manual e melhoram confiabilidade dos dados.")
        )
      )
    })

    output$core_expertise <- renderUI({
      expertise <- list(
        "Data Science" = "Modelagem estatística, validação cruzada, simulações e avaliação de desempenho de modelos.",
        "Analytics" = "Análises exploratórias, indicadores de performance e dashboards para tomada de decisão.",
        "Statistics" = "Fundação sólida em estatística aplicada, métodos não-paramétricos, LOESS, splines e técnicas de suavização.",
        "Business Intelligence" = "Desenvolvimento de dashboards e relatórios em Power BI e ferramentas analíticas.",
        "Data Engineering" = "Pipelines ETL com Python e Luigi; ingestão e orquestração de dados em Postgres.",
        "Automation" = "Automação de processos com UiPath e scripts Python para reduzir tarefas manuais.",
        "Credit Analytics" = "Análises e monitoramento de políticas de crédito, avaliação de regras e impacto em funil de aprovação.",
        "Financial Analytics" = "Estudos contábeis e analíticos voltados a custos, balanços e indicadores financeiros."
      )
      tagList(lapply(names(expertise), function(k) ui_card(title = k, subtitle = expertise[[k]])))
    })

    output$tech_stack <- renderUI({
      rd <- resume_data()
      if (is.null(rd$tech_stack)) return(NULL)
      stacks <- rd$tech_stack
      # render each YAML category as a single bullet line with items separated by ' | '
      tags$ul(class = "tech-stack-list",
              lapply(names(stacks), function(cat) {
                items_vec <- unlist(stacks[[cat]])
                items_line <- paste(items_vec, collapse = " | ")
                tags$li(
                  tags$span(class = "section-subtitle", paste0(cat, ": ")),
                  tags$span(class = "stack-inline section-small", items_line)
                )
              })
      )
    })

    output$highlight_projects <- renderUI({
      rd <- resume_data()
      projects <- rd$projects
      if (is.null(projects) || length(projects) == 0) return(tags$p("Nenhum projeto listado."))
      tagList(lapply(projects, function(p) {
        tags$div(style = "margin-bottom:12px;",
                 tags$strong(p$title),
                 tags$p(style = "margin:4px 0;", p$short_description %||% ""),
                 tags$small(
                   if (!is.null(p$repo)) tags$a(href = p$repo, "GitHub", target = "_blank"), " ",
                   if (!is.null(p$demo)) tags$a(href = p$demo, "Demo", target = "_blank")
                 )
        )
      }))
    })

    output$career_snapshot <- renderUI({
      tagList(
        ui_card(title = "Sicredi Agroempresarial — Analista Administrativo II", subtitle = "02/2024 — 08/2026 — Mandaguari/PR", footer = tags$ul(
          tags$li("Estudos contábeis e financeiros; otimização de custos e análise de balanço."),
          tags$li("Pipelines de dados e automações para aquisição diária com Luigi e Postgres."),
          tags$li("Plataforma web em Shiny para vendas de imobilizado e dashboards em Power BI.")
        )),
        ui_card(title = "Crefaz — Cientista de Dados Pleno / Analista de Dados", subtitle = "05/2021 — 02/2024 — Maringá/PR", footer = tags$ul(
          tags$li("Monitoramento de políticas de crédito e dashboards de originação."),
          tags$li("Automação e integração entre sistemas legados e novos com Python/PySpark."),
          tags$li("Construção de indicadores operacionais e análises preditivas.")
        ))
      )
    })

    output$education_highlights <- renderUI({
      tagList(
        ui_card(title = "Bacharelado em Estatística", subtitle = "Universidade Estadual de Maringá — UEM", footer = tags$small("2017 — 2022")),
        ui_card(title = "MBA em Gestão Empresarial (ênfase em Finanças)", subtitle = "Fundação Getúlio Vargas — FGV", footer = tags$small("2026 — Em andamento"))
      )
    })

    ## Timeline-style education (plain text, no cards)
    output$education_timeline <- renderUI({
      rd <- resume_data()
      if (is.null(rd$education) || length(rd$education) == 0) return(tags$p("Nenhuma formação disponível."))
      items <- lapply(rd$education, function(ed) {
        date_range <- if (!is.null(ed$end) && nzchar(ed$end)) paste0(fmt_br(ed$start), " — ", fmt_br(ed$end)) else fmt_br(ed$start)
        tags$div(class = "timeline-item",
                 tags$div(class = "timeline-date", date_range),
                 tags$div(class = "timeline-content",
                          tags$h5(ed$degree),
                          tags$div(class = "meta", ed$institution)
                 )
        )
      })
      tagList(items)
    })


 render_experience_bullets <- function(bullets, level = 1) {

  if (is.null(bullets) || length(bullets) == 0) {
    return(NULL)
  }

  # Classe CSS de acordo com o nível
  ul_class <- switch(
    as.character(level),
    "1" = "experience-bullets",
    "2" = "experience-subbullets",
    "3" = "experience-subsubbullets",
    "experience-subsubbullets"
  )

  tags$ul(
    class = ul_class,

    lapply(bullets, function(bullet) {

      # ---------------------------------------------------------
      # Estrutura antiga:
      # - "Texto"
      # ---------------------------------------------------------
      if (is.character(bullet)) {

        return(
          tags$li(
            class = paste0(
              "experience-bullet-level-",
              level
            ),

            bullet
          )
        )
      }

      # ---------------------------------------------------------
      # Estrutura nova:
      # - text: "Texto"
      #   subbullets:
      #     - "Subtexto"
      # ---------------------------------------------------------

      bullet_text <- bullet$text %||% ""

      # Aceita a estrutura correta "subbullets"
      # e também tolera temporariamente o erro "subbulets"
      subbullets <- bullet$subbullets

      if (is.null(subbullets)) {
        subbullets <- bullet$subbulets
      }

      tags$li(
        class = paste0(
          "experience-bullet-level-",
          level
        ),

        tags$span(
          class = "bullet-text",
          bullet_text
        ),

        # -------------------------------------------------------
        # Renderiza recursivamente os subbullets
        # -------------------------------------------------------
        if (!is.null(subbullets) && length(subbullets) > 0) {

          render_experience_bullets(
            subbullets,
            level = level + 1
          )

        }
      )
    })
  )
}
    ## Timeline-style experience
    # output$experience_timeline <- renderUI({
    #   rd <- resume_data()
    #   if (is.null(rd$experience) || length(rd$experience) == 0) return(tags$p("Nenhuma experiência disponível."))
    #   items <- lapply(rd$experience, function(exp) {
    #     date_range <- if (!is.null(exp$end) && nzchar(exp$end)) paste0(fmt_br(exp$start), " — ", fmt_br(exp$end)) else fmt_br(exp$start)
    #     tags$div(class = "timeline-item",
    #              tags$div(class = "timeline-date", date_range),
    #              tags$div(class = "timeline-content",
    #                       tags$h5(paste0(exp$title, " — ", exp$company)),
    #                       tags$div(class = "meta", exp$location %||% ""),
    #                       tags$ul(lapply(exp$bullets, tags$li))
    #              )
    #     )
    #   })
    #   tagList(items)
    # })

  output$experience_timeline <- renderUI({

  rd <- resume_data()

  if (is.null(rd$experience) || length(rd$experience) == 0) {

    return(
      tags$p("Nenhuma experiência disponível.")
    )

  }

  items <- lapply(rd$experience, function(exp) {

    date_range <- if (
      !is.null(exp$end) &&
      nzchar(exp$end)
    ) {

      paste0(
        fmt_br(exp$start),
        " — ",
        fmt_br(exp$end)
      )

    } else {

      fmt_br(exp$start)

    }

    tags$div(
      class = "timeline-item",

      # ---------------------------------------------------------
      # DATA
      # ---------------------------------------------------------

      tags$div(
        class = "timeline-date",
        date_range
      ),

      # ---------------------------------------------------------
      # CONTEÚDO
      # ---------------------------------------------------------

      tags$div(
        class = "timeline-content",

        tags$h5(
          paste0(
            exp$title,
            " — ",
            exp$company
          )
        ),

        tags$div(
          class = "meta",
          exp$location %||% ""
        ),

        # -------------------------------------------------------
        # BULLETS HIERÁRQUICOS
        # -------------------------------------------------------

        render_experience_bullets(
          exp$bullets
        )
      )
    )
  })

  tagList(items)

})

    ## Competencies as bullet list (for two-column layout)
    output$competencies_text <- renderUI({
      rd <- resume_data()
      comps <- rd$competencies
      if (is.null(comps)) return(tags$p("Competências não disponíveis."))
      tags$ul(class = "competencies-list", lapply(comps, function(x) tags$li(class = "section-small", style = "margin:4px 0;", x)))
    })

    output$certifications_list <- renderUI({
      rd <- resume_data()
      certs <- rd$certifications
      if (is.null(certs) || length(certs) == 0) return(tags$p("Nenhuma certificação listada."))
      tags$ul(class = "certifications-list",
              lapply(certs, function(c) {
                label <- c$name %||% ""
                issuer <- c$issuer %||% ""
                year <- if (!is.null(c$year)) paste0(" (", c$year, ")") else ""
                tags$li(class = "section-small", paste0(label, " — ", issuer, year))
              })
      )
    })

    output$about_text_short <- renderUI({
      rd <- resume_data()
      if (is.null(rd$summary)) return(tags$p("Sobre não disponível."))
      tags$p(class = "section-small", style = "line-height:1.4;", substr(rd$summary, 1, 3000))
    })

    output$sidebar_contact <- renderUI({
      rd <- resume_data()
      if (is.null(rd$contact)) return(tags$p("Contato indisponível."))
      email <- rd$contact$email %||% ""
      phone <- rd$contact$phone %||% ""
      
      tagList(
        tags$div(class = "contact-row",
                 tags$span(class = "icon", HTML('<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>')),
                 tags$a(href = paste0('mailto:', email), class = "sidebar-contact no-wrap", email)
        ),
        tags$div(class = "contact-row",
                 tags$span(class = "icon", HTML('<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M6.62 10.79a15.053 15.053 0 006.59 6.59l2.2-2.2a1 1 0 011.11-.21c1.2.48 2.5.74 3.85.74a1 1 0 011 1V20a1 1 0 01-1 1C9.16 21 3 14.84 3 6a1 1 0 011-1h3.5a1 1 0 011 1c0 1.35.26 2.65.74 3.85a1 1 0 01-.21 1.11l-2.41 2.83z"/></svg>')),
                 tags$span(class = "sidebar-contact no-wrap", phone)
        )
      )

      
    })

    output$sidebar_links <- renderUI({
      rd <- resume_data()
      links <- rd$contact$links
      if (is.null(links)) return(NULL)
      github_link <- links[[1]]$github %||% "#"
      linkedin_link <- links[[2]]$linkedin %||% "#"
                # base link rows (LinkedIn, GitHub)
                link_rows <- list(
             tags$div(class = "link-row",
                 tags$a(href = linkedin_link, target = "_blank", class = "no-wrap",
                   tags$span(class = "icon", HTML('<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M19 3A2 2 0 0 1 21 5v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14zm-9 7H8v7h2v-7zm0-3H8V7h2v0zm5 3h-2v7h2v-4c0-1.1.9-2 2-2s2 .9 2 2v4h2v-5c0-2.21-1.79-4-4-4z"/></svg>')),
                   tags$span("LinkedIn")
                 )
             ),
             tags$div(class = "link-row",
                 tags$a(href = github_link, target = "_blank", class = "no-wrap",
                   tags$span(class = "icon", HTML('<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M12 .5C5.73.5.5 5.73.5 12c0 5.08 3.29 9.39 7.86 10.91.57.11.78-.25.78-.55 0-.27-.01-1-.02-1.96-3.2.7-3.88-1.54-3.88-1.54-.52-1.33-1.28-1.69-1.28-1.69-1.05-.72.08-.71.08-.71 1.16.08 1.77 1.19 1.77 1.19 1.03 1.76 2.7 1.25 3.36.96.11-.75.4-1.25.72-1.54-2.55-.29-5.24-1.28-5.24-5.69 0-1.26.45-2.29 1.19-3.1-.12-.29-.52-1.46.11-3.04 0 0 .97-.31 3.18 1.18a11.07 11.07 0 015.79 0c2.2-1.49 3.17-1.18 3.17-1.18.63 1.58.23 2.75.11 3.04.74.81 1.19 1.84 1.19 3.1 0 4.42-2.69 5.4-5.25 5.68.41.36.78 1.09.78 2.2 0 1.59-.01 2.87-.01 3.26 0 .31.21.67.79.55C20.71 21.39 24 17.08 24 12c0-6.27-5.23-11.5-12-11.5z"/></svg>')),
                   tags$span("GitHub")
                 )
             )
                )

                # search for CV pdf file in common public folders (www/ and assets/www/) and build proper href
                # search_dirs <- c("www", "Resume.pdf")
                # cv_found <- NULL
                # for (d in search_dirs) {
                #   if (dir.exists(d)) {
                #     candidates <- list.files(d, pattern = "Resume*\\.pdf$", ignore.case = TRUE)
                #     if (length(candidates) > 0) {
                #       cv_found <- list(dir = d, file = candidates[1])
                #       break
                #     }
                #   }
                # }
            
             
               href = "assets/www/Resume.pdf"
               cv_row <- tags$div(
  class = "link-row",

  tags$a(
    href = "assets/www/Resume.pdf",
    target = "_blank",
    download = "Resume.pdf",
    class = "no-wrap",

    tags$span(
      class = "icon",
      HTML('
        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M5 20h14v-2H5v2zM11 16h2V8h3l-4-4-4 4h3v8z"/>
        </svg>
      ')
    ),

    tags$span("Download CV")
  )
)

link_rows[[length(link_rows) + 1]] <- cv_row

tagList(
  tags$div(
    class = "sidebar-links",
    link_rows
  )
)
    })

    output$sidebar_skills <- renderUI({
      rd <- resume_data()
      comps <- rd$competencies
      if (is.null(comps)) return(NULL)
      tags$ul(lapply(comps, function(x) tags$li(class = "resume-competency", x)))
    })

    output$name_title <- renderUI({
      rd <- resume_data()
      tags$div(
        tags$span(rd$name),
        tags$div(class = "home-headline", "Data & Analytics | Data Science | Business Intelligence | Estatística Aplicada
")
      )
    })

    output$headline <- renderUI({
      tags$div("Profissional de Dados com experiência em estatística aplicada, Analytics, crédito, finanças, automação e engenharia de dados, transformando dados em insights e soluções para apoiar decisões de negócio.")
    })

    output$competency_bars <- renderUI({
      # Map selected skills to relative proficiency
      profs <- list(Python=90, R=85, SQL=80, Estatistica=95, "Machine Learning"=78, "Data Visualization"=82)
      tagList(lapply(names(profs), function(nm) {
        tags$div(style = "margin-bottom:10px;",
                 tags$div(style = "display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;", tags$strong(nm), tags$small(paste0(profs[[nm]], "%"))),
                 tags$div(class = "skill-bar", tags$div(class = "skill-fill", style = paste0("width:", profs[[nm]], "%;")))
        )
      }))
    })

    output$languages <- renderUI({
      tags$ul(
        tags$li("Inglês — Intermediário")
      )
    })

    output$professional_differentials <- renderUI({
      diffs <- c(
        "Sólida formação estatística aplicada a problemas de negócio.",
        "Experiência comprovada em ambientes corporativos (Sicredi, Crefaz).",
        "Capacidade de entregar soluções ponta a ponta: dados, modelagem e produção de dashboards.",
        "Ênfase em automação e redução de trabalho manual via scripts e RPA.",
        "Foco em crédito, finanças e indicadores de performance." 
      )
      tags$ul(lapply(diffs, tags$li))
    })

    output$recruiter_section <- renderUI({
      rd <- resume_data()
      email <- if (!is.null(rd$contact$email)) rd$contact$email else "marcoaureliolv@gmail.com"
      phone <- if (!is.null(rd$contact$phone)) rd$contact$phone else "+55 44991443909"
      tagList(
        tags$p(tags$strong("Disponibilidade: "), "Aberto a oportunidades alinhadas a Ciência de Dados, Analytics e Engenharia de Dados."),
        tags$p(tags$strong("Contato rápido: "), tags$a(href = paste0("mailto:", email), email)),
        tags$p(tags$strong("Telefone: "), phone),
        tags$p(tags$strong("Resumo para recrutador: "), "Cientista de Dados com forte base em estatística, experiência prática em crédito e finanças, capaz de liderar entregas analíticas que impactam a eficiência operacional e decisões estratégicas."),
        tags$p(tags$strong("Links: "), tags$a(href = rd$contact$links[[1]]$github %||% "#", "GitHub", target = "_blank"), " ", tags$a(href = rd$contact$links[[2]]$linkedin %||% "#", "LinkedIn", target = "_blank"))
      )
    })

    output$featured_projects <- renderUI({
      # prefer projects from resume_full if present
      rd <- resume_data()
      df <- if (!is.null(rd$projects)) as.data.frame(do.call(rbind, lapply(rd$projects, function(x) {
        data.frame(id = x$id %||% NA, title = x$title, short_description = x$short_description %||% "", repo = x$repo %||% "", demo = x$demo %||% "", featured = isTRUE(x$featured), stringsAsFactors = FALSE)
      }))) else projects_df()
      if (!is.data.frame(df) || nrow(df) == 0) return(tags$p("Nenhum projeto disponível."))
      feat <- df[df$featured == TRUE, , drop = FALSE]
      if (nrow(feat) == 0) return(tags$p("Nenhum projeto em destaque."))
      tagList(
        div(class = "projects-grid",
            lapply(seq_len(nrow(feat)), function(i) {
              item <- feat[i, ]
              ui_card(title = item$title, subtitle = item$short_description, image = NULL,
                      footer = tagList(
                        tags$a(href = item$repo, "GitHub", target = "_blank", class = "link"),
                        tags$span(" \u2022 "),
                        tags$a(href = item$demo, "Demo", target = "_blank", class = "link")
                      ))
            })
        )
      )
    })

    output$about_text <- renderUI({
      rd <- resume_data()
      if (is.null(rd)) return(tags$p("Sobre não disponível."))
      tagList(
        tags$p(rd$summary),
        tags$h4("Principais competências"),
        tags$ul(lapply(rd$competencies, tags$li))
      )
    })

# render_bullets <- function(bullets) {

#   if (is.null(bullets) || length(bullets) == 0)
#     return(NULL)

#   tags$ul(
#     class = "experience-bullets",

#     lapply(bullets, function(bullet) {

#       tags$li(

#         # Texto principal
#         tags$span(
#           class = "bullet-text",
#           bullet$text
#         ),

#         # Sub-bullets (opcional)
#         if (!is.null(bullet$subbullets) &&
#             length(bullet$subbullets) > 0) {

#           tags$ul(
#             class = "experience-subbullets",

#             lapply(bullet$subbullets, function(sub) {

#               tags$li(
#                 if (is.list(sub)) sub$text else sub
#               )

#             })
#           )

#         }

#       )

#     })

#   )

# }


    # output$experience_list <- renderUI({
    #   rd <- resume_data()
    #   if (is.null(rd$experience) || length(rd$experience) == 0) return(tags$p("Nenhuma experiência disponível."))
    #   tagList(lapply(rd$experience, function(exp) {
    #     ui_card(title = paste0(exp$title, " — ", exp$company), subtitle = paste0(exp$start, " — ", exp$end, " ", exp$location %||% ""),
    #             footer = tags$ul(lapply(exp$bullets, tags$li)))
    #   }))
    # })
#   output$experience_list <- renderUI({

#   rd <- resume_data()

#   if (is.null(rd$experience) || length(rd$experience) == 0)
#     return(tags$p("Nenhuma experiência disponível."))

#   tagList(

#     lapply(rd$experience, function(exp) {

#       ui_card(

#         title = paste0(exp$title, " — ", exp$company),

#         subtitle = paste0(
#           exp$start,
#           " — ",
#           exp$end,
#           " ",
#           exp$location %||% ""
#         ),

#         footer = render_bullets(exp$bullets)

#       )

#     })

#   )

# })
    output$education_list <- renderUI({
      rd <- resume_data()
      if (is.null(rd$education) || length(rd$education) == 0) return(tags$p("Nenhuma formação disponível."))
      tagList(lapply(rd$education, function(ed) ui_card(title = ed$degree, subtitle = ed$institution, footer = tags$small(paste(ed$start, ed$end, sep = " — ")))))
    })

    output$certs_list <- renderUI({
      rd <- resume_data()
      if (is.null(rd$certifications) || length(rd$certifications) == 0) return(tags$p("Nenhuma certificação disponível."))
      tagList(lapply(rd$certifications, function(c) ui_card(title = c$name, subtitle = c$issuer, footer = tags$small(c$year))))
    })

    output$contact_cta <- renderUI({
      rd <- resume_data()
      if (is.null(rd$contact)) return(tags$p("Contato não disponível."))
      tagList(
        tags$p(tags$strong("Email: "), rd$contact$email),
        tags$p(tags$strong("Telefone: "), rd$contact$phone),
        tags$p(tags$strong("Links: "), tags$a(href = rd$contact$links[[1]]$github, "GitHub", target = "_blank"), " ", tags$a(href = rd$contact$links[[2]]$linkedin, "LinkedIn", target = "_blank"))
      )
    })

    output$footer_keywords <- renderUI({
      kws <- c(
        "Data Science","Data Analytics","Business Intelligence","Statistical Modeling",
        "Predictive Analytics","Exploratory Data Analysis","Python","SQL","R","Power BI",
        "Data Visualization","ETL/ELT","Data Pipelines","PySpark","PostgreSQL",
        "Credit Analytics","Risk Analytics","Decision Support","Process Automation",
        "Statistical Analysis","Data Engineering"
      )
        tags$div(class = "keywords-footer", tags$p(paste(kws, collapse = " • "), class = "section-small"))
    })

    observeEvent(input$view_projects, {
      session$sendCustomMessage("navigate", list(page = "projects"))
    })
  })
}
