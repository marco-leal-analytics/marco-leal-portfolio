library(shiny)
library(bslib)

# Load globals and modules into the global environment so module functions
# like `mod_home_ui()` are available when building the UI.
source("global.R")

ui <- page_navbar(
  title = "marco-leal-analytics",
  inverse = FALSE,
  position = "static-top",
  header = tagList(
    use_app_fonts(),
    tags$link(rel = "stylesheet", href = "assets/css/app.css"),
    tags$script(HTML("document.documentElement.setAttribute('data-theme', 'light')"))
  ),
  nav_panel("Home", mod_home_ui("home")),
  nav_panel("About", mod_about_ui("about")),
  nav_panel("Resume", mod_resume_ui("resume")),
  nav_panel("Projects", mod_projects_ui("projects")),
  nav_panel("Blog", mod_blog_ui("blog")),
  nav_panel("Contact", mod_contact_ui("contact"))
)

server <- function(input, output, session) {
  mod_home_server("home")
  mod_about_server("about")
  mod_resume_server("resume")
  mod_projects_server("projects")
  mod_blog_server("blog")
  mod_contact_server("contact")
}

shinyApp(ui = ui, server = server)

