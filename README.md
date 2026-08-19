# marco-leal-portfolio

Portfólio profissional em R Shiny para apresentação de experiência, projetos, certificações e recursos relacionados. Projeto modular e responsivo com foco em apresentação recruiter-first (visão rápida e clara do currículo).

Estrutura principal

- `app.R` — ponto de entrada e navbar principal
- `global.R` — configurações e helpers globais
- `modules/` — módulos UI/Server (home, about, projects, blog, etc.)
- `data/` — conteúdo base em YAML (ex.: `resume_full.yml`)
- `assets/` — imagens e `assets/css/app.css`

Como rodar localmente

```r
# instalar dependências mínimas
install.packages(c("shiny","bslib","yaml","dplyr","glue"))

# executar a aplicação
shiny::runApp()
```

Resumo das modificações recentes

- Tema escuro global unificado em `assets/css/app.css` (variáveis CSS, componentes e responsividade).
- Redesign completo da aba `Home` para formato de currículo (resume), alimentado por `data/resume_full.yml`.
- `Tech Stack` renderizado dinamicamente a partir do YAML e exibido em linhas únicas com separador `|`.
- Contatos e Links da sidebar alinhados lado-a-lado, com ícones inline e comportamento `no-wrap` para evitar quebras de e-mail/telefone.
- Download do CV detectado e linkado automaticamente a partir de `www/` ou `assets/www/` (procura por arquivo PDF com nome padrão).
- Header/branding:
	- Título do site revertido para texto: **Marco Leal - Portfólio** (`app.R`).
	- Removeu-se o hero/header fixo da Home (imagem removida a pedido).
- Navegação interna adicionada: menu de âncoras (`sticky-side-nav`) para rolar entre seções da aba Home (Formação, Experiência, Tech Stack, Idiomas, Projetos).
- CSS do header inicialmente ajustado e depois removido; quando presente usa `object-fit:contain` para evitar cortes em redimensionamento.

Arquivos alterados principais

- `assets/css/app.css` — tema escuro, regras de layout, `.resume-wrapper`, `.home-header-img`, `.sticky-side-nav` e utilitários.
- `modules/home/ui.R` — layout da Home reorganizado (sidebar, main, seções com ids namespaced e menu de navegação por âncoras).
- `modules/home/server.R` — renderização a partir de `data/resume_full.yml` (timelines, tech stack, competências, certificações, contatos, links, footer keywords).
- `app.R` — navbar/title ajustado para mostrar o texto do site e carregar CSS.

Próximos passos sugeridos

- Verificar visual localmente com `shiny::runApp()` e ajustar espaçamentos finos.
- Otimizar e gerar versão exata do banner/header (1360×180) caso queira reintroduzir sem perda de informação.
- Adicionar destaque do item ativo no menu de âncoras (scrollspy) e ícones SVG nas entradas do menu.
- Adicionar `renv` e um `Dockerfile` para facilitar deploy e reprodutibilidade.

Notas

- Se quiser que eu gere automaticamente uma imagem de banner otimizada a partir das imagens em `assets/www/`, posso fazê-lo e atualizar o layout para reintroduzir um hero responsivo.
- Para testes visuais, execute `shiny::runApp()` e abra o navegador em http://127.0.0.1:xxxx (porta mostrada no console).

Contato

- Autor: Marco Leal
- Este repositório é mantido como portfólio pessoal.

## Changelog

Versão: Unreleased — 2026-08-18

- Tema e Estilo
	- Consolidado tema escuro global em `assets/css/app.css` com variáveis e regras responsivas.

- Aba Home (Resume)
	- Redesenho completo da aba `Home` para layout tipo currículo, consumindo `data/resume_full.yml`.
	- Seções principais namespaced e identificadas: `education`, `experience`, `tech`, `languages`, `projects`, `footer`.
	- Implementado menu de navegação por âncoras (`sticky-side-nav`) para rolar entre seções.

- Conteúdo dinâmico
	- `Tech Stack` agora renderiza por categoria a partir do YAML e exibe cada categoria como linha única com itens separados por ` | `.
	- Competências e Certificações renderizadas em colunas dedicadas.

- Sidebar e Contatos
	- Contatos e Links alinhados lado-a-lado com ícones inline; aplicado `.no-wrap` para evitar quebras de email/telefone.
	- Link de download do CV detectado automaticamente em `www/` e `assets/www/`.

- Header e Branding
	- Título do navbar revertido para texto: **Marco Leal - Portfólio** (`app.R`).
	- Hero/header da Home removido por solicitação; CSS contém regras para reintrodução com `object-fit:contain` caso necessário.

- Limpeza e manutenção
	- Refatoração e consolidação de regras CSS para reduzir duplicação e uniformizar espaçamentos.
	- README atualizado com resumo das modificações e próximos passos.

---

Se preferir, posso transformar este histórico em um `CHANGELOG.md` seguindo o formato "Keep a Changelog" ou extrair entradas a partir do histórico Git (se o repositório estiver versionado). Deseja que eu faça isso? 

