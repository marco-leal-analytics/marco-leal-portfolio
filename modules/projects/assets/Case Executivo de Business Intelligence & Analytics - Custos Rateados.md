---
output:
  html_document:
    self_contained: true
    css: ../../../assets/css/app.css
---
    
# Case Executivo de Business Intelligence & Analytics
## Gestão Analítica de Custos Rateados — Área Contábil e Financeira Cooperativa de Crédito

**Responsável pelo desenvolvimento:** Marco Aurélio Valles Leal  
**Tecnologia principal:** Microsoft Power BI  
**Escopo:** Business Intelligence, Financial Analytics, Cost Analytics, Controllership Analytics e Gestão de Despesas  
**Arquitetura analítica:** ETL → Modelagem Dimensional → Métricas DAX → Visualização → Análise → Decisão

---

## Resumo


## 1. Visão Executiva

O projeto consistiu no desenvolvimento de uma solução de **Business Intelligence e Analytics para monitoramento, análise e gestão dos Custos Rateados recebidos da Central Administrativa** de uma instituição financeira cooperativa.

A iniciativa foi concebida para transformar informações financeiras originalmente dispersas e de interpretação predominantemente operacional em uma **estrutura analítica integrada, visual, rastreável e orientada à tomada de decisão**.

O dashboard desenvolvido em **Microsoft Power BI** consolidou três grandes frentes de despesas:

- **Custos de Licenças e Softwares**
- **Serviços Centralizados**
- **Sustentação e Utilização de Produtos e Serviços**

A solução permitiu acompanhar a evolução histórica dos custos, identificar oscilações relevantes, analisar concentração de despesas, comparar períodos, investigar desvios e fornecer uma visão estruturada sobre o comportamento dos gastos rateados.

Mais do que substituir relatórios manuais, o projeto buscou estabelecer uma mudança de paradigma:

> **de uma visão predominantemente contábil e retrospectiva para uma visão analítica, gerencial e orientada por evidências.**

A lógica central da solução foi estruturada segundo o ciclo:

**Problema → Dados → Evidência → Análise → Insight → Decisão → Impacto**

Esse fluxo representa a transformação de dados financeiros brutos em conhecimento acionável para a gestão.

---

# 2. Contexto de Negócio

Em estruturas cooperativas, determinados serviços, tecnologias, plataformas, sistemas e recursos administrativos são centralizados para ganho de escala, padronização, eficiência operacional e compartilhamento de infraestrutura.

Como consequência desse modelo, parte dos custos relacionados a essas estruturas é posteriormente **rateada entre unidades, áreas ou entidades participantes**, compondo despesas que precisam ser acompanhadas pelas áreas Contábil, Financeira e de Gestão.

Embora o processo de rateio possua racional operacional e econômico, ele cria um desafio gerencial importante:

**o gestor precisa compreender não apenas quanto foi contabilizado, mas por que o custo variou, onde está concentrado, qual componente está pressionando a despesa e se existe oportunidade de otimização.**

Nesse contexto, o projeto desenvolvido por Marco Aurélio Valles Leal teve como objetivo criar uma camada analítica capaz de responder perguntas como:

- Quanto estamos pagando?
- Como esse custo evoluiu?
- Quais categorias apresentam maior participação?
- Quais componentes explicam as principais oscilações?
- Quais períodos apresentaram comportamento atípico?
- Onde existe concentração de despesas?
- Quais custos devem ser investigados?
- Quais oportunidades de racionalização podem ser avaliadas?
- Como transformar essas informações em decisões de gestão?

---

# 3. Problema

## 3.1 Situação anterior

Antes da implementação da solução analítica, o acompanhamento dos custos rateados apresentava características predominantemente operacionais.

As informações financeiras existiam, mas a capacidade de transformá-las rapidamente em **informação gerencial estruturada** era limitada.

Entre os principais desafios estavam:

- necessidade de consolidação de informações;
- dependência de processos manuais;
- dificuldade de comparação entre períodos;
- baixa visibilidade sobre a composição das despesas;
- dificuldade para identificar rapidamente desvios;
- necessidade de consultas e tratamentos recorrentes;
- ausência de uma visão executiva integrada;
- dificuldade para rastrear a evolução histórica;
- maior dependência do conhecimento individual dos analistas;
- tempo elevado para preparação de informações gerenciais.

