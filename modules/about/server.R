library(shiny)

mod_about_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Render skills as badges using PROJECTS_DATA technologies as example
    output$skills <- renderUI({
      # aggregate techs from projects
      df <- tryCatch({ read_projects("data/projects.yml") }, error = function(e) NULL)
      techs <- character(0)
      if (is.data.frame(df) && nrow(df) > 0) techs <- unique(unlist(df$technologies))
      if (length(techs) == 0) return(tags$p("Nenhuma tecnologia listada."))
      tags$div(class = "tech-badges",
               lapply(techs, function(t) tags$span(class = "badge", t))
      )
    })
  })
}
