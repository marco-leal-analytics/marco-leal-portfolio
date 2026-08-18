library(httr2)
library(jsonlite)
library(memoise)
library(glue)

GITHUB_API_BASE <- "https://api.github.com"

github_client <- function(token = Sys.getenv("GITHUB_TOKEN", "")) {
  req <- request(GITHUB_API_BASE)
  if (nzchar(token)) req <- req %>% req_auth_bearer_token(token)
  req
}

get_user_repos <- function(user, per_page = 100) {
  req <- github_client() %>% req_url_path_append(sprintf("users/%s/repos", user)) %>% req_perform()
  res <- resp_body_json(req, simplifyVector = TRUE)
  # normalize - return tibble-like list
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

# Memoised wrapper with basic error handling
get_user_repos_safe <- memoise::memoise(function(user) {
  tryCatch({
    get_user_repos(user)
  }, error = function(e) {
    list(error = TRUE, message = e$message)
  })
})