O problema, portanto, não era necessariamente a inexistência dos dados.

O principal problema estava na **distância entre o dado contábil disponível e a informação necessária para a gestão**.

---

## 3.2 Desafios relacionados aos custos rateados

Os custos recebidos da Central Administrativa poderiam representar diferentes naturezas econômicas e operacionais.

Entre elas estavam despesas relacionadas a:

### Licenças e Softwares

Custos associados à utilização de sistemas, plataformas, ferramentas tecnológicas e licenças corporativas.

O desafio gerencial consistia em compreender:

- evolução dos gastos;
- concentração por solução;
- variações relevantes;
- crescimento recorrente;
- alterações de utilização;
- possíveis oportunidades de racionalização.

### Serviços Centralizados

Despesas decorrentes de estruturas, serviços ou operações compartilhadas.

A análise precisava permitir entender:

- comportamento histórico;
- participação relativa;
- crescimento;
- concentração;
- alterações relevantes no rateio.

### Sustentação e Utilização de Produtos e Serviços

Custos relacionados à sustentação, utilização e manutenção de produtos e serviços disponibilizados pela estrutura centralizada.

Esses custos exigiam acompanhamento porque poderiam apresentar:

- comportamento recorrente;
- crescimento gradual;
- oscilações pontuais;
- alterações de utilização;
- mudanças de composição.

---

## 3.3 Riscos da ausência de monitoramento

A ausência de uma estrutura analítica adequada poderia aumentar riscos gerenciais, como:

- dificuldade para detectar crescimento anormal de despesas;
- perda de oportunidades de redução de custos;
- menor capacidade de questionamento dos valores rateados;
- dificuldade de identificar tendências;
- baixa rastreabilidade analítica;
- dependência excessiva de processos manuais;
- maior tempo de resposta às demandas gerenciais;
- dificuldade de priorização de iniciativas;
- menor transparência sobre a composição das despesas;
- tomada de decisão baseada predominantemente em percepção.

Em ambientes financeiros, pequenas variações recorrentes podem produzir impactos relevantes quando acumuladas ao longo do tempo.

Por isso, o monitoramento não deveria se limitar ao valor absoluto contabilizado.

Era necessário compreender **comportamento, composição, tendência e causa provável das variações**.

---

# 4. Dados

## 4.1 Estratégia de dados

A segunda etapa do projeto consistiu na transformação dos dados financeiros em uma estrutura adequada para análise.

A arquitetura foi construída considerando quatro etapas principais:

**Extração → Transformação → Modelagem → Análise**

O Microsoft Power BI foi utilizado como plataforma central para integração, tratamento, modelagem e visualização dos dados.

---

## 4.2 Extração

Os dados utilizados no projeto foram estruturados a partir das informações relacionadas aos custos rateados recebidos da Central Administrativa.

O processo contemplou a ingestão das informações necessárias para análise dos componentes financeiros, permitindo construir uma visão histórica e multidimensional dos custos.

A preocupação principal não era apenas carregar os dados, mas garantir que as informações estivessem estruturadas para responder às perguntas de negócio.

---

# 5. Power Query e Linguagem M

O **Power Query** foi utilizado como camada de preparação e transformação dos dados.

A utilização da **Linguagem M** permitiu automatizar etapas que anteriormente poderiam exigir manipulação manual.

Entre os principais tratamentos realizados, destacam-se:

### Padronização

- padronização de nomes;
- uniformização de categorias;
- tratamento de tipos de dados;
- normalização de períodos;
- padronização de campos financeiros.

### Limpeza

- tratamento de valores nulos;
- identificação de registros inconsistentes;
- tratamento de duplicidades;
- correção de formatos;
- eliminação de informações inadequadas para o modelo analítico.

### Consolidação

As diferentes estruturas necessárias à análise foram consolidadas para formar uma base coerente.

O objetivo foi reduzir a fragmentação dos dados e criar uma fonte analítica única para os indicadores.

### Validação

