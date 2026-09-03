library(shiny)
library(bslib)

# Ponto de entrada da aplicação Shiny. Os helpers globais e as funções dos
# módulos são carregados antes da montagem da barra de navegação.
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
    # Handlers JS para visibilidade do botão voltar ao topo.
    tags$script(HTML(paste(
      "(function(){",
      "  function ensureBackToTop(){",
      "    var btn = document.getElementById('back-to-top');",
      "    if(!btn){ btn = document.createElement('button'); btn.id='back-to-top'; btn.innerText='↑'; document.body.appendChild(btn);",
      "      btn.addEventListener('click', function(){ window.scrollTo({top:0, behavior:'smooth'}); });",
      "    }",
      "    window.addEventListener('scroll', function(){ if(window.scrollY>400) btn.style.display='block'; else btn.style.display='none'; });",
      "  }",
      "  if(document.readyState==='complete'){ ensureBackToTop(); } else window.addEventListener('load', ensureBackToTop);",
      "})();",
      sep = "\n"
    )))
  ),
  nav_panel("Perfil", mod_home_ui("home")),
  
  nav_panel("Currículo", mod_resume_ui("resume")),
  nav_panel("Projetos", mod_projects_ui("projects")),
 # nav_panel("Blog", mod_blog_ui("blog"))
  nav_panel("Contato", mod_contact_ui("contact")),
  nav_panel("Sobre", mod_about_ui("about"))
)

# Inicia um módulo de servidor para cada aba exposta pela interface acima.
server <- function(input, output, session) {
  mod_home_server("home")
  mod_about_server("about")
  mod_resume_server("resume")
  mod_projects_server("projects")
  #mod_blog_server("blog")
  mod_contact_server("contact")
}

shinyApp(ui = ui, server = server)

