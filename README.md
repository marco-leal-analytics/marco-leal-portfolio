# marco-leal-analytics

Scaffold inicial do projeto de portfólio Shiny "marco-leal-analytics".

Estrutura criada:

- `app.R`
- `global.R`
- `modules/` (home, about, resume, projects, blog, contact)
- `services/` (github_service.R, projects_service.R)
- `utils/` (helpers.R, theme.R)
- `data/` (projects.yml, education.yml, experience.yml, certifications.yml)
- `assets/` (img, css, icons)

Para executar localmente:

```r
# instalar dependências mínimas
install.packages(c("shiny","bslib","yaml","httr2","memoise","dplyr","glue","fs"))

# executar
shiny::runApp()
```

Próximos passos sugeridos:
- Implementar funcionalidades completas dos módulos `projects` e `home`.
- Completar integrações do `github_service.R` com tratamento de rate-limit.
- Adicionar `renv` e `Dockerfile` para deploy.
# marco-leal-portfolio
Plataforma de portfólio profissional desenvolvida em R Shiny para apresentação de experiência, projetos, certificações, artigos técnicos e métricas do GitHub por meio de uma arquitetura modular, moderna e responsiva.
