library(shiny)
library(bslib)

# Load globals and modules into the global environment so module functions
# like `mod_home_ui()` are available when building the UI.
source("global.R")

ui <- page_navbar(
  title = "Marco Leal - Portfólio",
  window_title = "Marco Leal - Portfólio",
  inverse = FALSE,
  position = "static-top",
  header = tagList(
    use_app_fonts(),
    tags$link(rel = "stylesheet", href = "assets/css/app.css"),
    tags$script(HTML("document.documentElement.setAttribute('data-theme', 'dark')")),
    # JS handlers: navigation, back-to-top visibility, and scroll-into-view helper
    tags$script(HTML(
"(function(){
  // Navigate handler from server
  if(window.Shiny){
    Shiny.addCustomMessageHandler('navigate', function(data){
      try{ var el = document.getElementById(data.page); if(el) el.scrollIntoView({behavior:'smooth'}); }catch(e){}
    });
  }
  // Back to top button
  function ensureBackToTop(){
    var btn = document.getElementById('back-to-top');
    if(!btn){ btn = document.createElement('button'); btn.id='back-to-top'; btn.innerText='↑'; document.body.appendChild(btn);
      btn.addEventListener('click', function(){ window.scrollTo({top:0, behavior:'smooth'}); });
    }
    window.addEventListener('scroll', function(){ if(window.scrollY>400) btn.style.display='block'; else btn.style.display='none'; });
  }
  if(document.readyState==='complete'){ ensureBackToTop(); } else window.addEventListener('load', ensureBackToTop);
})();"
    ))
  ),
  nav_panel("Home", mod_home_ui("home")),
  nav_panel("About", mod_about_ui("about")),
  #nav_panel("Resume", mod_resume_ui("resume")),
  nav_panel("Projects", mod_projects_ui("projects")),
  nav_panel("Blog", mod_blog_ui("blog"))
  #nav_panel("Contact", mod_contact_ui("contact"))
)

server <- function(input, output, session) {
  mod_home_server("home")
  mod_about_server("about")
  #mod_resume_server("resume")
  mod_projects_server("projects")
  mod_blog_server("blog")
  #mod_contact_server("contact")
}

shinyApp(ui = ui, server = server)