Foram consideradas verificações relacionadas a:

- integridade dos registros;
- consistência dos valores;
- coerência temporal;
- categorias;
- dimensões;
- relacionamentos;
- totais financeiros.

---

# 6. Modelagem de Dados

A modelagem foi concebida segundo princípios de **modelagem dimensional**, buscando uma estrutura analítica simples, performática e intuitiva para os usuários.

A lógica principal foi aproximada de um **Star Schema**, separando:

### Tabela fato

Contendo os registros financeiros relacionados aos custos rateados.

Exemplos conceituais de atributos:

- período;
- valor;
- categoria;
- centro de custo;
- unidade;
- produto ou serviço;
- classificação da despesa;
- componente do rateio.

### Dimensões

Foram estruturadas dimensões analíticas para permitir diferentes perspectivas de investigação.

Entre elas:

- Dimensão Calendário;
- Dimensão Centro de Custo;
- Dimensão Categoria;
- Dimensão Unidade;
- Dimensão Produto/Serviço;
- Dimensão Classificação de Despesa.

Essa arquitetura permitiu separar claramente:

**o que aconteceu** — fatos financeiros

de

**onde, quando e em qual categoria aconteceu** — dimensões analíticas.

---

# 7. Métricas de Negócio com DAX

A linguagem **DAX — Data Analysis Expressions** foi utilizada para transformar os dados estruturados em indicadores gerenciais.

Entre as métricas conceituais desenvolvidas estavam:

- custo total;
- custo acumulado;
- custo por categoria;
- custo por centro de custo;
- custo por período;
- participação percentual;
- variação absoluta;
- variação percentual;
- médias históricas;
- indicadores de tendência;
- comparações entre períodos.

A utilização de medidas, em vez da simples exposição de valores brutos, permitiu incorporar lógica de negócio diretamente ao modelo analítico.

---

# 8. Evidência

A etapa de Evidência representa a transformação dos dados tratados em **informação observável e mensurável**.

O dashboard foi estruturado para permitir diferentes níveis de análise, desde uma visão executiva até uma investigação mais detalhada.

---

## 8.1 Painel Executivo

A camada executiva concentrou os principais indicadores financeiros.

Entre os elementos disponibilizados estavam:

- custo total;
- evolução dos custos;
- principais categorias;
- participação das despesas;
- variações;
- indicadores de tendência;
- principais componentes do custo.

Essa visão permitia ao gestor compreender rapidamente a situação geral antes de aprofundar a investigação.

---

## 8.2 Evolução Histórica

A análise temporal permitiu observar:

- crescimento;
- redução;
- estabilidade;
- sazonalidade;
- oscilações;
- mudanças de patamar.

A visualização histórica é particularmente importante para diferenciar uma variação pontual de uma tendência estrutural.

---

## 8.3 Segmentações

O dashboard disponibilizou filtros e segmentações que permitiam navegar pelos dados segundo diferentes perspectivas.

Entre as dimensões analíticas:

- período;
- ano;
- mês;
- centro de custo;
- categoria;
- unidade de negócio;
- natureza da despesa;
- produto;
- serviço;
- componente do rateio.

Essa estrutura permitiu que diferentes usuários explorassem o mesmo modelo conforme suas necessidades.

---

# 9. Recursos Interativos

A solução incorporou recursos do Power BI destinados a facilitar a exploração dos dados.

## Segmentações

Permitiram filtrar dinamicamente o conjunto analisado.

## Drill-down

Possibilitou navegar de uma visão agregada para níveis mais detalhados.

Exemplo:

**Ano → Mês → Categoria → Componente**

## Drill-through

Permitiu direcionar o usuário para páginas específicas de investigação.

## Bookmarks

Podem ser utilizados para preservar estados de navegação e criar experiências diferenciadas dentro do dashboard.

## Visuais interativos

Os elementos gráficos foram estruturados para permitir interação entre:

- gráficos;
- tabelas;
- indicadores;
- filtros;
- categorias;
- períodos.

Assim, a seleção de determinado componente poderia refletir imediatamente em outras visualizações.

---

# 10. Análise

