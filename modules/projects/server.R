library(shiny)

mod_projects_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    projects_df <- reactive({
      read_projects("data/projects.yml")
    })

    filtered <- reactive({
      filter_projects(projects_df(), q = input$q)
    })

    output$projects_list <- renderUI({
      df <- filtered()
      if (nrow(df) == 0) return(tags$p("Nenhum projeto encontrado."))
      tags$div(class = "projects-grid",
               lapply(seq_len(nrow(df)), function(i) {
                 item <- df[i, ]
                 tags$article(class = "project-card",
                              tags$h4(item$title),
                              tags$p(item$short_description)
                 )
               })
      )
    })
  })
}
