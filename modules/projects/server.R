library(shiny)

mod_projects_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    resume_data <- reactive({ read_yaml_safe(file.path(DATA_DIR, "resume_full.yml")) })

    # build projects df from resume_full.yml if available, else fallback to data/projects.yml
    projects_df <- reactive({
      rd <- resume_data()
      if (!is.null(rd$projects) && length(rd$projects) > 0) {
        df <- as.data.frame(do.call(rbind, lapply(rd$projects, function(x) {
          data.frame(id = x$id %||% NA, title = x$title, short_description = x$short_description %||% "", repo = x$repo %||% "", demo = x$demo %||% "", technologies = I(list(x$technologies %||% character(0))), featured = isTRUE(x$featured), stringsAsFactors = FALSE)
        })))
        return(df)
      }
      # fallback to existing projects.yml
      read_projects("data/projects.yml")
    })

    filtered <- reactive({
      df <- projects_df()
      if (!is.data.frame(df) || nrow(df) == 0) return(df)
      q <- input$q
      if (is.null(q) || !nzchar(q)) return(df)
      ql <- tolower(q)
      df[grepl(ql, tolower(df$title)) | grepl(ql, tolower(df$short_description)), , drop = FALSE]
    })

    # Render projects as tabs using titles as tab labels, plus a Custom tab
    output$projects_tabs_ui <- renderUI({
      rd <- resume_data()
      projects <- NULL
      if (!is.null(rd$projects) && length(rd$projects) > 0) {
        projects <- rd$projects
      } else {
        # fallback: convert read_projects df to list of simple lists
        df <- read_projects("data/projects.yml")
        if (is.data.frame(df) && nrow(df) > 0) {
          projects <- lapply(seq_len(nrow(df)), function(i) as.list(df[i, , drop = FALSE]))
        }
      }
      if (is.null(projects) || length(projects) == 0) return(tags$p("Nenhum projeto disponível."))

      tabs <- lapply(seq_along(projects), function(i) {
        p <- projects[[i]]
        pid_raw <- if (!is.null(p$id)) p$id else paste0("proj_", i)
        title <- p$title %||% paste("Projeto", i)

        embed_src <- p$embed %||% p$demo %||% p$repo %||% NULL
        embed_ui <- NULL
        if (!is.null(embed_src) && nzchar(embed_src)) {
          embed_ui <- tags$iframe(src = embed_src, class = "project-frame", sandbox = NULL)
        }

        tabPanel(title,
                 value = pid_raw,
                 tags$div(class = "project-detail-header",
                          tags$h3(p$title),
                          tags$p(p$short_description),
                          tags$div(class = "project-links",
                                   if (!is.null(p$repo)) tags$a(href = p$repo, "GitHub", target = "_blank", class = "link") else NULL,
                                   if (!is.null(p$demo)) tagList(tags$span(" \u2022 "), tags$a(href = p$demo, "Demo", target = "_blank", class = "link")) else NULL
                          )
                 ),
                 tags$div(class = "project-embed", embed_ui)
        )
      })

      # extra custom tab for user to insert content later
      tabs <- c(tabs, list(tabPanel("Custom", value = "custom", textAreaInput(session$ns("custom_input"), "Conteúdo customizado", value = "", rows = 10, width = "100%"))))

      # render a navlistPanel so the project menu is on the left and content on the right
      nav_args <- c(list(id = session$ns("proj_tabs"), widths = c(3, 9)), tabs)
      do.call(navlistPanel, nav_args)
    })

    # debug: show active tab
    output$debug_selected <- renderText({
      paste0("active_tab: ", as.character(input$proj_tabs))
    })
  })
}