A etapa de Análise representa o momento em que os dados deixam de ser apenas indicadores e passam a responder perguntas de negócio.

---

## 10.1 Análise de tendência

Uma das principais aplicações foi acompanhar a trajetória dos custos ao longo do tempo.

A análise permitiu investigar:

- crescimento contínuo;
- redução;
- estabilidade;
- mudança de comportamento;
- aceleração das despesas.

Uma despesa que aumenta continuamente possui implicação diferente de uma despesa que apresenta apenas um pico isolado.

---

## 10.2 Análise de concentração

A estrutura permitiu identificar quais categorias concentravam maior parcela dos custos.

Essa análise é importante porque uma estratégia de redução deve priorizar componentes com maior relevância econômica.

Em termos de gestão:

**não basta identificar muitos custos; é necessário identificar os custos que realmente movem o resultado.**

---

## 10.3 Análise de desvios

A comparação entre períodos permitiu investigar alterações relevantes.

Exemplos de perguntas analíticas:

- Qual categoria apresentou maior crescimento?
- Qual componente apresentou maior redução?
- Onde ocorreu o maior desvio?
- A alteração é pontual ou recorrente?
- O crescimento ocorreu em uma única categoria ou de forma generalizada?

---

## 10.4 Detecção de comportamentos atípicos

A análise histórica também permitiu destacar comportamentos que mereciam investigação.

Entre eles:

- picos inesperados;
- quedas abruptas;
- mudanças de patamar;
- crescimento fora do padrão histórico;
- alterações de composição.

O dashboard, nesse contexto, funcionava como mecanismo de **alerta analítico**, direcionando o gestor para pontos que exigiam investigação.

---

# 11. Insight

A etapa de Insight corresponde à transformação da análise em conhecimento gerencial.

A partir da exploração dos dados, tornou-se possível identificar padrões relacionados à composição e evolução dos custos.

Entre os principais aprendizados analíticos possíveis estavam:

### 1. Nem todo crescimento possui a mesma natureza

Uma elevação pode resultar de:

- aumento de utilização;
- mudança de contrato;
- expansão de serviços;
- alteração de rateio;
- aumento de preços;
- mudança de composição.

Por isso, o crescimento do custo precisa ser analisado conjuntamente com suas dimensões explicativas.

### 2. A concentração orienta a priorização

Categorias responsáveis pela maior parcela das despesas devem receber prioridade na investigação.

### 3. A série histórica aumenta a qualidade da decisão

O valor de determinado mês isoladamente possui informação limitada.

Quando comparado com histórico, média, tendência e composição, o mesmo valor passa a ter significado gerencial.

### 4. O desvio é um ponto de investigação

Uma variação não representa automaticamente um problema.

Ela representa um **sinal que precisa ser explicado**.

Essa mudança de perspectiva é fundamental para uma gestão financeira baseada em evidências.

---

# 12. Decisão

A etapa de Decisão representa a conexão entre Analytics e gestão.

As informações disponibilizadas pelo dashboard poderiam apoiar os gestores em iniciativas como:

- revisão de despesas;
- investigação de variações;
- priorização de categorias;
- avaliação de contratos;
- racionalização de recursos;
- revisão de utilização de licenças;
- avaliação de serviços compartilhados;
- identificação de componentes para negociação;
- acompanhamento de iniciativas de redução;
- definição de prioridades financeiras.

O papel do dashboard não era substituir o julgamento gerencial.

Seu papel era **qualificar esse julgamento**.

Em vez de iniciar uma discussão com base em percepções, os gestores passaram a possuir uma base estruturada para questionar:

> **Qual foi a variação? Onde ocorreu? Qual componente explica o movimento? O comportamento é recorrente? Qual ação deve ser priorizada?**

---

# 13. Impacto

O projeto proporcionou benefícios em três dimensões principais:

## 13.1 Impacto Operacional

- redução do esforço manual;
- maior agilidade na preparação de informações;
- padronização dos processos analíticos;
- menor dependência de consolidações manuais;
- maior produtividade dos usuários.

---

## 13.2 Impacto Analítico

