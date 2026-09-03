library(yaml)
library(dplyr)
library(stringr)

# Lê o catálogo alternativo de projetos e normaliza cada entrada em data frame.
read_projects <- function(path = "data/projects.yml") {
  if (!file.exists(path)) return(tibble::tibble())
  raw <- yaml::read_yaml(path)
  # Expect list of projects
  projects <- lapply(raw, function(p) {
    tibble::tibble(
      id = p$id %||% make.names(p$title),
      title = p$title,
      description = p$description,
      short_description = p$short_description %||% p$description,
      categories = I(list(p$categories %||% character(0))),
      technologies = I(list(p$technologies %||% character(0))),
      repo = p$repo,
      demo = p$demo,
      year = p$year %||% NA_integer_,
      featured = isTRUE(p$featured)
    )
  })
  bind_rows(projects)
}

# Aplica filtros opcionais de texto, tecnologia e categoria à tabela de projetos.
filter_projects <- function(projects_df, q = NULL, tech = NULL, category = NULL) {
  df <- projects_df
  if (!is.null(q) && nzchar(q)) {
    q <- stringr::str_to_lower(q)
    df <- df %>% filter(stringr::str_detect(stringr::str_to_lower(title), fixed(q)) |
                          stringr::str_detect(stringr::str_to_lower(short_description), fixed(q)))
  }
  if (!is.null(tech)) {
    df <- df %>% filter(sapply(technologies, function(t) any(t %in% tech)))
  }
  if (!is.null(category)) {
    df <- df %>% filter(sapply(categories, function(cats) any(cats %in% category)))
  }
  df
}
