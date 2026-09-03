library(shiny)

mod_projects_ui <- function(id) {
  ns <- NS(id)
  tagList(
  tags$section(class = "module-shell projects-module",
    tags$div(class = "mla-hero module-hero",
      tags$div(class = "hero-copy",
        tags$span(class = "eyebrow", "MARCO LEAL · PORTFÓLIO"),
        tags$h1("Projetos que chegam à decisão"),
        tags$p(class = "hero-summary", "Explore soluções de dados, dashboards e automações construídas para resolver problemas reais de negócio."),
        tags$div(
          class = "tag-row",
          tags$span(class = "mla-tag accent", "Statistics"),
          tags$span(class = "mla-tag accent", "Data Science"),
          tags$span(class = "mla-tag accent", "Data Analytics"),
          tags$span(class = "mla-tag accent", "Business Intelligence"),
          tags$span(class = "mla-tag accent", "Data Engineering")
        )
      ),
      tags$div(class = "hero-visual hero-mark", tags$span("PROJETOS"))
    ),
    div(class = "page-header module-header",
      h2("Projetos"),
      div(class = "filters",
        textInput(ns("q"), "Pesquisar", placeholder = "Buscar por título ou tecnologia...")
      )
    ),

    div(class = "projects-tabs", uiOutput(ns("projects_tabs_ui"))),
    tags$script(HTML("(function() {
  function loadVisibleDemo() {
    document.querySelectorAll('.projects-tabs .tab-pane.active, .projects-tabs .tab-pane.show.active').forEach(function(pane) {
      var frame = pane.querySelector('iframe[data-src]');
      if (frame && !frame.getAttribute('src')) frame.setAttribute('src', frame.getAttribute('data-src'));
    });
  }

  document.addEventListener('shown.bs.tab', function(event) {
    var target = event.target.getAttribute('data-bs-target') || event.target.getAttribute('href');
    if (!target || target.charAt(0) !== '#') return;
    var pane = document.querySelector(target);
    if (pane) {
      var frame = pane.querySelector('iframe[data-src]');
      if (frame && !frame.getAttribute('src')) frame.setAttribute('src', frame.getAttribute('data-src'));
    }
  });

  new MutationObserver(loadVisibleDemo).observe(document.body, { childList: true, subtree: true });
  loadVisibleDemo();
})();"))
  )
  )
}