- visão histórica consolidada;
- análise multidimensional;
- maior capacidade de investigação;
- identificação de desvios;
- melhor compreensão da composição dos custos;
- aumento da transparência;
- maior capacidade de acompanhamento dos indicadores.

---

## 13.3 Impacto Estratégico

A principal contribuição estratégica foi aproximar a área financeira de uma lógica de **gestão baseada em dados**.

A solução transformou o acompanhamento dos custos de uma atividade predominantemente descritiva em uma ferramenta de suporte à gestão.

Isso criou condições para:

- identificar oportunidades de otimização;
- priorizar esforços;
- melhorar a governança;
- fortalecer a gestão financeira;
- aumentar a transparência;
- apoiar decisões de racionalização;
- potencialmente gerar economia financeira.

É importante destacar que a economia financeira efetiva depende das ações posteriormente implementadas pela organização. O dashboard criou a **capacidade analítica necessária para localizar, dimensionar e acompanhar oportunidades de economia**.

---

# 14. Arquitetura Analítica da Solução

A arquitetura foi estruturada em camadas.

## Camada 1 — Origem

Dados financeiros relacionados aos custos rateados.

↓

## Camada 2 — ETL / Power Query

Processos de:

- extração;
- transformação;
- limpeza;
- padronização;
- consolidação;
- validação.

↓

## Camada 3 — Modelo Semântico

Modelo dimensional estruturado para análise.

↓

## Camada 4 — DAX

Construção das métricas e indicadores de negócio.

↓

## Camada 5 — Visualização

Dashboards, KPIs, gráficos, tabelas e filtros.

↓

## Camada 6 — Analytics

Interpretação dos resultados.

↓

## Camada 7 — Decisão

Ações gerenciais orientadas pelas evidências.

---

# 15. Critérios de Qualidade dos Dados

A qualidade dos dados foi tratada como requisito fundamental da solução.

Entre os princípios considerados:

### Integridade

Verificação da existência dos registros esperados.

### Consistência

Avaliação da coerência entre categorias, períodos e valores.

### Unicidade

Prevenção de duplicidades que pudessem distorcer os indicadores.

### Padronização

Uniformização de classificações e estruturas.

### Rastreabilidade

Preservação da capacidade de compreender a origem das informações.

### Reconciliação

Comparação entre os valores do modelo analítico e os valores de referência utilizados pelas áreas.

A qualidade dos dados é particularmente relevante em Analytics Financeiro porque uma inconsistência pequena pode produzir um indicador gerencial incorreto.

---

# 16. Atualização das Informações

A arquitetura foi concebida para permitir atualização estruturada da camada analítica.

O princípio fundamental foi separar:

**dados de origem → transformação → modelo → visualização**

Dessa maneira, uma nova atualização poderia alimentar o mesmo modelo sem exigir a reconstrução manual dos painéis.

Essa abordagem aumenta a escalabilidade da solução e reduz a dependência de atividades repetitivas.

---

# 17. Boas Práticas de Desenvolvimento

Entre as boas práticas adotadas ou consideradas no desenvolvimento:

- utilização de modelo dimensional;
- separação entre fatos e dimensões;
- criação de tabela calendário;
- preferência por medidas DAX para cálculos analíticos;
- redução de cálculos desnecessários em colunas;
- padronização de nomenclaturas;
- organização lógica das medidas;
- tratamento dos dados antes da camada de visualização;
- validação dos indicadores;
- construção de filtros intuitivos;
- preocupação com performance;
- foco em experiência do usuário;
- criação de indicadores orientados ao negócio;
- redução de redundância;
- documentação lógica do modelo.

---

# 18. Indicadores de Performance

A estrutura de KPIs foi orientada para responder quatro dimensões:

### Volume

**Quanto foi gasto?**

### Evolução

**Como o gasto está se comportando ao longo do tempo?**

### Composição

**Quais categorias e componentes explicam o gasto?**

### Desvio

**Onde existem alterações relevantes em relação ao comportamento esperado?**

Essa estrutura transforma o dashboard em uma ferramenta de monitoramento contínuo.

---

# 19. Papel do DAX na Inteligência do Dashboard

O DAX desempenhou papel importante na transformação dos dados em indicadores gerenciais.

