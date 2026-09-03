library(httr2)
library(jsonlite)
library(memoise)
library(glue)

# Integração com a API do GitHub para obter metadados de repositórios públicos.
GITHUB_API_BASE <- "https://api.github.com"

# Monta uma requisição base sem autenticação ou com token bearer.
github_client <- function(token = Sys.getenv("GITHUB_TOKEN", "")) {
  req <- request(GITHUB_API_BASE)
  if (nzchar(token)) req <- req %>% req_auth_bearer_token(token)
  req
}

# Obtém e normaliza os campos dos repositórios no formato usado pela interface.
get_user_repos <- function(user, per_page = 100) {
  req <- github_client() %>% req_url_path_append(sprintf("users/%s/repos", user)) %>% req_perform()
  res <- resp_body_json(req, simplifyVector = TRUE)
  # Normaliza a resposta para que os consumidores não dependam dos campos do GitHub.
  lapply(res, function(r) list(
    name = r$name,
    full_name = r$full_name,
    description = r$description,
    html_url = r$html_url,
    stars = r$stargazers_count,
    forks = r$forks_count,
    language = r$language,
    updated_at = r$updated_at
  ))
}

# Fronteira em cache para a interface: falhas da API viram um resultado seguro
# em vez de encerrarem a sessão Shiny.
get_user_repos_safe <- memoise::memoise(function(user) {
  tryCatch({
    get_user_repos(user)
  }, error = function(e) {
    list(error = TRUE, message = e$message)
  })
})
