library(bslib)
library(htmltools)

# Central design tokens used by bs_theme and for SASS generation
design_tokens <- list(
  color_primary = "#3B82F6",
  color_secondary = "#7C3AED",
  color_accent = "#06B6D4",
  color_success = "#10B981",
  color_warning = "#F59E0B",
  color_error = "#EF4444",
  surface_1 = "#0B1220",
  surface_2 = "#0F1724",
  text_high = "#E6EEF8",
  text_medium = "#AAB6C8"
)

app_theme <- function(mode = c("dark", "light")) {
  mode <- match.arg(mode)
  if (mode == "dark") {
    bs_theme(
      version = 5,
      bg = design_tokens$surface_1,
      fg = design_tokens$text_high,
      primary = design_tokens$color_primary,
      base_font = font_google("Inter"),
      heading_font = font_google("Merriweather")
    )
  } else {
    bs_theme(
      version = 5,
      bg = "#ffffff",
      fg = "#0f1724",
      primary = "#2563EB",
      base_font = font_google("Inter"),
      heading_font = font_google("Merriweather")
    )
  }
}

use_app_fonts <- function() {
  tagList(
    tags$link(rel = "preconnect", href = "https://fonts.googleapis.com" ),
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Merriweather:wght@400;700&display=swap")
  )
}

# Export tokens for other R code
get_design_tokens <- function() { design_tokens }

# Optionally write a small SASS partial from R tokens (useful if you want
# a single source of truth). This writes to `assets/sass/_tokens_from_r.scss`.
write_sass_tokens <- function(path = "assets/sass/_tokens_from_r.scss") {
  tokens <- get_design_tokens()
  lines <- c("// Generated from R design tokens",
             sprintf("$color-primary: %s;", tokens$color_primary),
             sprintf("$color-secondary: %s;", tokens$color_secondary),
             sprintf("$color-accent: %s;", tokens$color_accent),
             sprintf("$surface-1: %s;", tokens$surface_1),
             sprintf("$surface-2: %s;", tokens$surface_2),
             sprintf("$text-high: %s;", tokens$text_high)
  )
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  writeLines(lines, con = path)
  invisible(path)
}