Enquanto o Power Query preparava os dados, o DAX permitia criar a lógica analítica.

Essa separação é fundamental:

**Power Query → prepara o dado.**

**Modelo → organiza o dado.**

**DAX → interpreta o dado.**

**Power BI → comunica o resultado.**

Essa arquitetura favorece manutenção, escalabilidade e reutilização das métricas.

---

# 20. Visão Executiva do Projeto

O projeto pode ser resumido pela seguinte cadeia de valor:

| Etapa | Pergunta |
|---|---|
| **Problema** | O que não conseguíamos enxergar adequadamente? |
| **Dados** | Quais informações precisávamos integrar? |
| **Evidência** | O que os indicadores demonstram? |
| **Análise** | O que está acontecendo e onde? |
| **Insight** | O que os padrões significam? |
| **Decisão** | O que deve ser feito? |
| **Impacto** | Qual valor a ação pode gerar? |

Essa lógica representa uma abordagem madura de Analytics porque não considera o dashboard como produto final.

O dashboard é o **meio**.

O objetivo final é a **melhoria da decisão**.

---

# 21. Diferencial Técnico e Profissional

O projeto demonstra a capacidade de combinar três perspectivas que frequentemente são tratadas separadamente:

### Tecnologia

Domínio de:

- Microsoft Power BI;
- Power Query;
- Linguagem M;
- DAX;
- modelagem dimensional;
- ETL;
- visualização de dados.

### Analytics

Capacidade de:

- investigar tendências;
- comparar períodos;
- identificar desvios;
- analisar concentração;
- interpretar padrões;
- construir indicadores.

### Negócio

Capacidade de conectar os resultados a:

- custos;
- despesas;
- contabilidade;
- gestão financeira;
- eficiência;
- governança;
- tomada de decisão.

O principal diferencial está justamente na integração dessas três dimensões.

**Não se trata apenas de construir um dashboard. Trata-se de construir uma solução analítica orientada à gestão.**

---

# 22. Conclusão Executiva

O projeto de Gestão Analítica de Custos Rateados demonstrou como uma estrutura de **Business Intelligence aplicada ao contexto financeiro e contábil** pode transformar dados operacionais em inteligência gerencial.

Por meio do Microsoft Power BI, Power Query, Linguagem M, DAX e modelagem dimensional, foi construída uma solução capaz de consolidar informações, estruturar indicadores, disponibilizar análises históricas e permitir investigação multidimensional dos custos.

A solução fortaleceu a capacidade das áreas usuárias de responder às perguntas fundamentais da gestão financeira:

**Quanto estamos gastando?**

**Onde estamos gastando?**

**Como esse gasto está evoluindo?**

**O que está provocando as variações?**

**Onde estão as maiores concentrações?**

**Quais pontos merecem investigação?**

**Onde existem oportunidades de otimização?**

**Quais decisões devem ser priorizadas?**

A relevância do projeto, portanto, não está somente na tecnologia empregada.

Seu valor está na capacidade de conectar:

**Dados → Informação → Evidência → Insight → Decisão → Valor.**

Esse é o fundamento de uma abordagem moderna de **Business Intelligence, Financial Analytics e gestão baseada em dados**.

---

# Competências Demonstradas

## Competências Técnicas

Business Intelligence, Microsoft Power BI, DAX, Linguagem M, Power Query, Data Analytics, Data Visualization, Dashboard Development, ETL, Data Transformation, Data Modeling, Modelagem Dimensional, Star Schema, KPI Monitoring, Reporting, Data Quality, Data Governance, Financial Analytics, Controllership Analytics, Cost Analytics, SQL, Analytical Thinking.

## Competências de Negócio

Análise Financeira, Contabilidade Gerencial, Controle de Custos, Gestão Orçamentária, Gestão de Despesas, Planejamento Financeiro, Suporte à Tomada de Decisão, Governança Corporativa, Eficiência Operacional, Identificação de Oportunidades, Otimização de Custos, Gestão de Indicadores, Business Partner, Performance Management, Visão Estratégica, Gestão Baseada em Dados, Melhoria Contínua, Geração de Valor para o Negócio.