send_contact_email <- function(
  name,
  email,
  message
) {

  api_key <- Sys.getenv("RESEND_API_KEY")

  payload <- list(
    from = "onboarding@resend.dev",
    to = c("marcoaureliolv@gmail.com"),
    subject = paste("Contato Portfólio -", name),
    reply_to = email,
    html = paste0(
      "<h2>Novo contato do portfólio</h2>",
      "<p><strong>Nome:</strong> ", name, "</p>",
      "<p><strong>Email:</strong> ", email, "</p>",
      "<p><strong>Mensagem:</strong></p>",
      "<p>", gsub("\n", "<br>", message), "</p>"
    )
  )

  httr2::request("https://api.resend.com/emails") |>
    httr2::req_headers(
      Authorization = paste("Bearer", api_key),
      `Content-Type` = "application/json"
    ) |>
    httr2::req_body_json(payload) |>
    httr2::req_perform()
}