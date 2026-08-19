library(shiny)

mod_projects_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    projects_df <- reactive({ read_projects("data/projects.yml") })

    filtered <- reactive({ filter_projects(projects_df(), q = input$q) })

    per_page <- 6
    page <- reactiveVal(1)

    observeEvent(input$load_more, {
      page(page() + 1)
    })

    output$projects_list <- renderUI({
      df <- filtered()
      if (!is.data.frame(df) || nrow(df) == 0) return(tags$p("Nenhum projeto encontrado."))
      total <- nrow(df)
      show_n <- min(total, page() * per_page)
      subset <- df[seq_len(show_n), , drop = FALSE]

      cards <- lapply(seq_len(nrow(subset)), function(i) {
        item <- subset[i, ]
        ui_card(title = item$title,
                subtitle = item$short_description,
                image = NULL,
                footer = tagList(
                  tags$div(class = "tech-chips", paste(unlist(item$technologies), collapse = ", ")),
                  tags$a(href = item$repo, "GitHub", target = "_blank", class = "link"),
                  tags$span(" \u2022 "),
                  tags$a(href = item$demo, "Demo", target = "_blank", class = "link")
                )
        )
      })

      more_btn <- if (show_n < total) actionButton(session$ns("load_more"), "Carregar mais", class = "btn-primary") else NULL

      tagList(
        div(class = "projects-grid", cards),
        tags$div(style = "text-align:center; margin-top:12px;", more_btn)
      )
    })
  })
}
