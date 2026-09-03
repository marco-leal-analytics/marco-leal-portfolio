## Global initialization: libraries, theme, data and memoised services.
# Este arquivo é chamado por app.R e estabelece o ambiente compartilhado.
library(shiny)
library(bslib)
library(yaml)
library(fs)
library(memoise)

# Expõe assets estáticos por caminhos estáveis usados pelas interfaces dos módulos.
addResourcePath("assets", normalizePath("assets", winslash = "/", mustWork = FALSE))
addResourcePath("home-document", normalizePath(file.path("modules", "home"), winslash = "/", mustWork = FALSE))

source("utils/theme.R")
source("utils/helpers.R")
source("utils/components.R")

# Mantém leituras YAML em cache, pois vários módulos usam os mesmos dados.
read_yaml_safe <- memoise::memoise(function(path) {
  tryCatch({
    yaml::read_yaml(path)
  }, error = function(e) {
    warning(sprintf("Failed to read YAML %s: %s", path, e$message))
    NULL
  })
})

DATA_DIR <- "data"
PROJECTS_DATA <- read_yaml_safe(file.path(DATA_DIR, "projects.yml"))
EDUCATION_DATA <- read_yaml_safe(file.path(DATA_DIR, "education.yml"))
EXPERIENCE_DATA <- read_yaml_safe(file.path(DATA_DIR, "experience.yml"))
CERTS_DATA <- read_yaml_safe(file.path(DATA_DIR, "certifications.yml"))

# Cria o tema bslib uma vez para manter uma configuração visual única.
app_theme <- app_theme()

# Carrega as integrações antes dos módulos, que podem chamá-las diretamente.
source("services/github_service.R")
source("services/projects_service.R")


# Carrega cada par de módulos para que app.R componha as funções por nome.
module_dirs <- list.dirs("modules", recursive = FALSE, full.names = TRUE)
for (d in module_dirs) {
  ui_f  <- file.path(d, "ui.R")
  srv_f <- file.path(d, "server.R")
  if (file.exists(ui_f))  source(ui_f)
  if (file.exists(srv_f)) source(srv_f)
}
