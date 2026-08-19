## Global initialization: libraries, theme, data and memoised services
library(shiny)
library(bslib)
library(yaml)
library(fs)
library(memoise)

# Expose assets/ via resource path so static files (css, img) are served
addResourcePath("assets", normalizePath("assets", winslash = "/", mustWork = FALSE))

source("utils/theme.R")
source("utils/helpers.R")
source("utils/components.R")

## Load YAML data (memoised)
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

## Theme
app_theme <- app_theme()

## Source services
source("services/github_service.R")
source("services/projects_service.R")


# carrega todos os modules/*/ui.R e modules/*/server.R para o ambiente global
module_dirs <- list.dirs("modules", recursive = FALSE, full.names = TRUE)
for (d in module_dirs) {
  ui_f  <- file.path(d, "ui.R")
  srv_f <- file.path(d, "server.R")
  if (file.exists(ui_f))  source(ui_f)
  if (file.exists(srv_f)) source(srv_f)
}
