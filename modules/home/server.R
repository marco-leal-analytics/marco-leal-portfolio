library(shiny)

# A aba inicial não possui controles reativos; o conteúdo vem do iframe Quarto.
mod_home_server <- function(id) {
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

 
  })
}
