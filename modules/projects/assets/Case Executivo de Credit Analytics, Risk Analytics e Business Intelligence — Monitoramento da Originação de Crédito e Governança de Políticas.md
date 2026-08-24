# Case Executivo de Credit Analytics, Risk Analytics e Business Intelligence  
## Monitoramento da Originação de Crédito e Governança de Políticas de Decisão

**Responsável pelo desenvolvimento:** Marco Aurélio Valles Leal  
**Tecnologia principal:** Microsoft Power BI  
**Domínios:** Credit Analytics · Risk Analytics · Business Intelligence · Credit Risk Management · Credit Policy Governance · Operational Analytics

---

## 1. Resumo Executivo

O projeto de **Credit Analytics, Risk Analytics e Business Intelligence** foi desenvolvido para ampliar a capacidade de monitoramento e gestão de uma operação de originação de crédito de aproximadamente **1,6 milhão de propostas por mês**, acompanhando a jornada das propostas desde a digitação inicial até sua aprovação para a mesa de análise.

O principal desafio estava relacionado à necessidade de transformar um grande volume de eventos operacionais e decisões automatizadas em **informação gerencial estruturada**, permitindo que as áreas de Crédito, Risco, Operações e Negócios compreendessem não apenas o volume processado, mas também **por que as propostas estavam sendo aprovadas, recusadas ou retidas** e qual era a contribuição das políticas parametrizadas no motor de decisão **Crivo** para os resultados observados.

A solução foi construída em **Microsoft Power BI**, combinando modelagem de dados, métricas de negócio, medidas DAX, análise multidimensional, indicadores operacionais e visualizações executivas. O dashboard passou a consolidar informações relacionadas à jornada de crédito e ao comportamento das políticas, permitindo análises por produto, modalidade, matriz, hierarquia comercial, UF, companhia elétrica, vendedor, período e faixa horária.

Entre os volumes monitorados estavam **1.664.003 propostas digitadas, 936.051 propostas recusadas e 691.855 propostas aprovadas em P1**, além de indicadores de retenção, conversão e impacto das regras de decisão.

A evolução temporal também evidenciou crescimento de **30,3% nas propostas digitadas, 36,8% nas recusas e 17,4% nas aprovações P1** entre os períodos analisados.

O resultado foi uma camada analítica orientada à gestão, capaz de conectar **dados → evidência → análise → insight → decisão**, fortalecendo a governança das políticas de crédito, aumentando a visibilidade operacional e apoiando decisões baseadas em evidências.

---

# 2. Contexto do Negócio

A originação representa uma etapa crítica do ciclo de crédito. É nesse processo que uma oportunidade comercial é transformada em uma proposta submetida às regras de elegibilidade, risco e capacidade de concessão da instituição.

Em operações de grande escala, pequenas alterações nas taxas de aprovação, recusa ou retenção podem representar impactos relevantes sobre o volume processado, a produtividade operacional, a conversão comercial e a experiência do cliente.

Nesse contexto, o motor de decisão de crédito **Crivo** desempenhava papel central na esteira, aplicando políticas e regras parametrizadas para direcionar o tratamento das propostas.

O desafio não estava apenas em executar as regras, mas em responder continuamente questões gerenciais como:

- Quantas propostas estavam entrando na operação?
- Quantas eram aprovadas?
- Quantas eram recusadas?
- Quantas permaneciam retidas?
- Em quais etapas estavam ocorrendo as maiores perdas?
- Quais políticas apresentavam maior influência sobre as decisões?
- Determinadas regras estavam concentrando volume excessivo de recusas?
- O comportamento das políticas era consistente entre produtos e canais?
- Havia diferenças relevantes entre unidades, vendedores ou regiões?
- Como os indicadores estavam evoluindo ao longo do tempo?
- Quais mudanças operacionais poderiam explicar alterações nos resultados?

A ausência de uma visão integrada dificultava a transformação dessas perguntas em análises recorrentes.

O projeto surgiu, portanto, como uma iniciativa de **Analytics aplicada à gestão da originação**, estabelecendo uma camada de inteligência capaz de conectar a operação transacional às necessidades estratégicas das áreas de Crédito, Risco, Operações e Negócios.

---

# 3. Problema

## 3.1 Complexidade operacional

Uma operação próxima de 1,6 milhão de propostas mensais gera elevado volume de eventos, registros de decisão e combinações analíticas.

O acompanhamento manual ou baseado exclusivamente em relatórios estáticos não era suficiente para proporcionar uma visão completa da operação.

Era necessário acompanhar simultaneamente:

- volume de propostas;
- aprovação;
- recusa;
- retenção;
- conversão;
- evolução temporal;
- comportamento das regras;
- desempenho operacional;
- diferenças regionais;
- diferenças comerciais;
- comportamento por produto e modalidade;
- influência das políticas sobre o resultado final.

A complexidade aumentava pela necessidade de cruzar esses indicadores sob diferentes perspectivas.

## 3.2 Baixa visibilidade sobre a esteira

A simples informação de que uma proposta havia sido aprovada ou recusada não explicava o comportamento da operação.

Para a gestão de crédito, era necessário entender **o caminho percorrido pela proposta e os eventos decisórios associados a ela**.

Isso exigia transformar registros operacionais em uma visão analítica da jornada:

**Digitação → processamento → aplicação das regras → aprovação/recusa/retenção → encaminhamento para mesa.**

## 3.3 Governança das políticas de crédito

Outro desafio importante era monitorar as políticas parametrizadas no Crivo.

As regras automatizadas exercem influência direta sobre os resultados da operação. Consequentemente, alterações de parametrização, mudanças no perfil das propostas ou efeitos combinados entre políticas poderiam alterar significativamente os indicadores.

Era necessário estabelecer mecanismos para identificar:

- regras com maior incidência;
- políticas associadas às recusas;
- políticas relacionadas às retenções;
- políticas que influenciavam aprovações;
- variações no comportamento das regras;
- diferenças entre segmentos;
- potenciais efeitos não desejados;
- oportunidades de revisão ou otimização.

## 3.4 Necessidade de integração entre Crédito, Risco, Operações e Negócios

Cada área possuía uma perspectiva diferente:

**Crédito** precisava avaliar a efetividade das políticas.

**Risco** precisava monitorar o comportamento das regras e seus efeitos sobre as decisões.

**Operações** precisava identificar gargalos e desvios na esteira.

**Negócios** precisava compreender impactos sobre conversão, volume e produtividade comercial.

O projeto deveria, portanto, estabelecer uma linguagem comum baseada em indicadores e evidências.

---

# 4. Dados

A solução foi estruturada sobre informações relacionadas à originação das propostas, aos eventos da esteira e às decisões produzidas pelas políticas de crédito.

## 4.1 Dados de originação

Os dados de originação representavam a entrada da proposta na operação, contemplando informações necessárias para acompanhar seu processamento.

Entre os principais atributos analíticos estavam:

- identificador da proposta;
- data de digitação;
- horário de digitação;
- produto;
- modalidade;
- matriz;
- unidade;
- UF;
- companhia elétrica;
- vendedor;
- informações comerciais;
- status da proposta;
- resultado da decisão;
- eventos da jornada.

## 4.2 Dados das políticas de crédito

A solução incorporou informações relacionadas às políticas parametrizadas no motor Crivo, permitindo associar as decisões aos respectivos eventos de regra.

Essa camada possibilitou avaliar a contribuição individual das políticas e identificar aquelas com maior influência sobre os resultados.

## 4.3 Eventos da esteira decisória

Os eventos permitiram representar o comportamento da proposta ao longo do processo, incluindo:

- entrada;
- processamento;
- decisão;
- aprovação;
- recusa;
- retenção;
- encaminhamento para mesa;
- demais eventos relevantes da jornada.

## 4.4 Dimensões analíticas

O modelo foi concebido para permitir análises multidimensionais utilizando diferentes perspectivas:

- Produto;
- Modalidade;
- Matriz;
- Hierarquia Comercial;
- Unidade Federativa;
- Companhia Elétrica;
- Vendedor;
- Data;
- Período;
- Faixa Horária;
- Política de Crédito;
- Resultado da Decisão.

Essa estrutura permitiu sair de uma visão exclusivamente agregada e investigar os indicadores sob diferentes contextos.

---

# 5. Evidência

A necessidade de monitoramento estruturado tornou-se evidente a partir da magnitude dos volumes e da dinâmica observada na operação.

Entre os indicadores monitorados estavam:

| Indicador | Volume |
|---|---:|
| Propostas digitadas | 1.664.003 |
| Propostas recusadas | 936.051 |
| Propostas aprovadas em P1 | 691.855 |

Além dos volumes absolutos, a análise incorporava:

- propostas retidas;
- taxas de aprovação;
- taxas de recusa;
- taxas de conversão;
- participação das políticas;
- evolução temporal;
- variações entre períodos;
- comportamento por segmento.

A análise histórica também evidenciou:

- **+30,3%** no volume de propostas digitadas;
- **+36,8%** no volume de propostas recusadas;
- **+17,4%** no volume de propostas aprovadas em P1.

Essas variações demonstravam que o simples acompanhamento do volume total não era suficiente.

Um crescimento de propostas, por exemplo, poderia representar expansão comercial, mas também poderia estar acompanhado de crescimento desproporcional nas recusas.

Da mesma forma, alterações nas aprovações poderiam estar relacionadas a mudanças no perfil das propostas, comportamento comercial, composição da operação ou efeito das políticas de crédito.

A evidência reforçou a necessidade de uma abordagem analítica integrada.

---

# 6. Arquitetura Analítica da Solução

## 6.1 Visão conceitual

A arquitetura analítica foi estruturada para transformar dados operacionais em informação gerencial:

**Fontes Operacionais → Tratamento e Transformação → Modelo Analítico → Métricas → Visualizações → Insights → Decisão**

O objetivo não era simplesmente apresentar dados, mas criar uma camada de informação reutilizável para análises recorrentes.

## 6.2 Fontes de dados

A solução utilizou informações relacionadas a:

- originação de propostas;
- registros da esteira;
- resultados de decisão;
- políticas de crédito;
- atributos comerciais;
- dimensões organizacionais;
- dimensões geográficas;
- informações temporais.

## 6.3 Estrutura dos dados de originação

A estrutura analítica foi organizada em torno do conceito de **proposta de crédito** e dos eventos associados à sua jornada.

Essa abordagem permitiu relacionar:

**Proposta → Evento → Regra → Decisão → Resultado.**

Essa estrutura é especialmente importante em Credit Analytics porque evita tratar a decisão apenas como um indicador final, preservando a capacidade de investigar os fatores que levaram ao resultado.

## 6.4 Modelagem dimensional

O modelo analítico foi estruturado para permitir exploração multidimensional.

A camada de fatos concentrou os eventos e métricas da operação, enquanto dimensões permitiram segmentar e contextualizar os resultados.

As principais dimensões contemplaram:

- tempo;
- produto;
- modalidade;
- matriz;
- estrutura comercial;
- geografia;
- companhia elétrica;
- vendedor;
- política;
- decisão.

## 6.5 Camadas de transformação

Os dados passaram por etapas conceituais de:

1. ingestão;
2. padronização;
3. tratamento;
4. validação;
5. transformação;
6. relacionamento;
7. agregação analítica;
8. disponibilização para indicadores.

Essa estrutura contribuiu para reduzir inconsistências e estabelecer uma definição única para as métricas utilizadas pelas diferentes áreas.

## 6.6 Construção dos indicadores

Foram estruturados indicadores para responder às principais perguntas da operação:

- Quantas propostas entraram?
- Quantas foram aprovadas?
- Quantas foram recusadas?
- Quantas foram retidas?
- Qual a taxa de aprovação?
- Qual a taxa de recusa?
- Qual a taxa de conversão?
- Como os indicadores evoluíram?
- Quais políticas tiveram maior influência?
- Quais segmentos apresentaram comportamento diferenciado?

## 6.7 Modelagem das regras de negócio

A modelagem das regras buscou representar o comportamento das políticas de crédito dentro da análise.

Isso permitiu transformar o resultado do motor Crivo em uma estrutura interpretável para o usuário de negócio.

A regra deixou de ser apenas um registro técnico e passou a ser tratada como uma dimensão analítica da decisão.

## 6.8 Métricas de crédito

A solução contemplou métricas relacionadas a:

- volume de propostas;
- aprovação;
- recusa;
- retenção;
- conversão;
- participação das decisões;
- impacto das políticas;
- evolução temporal;
- variação percentual;
- comparação entre períodos.

## 6.9 Visualizações analíticas

O Power BI foi utilizado para construir uma experiência de análise integrada, combinando:

- cartões de KPI;
- gráficos temporais;
- gráficos comparativos;
- tabelas analíticas;
- segmentações;
- filtros;
- análises hierárquicas;
- análises de contribuição;
- waterfall charts;
- navegação entre perspectivas.

## 6.10 Governança das informações

A solução também contribuiu para a governança ao estabelecer definições padronizadas dos principais indicadores.

A existência de métricas centralizadas reduziu o risco de interpretações divergentes entre áreas e permitiu que discussões operacionais e estratégicas fossem conduzidas sobre uma mesma base analítica.

## 6.11 Atualização e manutenção

A estrutura foi concebida para permitir atualização recorrente dos indicadores, manutenção das regras de negócio e evolução das dimensões analíticas.

Essa característica transformou o dashboard de um relatório pontual em uma ferramenta contínua de monitoramento.

---

# 7. Dashboard de Originação e Monitoramento de Políticas

O dashboard foi concebido como uma camada executiva e operacional para acompanhar a jornada das propostas e investigar os fatores associados aos resultados.

## 7.1 Monitoramento da jornada

A primeira perspectiva apresentava a evolução das propostas desde a digitação até seus resultados.

O objetivo era permitir uma leitura rápida da operação:

**Entrada → Processamento → Aprovação/Recusa/Retenção → Mesa.**

Essa visão permitia identificar alterações de comportamento e potenciais pontos de atenção na esteira.

## 7.2 Indicadores de digitação, aprovação e recusa

Os principais KPIs contemplavam:

- propostas digitadas;
- propostas aprovadas;
- propostas recusadas;
- propostas retidas;
- aprovação P1;
- taxa de aprovação;
- taxa de recusa;
- taxa de conversão.

Os indicadores podiam ser analisados tanto em valores absolutos quanto relativos.

## 7.3 Métricas de retenção

A retenção recebeu tratamento específico porque representa uma condição diferente de uma aprovação ou recusa imediata.

A análise permitia investigar o volume retido e sua distribuição entre diferentes segmentos da operação.

## 7.4 Evolução temporal

A dimensão temporal permitia observar:

- evolução diária;
- comportamento por período;
- tendências;
- crescimento;
- retração;
- variações percentuais;
- mudanças de padrão.

Essa análise foi fundamental para identificar mudanças estruturais no comportamento da operação.

## 7.5 Comparações entre períodos

A comparação entre períodos permitiu contextualizar os resultados.

Em vez de analisar um indicador isoladamente, a gestão podia avaliar sua evolução relativa.

Foi possível evidenciar, por exemplo, o crescimento de:

- 30,3% nas propostas digitadas;
- 36,8% nas recusas;
- 17,4% nas aprovações P1.

## 7.6 Visão por produto

Permitiu identificar diferenças no comportamento da originação entre produtos e apoiar análises específicas de performance.

## 7.7 Visão por modalidade

A segmentação por modalidade possibilitou aprofundar a análise da composição das propostas e identificar comportamentos específicos de cada modalidade.

## 7.8 Visão por matriz

A matriz permitiu avaliar diferenças na performance das propostas conforme a estrutura operacional/comercial correspondente.

## 7.9 Visão por hierarquia comercial

A análise da hierarquia comercial permitiu identificar concentrações, diferenças de performance e oportunidades de atuação em diferentes níveis organizacionais.

## 7.10 Visão por UF

A dimensão geográfica permitiu avaliar a distribuição regional da operação e comparar indicadores entre unidades federativas.

## 7.11 Visão por companhia elétrica

Essa dimensão permitiu identificar diferenças no comportamento das propostas associadas às respectivas companhias elétricas.

## 7.12 Visão por vendedor

A análise por vendedor proporcionou uma perspectiva granular sobre a origem das propostas, possibilitando investigar diferenças de volume e comportamento ao longo da esteira.

## 7.13 Visão por faixa horária

A dimensão horária possibilitou investigar concentração de demanda e comportamento operacional ao longo do dia.

Essa análise contribui para identificar períodos de maior pressão sobre a esteira e possíveis oportunidades de otimização operacional.

---

# 8. Análise de Políticas de Crédito

## 8.1 Estrutura do motor Crivo

O motor Crivo representava a camada responsável pela aplicação das políticas parametrizadas para avaliação das propostas.

A análise desenvolvida não tratava o motor apenas como uma "caixa-preta".

O objetivo era tornar seus resultados observáveis e analiticamente interpretáveis.

## 8.2 Regras parametrizadas

Cada política podia ser analisada considerando sua participação na jornada e seu relacionamento com os resultados observados.

Essa abordagem permitiu transformar regras técnicas em elementos de gestão.

## 8.3 Monitoramento das decisões

O dashboard permitia acompanhar a distribuição das decisões e investigar quais políticas estavam associadas aos resultados.

Isso possibilitou responder questões como:

- Quais regras apresentavam maior incidência?
- Quais estavam associadas às recusas?
- Quais estavam relacionadas às retenções?
- Quais apresentavam maior influência sobre o resultado final?

## 8.4 Avaliação individual das políticas

A análise individual permitiu avaliar cada política separadamente.

Isso foi importante porque uma visão agregada poderia ocultar o efeito de determinadas regras.

Ao decompor os resultados por política, tornou-se possível identificar concentração de impacto e priorizar investigações.

## 8.5 Impacto sobre aprovação

As análises permitiram avaliar as políticas associadas aos resultados de aprovação e entender quais condições contribuíam para a evolução das propostas dentro da esteira.

## 8.6 Impacto sobre recusa

A análise das recusas permitiu identificar as políticas com maior influência sobre esse resultado.

Essa informação é relevante para avaliar:

- concentração de recusas;
- estabilidade das regras;
- alterações de comportamento;
- potenciais oportunidades de calibração.

## 8.7 Impacto sobre retenção

As retenções foram analisadas de maneira independente, permitindo investigar quais políticas contribuíam para manter propostas fora de uma decisão imediata.

## 8.8 Estudos comparativos entre regras

A comparação entre políticas permitiu identificar diferenças de incidência e contribuição.

Essa abordagem favoreceu a priorização de análises de causa e efeito operacional, evitando que a gestão se concentrasse apenas nos indicadores finais.

## 8.9 Performance das políticas

A performance das políticas foi analisada considerando:

- frequência;
- participação;
- evolução;
- impacto;
- distribuição;
- comportamento por segmento.

## 8.10 Governança das decisões automatizadas

A principal contribuição dessa camada foi transformar a governança do motor de decisão em uma atividade orientada por evidências.

A gestão passou a ter maior capacidade de observar o comportamento das políticas e discutir mudanças com base em dados históricos e operacionais.

---

# 9. Análises Waterfall

## 9.1 Objetivo

As análises waterfall foram utilizadas para decompor o resultado agregado da operação e evidenciar a contribuição incremental das políticas de crédito.

A abordagem permite partir de uma população inicial de propostas e observar como sucessivas regras alteram o conjunto de propostas que permanece elegível ou segue para diferentes resultados.

Conceitualmente:

**População Inicial → Regra 1 → Regra 2 → Regra 3 → ... → Resultado Final**

## 9.2 Impacto incremental

A principal vantagem da abordagem está em evidenciar a contribuição de cada política no processo.

Em vez de apresentar apenas:

> "936.051 propostas foram recusadas",

a análise permite investigar:

> "Quais políticas contribuíram para formar esse resultado e qual foi a influência relativa de cada uma?"

Essa mudança representa uma evolução importante de **monitoramento descritivo para análise causal-operacional da decisão**, respeitando o caráter analítico do indicador.

## 9.3 Waterfall de recusa

No cenário de recusa, a análise permitiu identificar as regras que apresentavam maior influência sobre a redução da população elegível.

As regras com maior impacto passaram a constituir pontos prioritários para investigação de:

- concentração;
- estabilidade;
- comportamento histórico;
- segmentação;
- possíveis efeitos não desejados.

## 9.4 Waterfall de retenção

A mesma metodologia foi aplicada à retenção, permitindo observar quais regras contribuíam para manter propostas fora de uma decisão definitiva.

## 9.5 Waterfall de aprovação

Na perspectiva de aprovação, a decomposição permitiu analisar o conjunto de condições que sustentava a progressão das propostas.

## 9.6 Valor gerencial

O waterfall agregou uma camada de explicabilidade à análise.

O gestor passou a visualizar não apenas o resultado, mas também a composição desse resultado.

Isso favoreceu discussões mais objetivas sobre:

- revisão de políticas;
- priorização de análises;
- impacto potencial de mudanças;
- monitoramento de alterações;
- governança do motor de decisão.

---

# 10. Recursos do Microsoft Power BI

O Microsoft Power BI constituiu a principal plataforma de Business Intelligence da solução.

## 10.1 Modelagem de dados

A modelagem estruturou os relacionamentos entre propostas, eventos, políticas e dimensões analíticas.

O objetivo foi garantir consistência, desempenho e flexibilidade para exploração dos dados.

## 10.2 Medidas DAX

Foram utilizadas medidas analíticas para cálculo e acompanhamento de indicadores como:

- quantidade de propostas;
- aprovação;
- recusa;
- retenção;
- conversão;
- participação;
- variação;
- evolução;
- comparações entre períodos;
- indicadores relacionados às políticas.

A utilização de DAX permitiu centralizar a lógica das métricas e criar indicadores dinamicamente responsivos aos filtros aplicados.

## 10.3 Indicadores de performance

Os KPIs foram estruturados para fornecer uma leitura executiva rápida da operação.

A camada de indicadores permitia identificar rapidamente:

- tamanho da operação;
- comportamento das decisões;
- evolução temporal;
- pontos de atenção;
- diferenças entre segmentos.

## 10.4 Segmentações e filtros

A experiência analítica utilizou filtros para permitir exploração por:

- produto;
- modalidade;
- matriz;
- hierarquia;
- UF;
- companhia elétrica;
- vendedor;
- período;
- faixa horária;
- política;
- decisão.

## 10.5 Navegação analítica

A estrutura de navegação permitiu transitar entre uma visão executiva e perspectivas analíticas mais detalhadas.

Isso favoreceu uma abordagem **top-down**:

**KPI → Segmento → Política → Regra → Evidência.**

## 10.6 Análise multidimensional

O Power BI permitiu cruzar múltiplas dimensões sem necessidade de produzir relatórios separados para cada pergunta.

Essa capacidade aumentou significativamente a flexibilidade da análise.

## 10.7 Visualizações executivas

As visualizações foram organizadas para facilitar a interpretação por gestores e usuários de negócio.

O foco não estava apenas na estética do dashboard, mas na construção de uma narrativa analítica:

**O que aconteceu? → Onde aconteceu? → Quando aconteceu? → Por que aconteceu? → O que deve ser investigado?**

## 10.8 Dashboard corporativo

O resultado foi uma solução corporativa de acompanhamento capaz de atender diferentes níveis de análise:

- executivo;
- gerencial;
- operacional;
- analítico.

---

# 11. Insight

A combinação entre indicadores operacionais e análise das políticas permitiu evoluir de uma visão puramente descritiva para uma compreensão mais aprofundada do comportamento da esteira.

Entre os principais insights proporcionados pela solução destacam-se:

### 11.1 Identificação de padrões de comportamento

A segmentação por produto, modalidade, matriz, região, vendedor e horário permitiu identificar diferenças relevantes no comportamento da originação.

### 11.2 Identificação de concentração de impacto

As análises das políticas evidenciaram que determinadas regras poderiam concentrar parcela relevante dos efeitos observados sobre aprovação, recusa ou retenção.

Essa informação permitiu direcionar esforços analíticos para as políticas de maior relevância.

### 11.3 Identificação de gargalos

A observação da jornada permitiu localizar pontos de concentração e retenção na esteira.

### 11.4 Identificação de efeitos não desejados

Ao cruzar políticas, períodos e segmentos, tornou-se possível investigar comportamentos que poderiam indicar impactos não planejados de determinadas regras.

### 11.5 Identificação de oportunidades de otimização

A decomposição das decisões permitiu priorizar análises sobre regras com maior influência.

Isso criou condições para avaliar cenários de:

- calibração;
- revisão;
- manutenção;
- monitoramento intensificado;
- alteração de parâmetros.

### 11.6 Compreensão da evolução operacional

As variações de 30,3% nas propostas digitadas, 36,8% nas recusas e 17,4% nas aprovações P1 demonstraram a importância de acompanhar simultaneamente volume e resultado.

Uma expansão da entrada de propostas não necessariamente implica crescimento proporcional da aprovação.

Esse tipo de relação passou a ser visível por meio da análise integrada.

---

# 12. Decisão

A solução criou condições para que as áreas envolvidas utilizassem os dados como instrumento de gestão.

## Crédito

A área de Crédito passou a dispor de maior visibilidade sobre:

- comportamento das políticas;
- concentração de decisões;
- impacto das regras;
- evolução das aprovações;
- comportamento das recusas;
- oportunidades de revisão.

## Risco

Para Risco, a solução fortaleceu a capacidade de monitoramento das políticas e de investigação de alterações no comportamento da decisão automatizada.

A análise das regras permitiu transformar o acompanhamento do motor em uma atividade mais estruturada de governança.

## Operações

A área de Operações passou a ter maior capacidade de identificar:

- gargalos;
- concentrações;
- horários críticos;
- diferenças entre unidades;
- comportamento da esteira;
- desvios de performance.

## Negócios

A área de Negócios passou a contar com uma visão mais completa sobre o relacionamento entre volume comercial, originação, aprovação e conversão.

## Governança

De forma transversal, o dashboard criou uma base comum para discussões entre áreas.

A tomada de decisão passou a ser sustentada por indicadores padronizados e evidências observáveis.

---

# 13. Impacto

O projeto gerou impacto em diferentes dimensões da gestão da operação.

## 13.1 Aumento da visibilidade

A operação passou a ser acompanhada de maneira integrada, desde a entrada das propostas até os resultados da esteira.

## 13.2 Fortalecimento da governança analítica

A criação de indicadores padronizados proporcionou maior consistência na interpretação dos resultados.

## 13.3 Maior capacidade de monitoramento das políticas

As regras do motor Crivo passaram a ser analisadas como componentes mensuráveis da operação.

Isso fortaleceu a capacidade de identificar políticas de maior impacto e priorizar investigações.

## 13.4 Identificação de gargalos

A visão da jornada permitiu identificar pontos de concentração e retenção, apoiando iniciativas de melhoria operacional.

## 13.5 Tomada de decisão baseada em dados

A solução criou uma ponte entre dados operacionais e decisões gerenciais.

Em vez de decisões baseadas exclusivamente em percepção, as áreas passaram a contar com evidências quantitativas.

## 13.6 Aumento da eficiência operacional

A capacidade de identificar gargalos e padrões permitiu direcionar esforços para pontos de maior relevância operacional.

## 13.7 Alinhamento entre áreas

Crédito, Risco, Operações e Negócios passaram a compartilhar uma mesma camada de informação, reduzindo assimetria de conhecimento e favorecendo decisões coordenadas.

## 13.8 Escalabilidade analítica

O Power BI permitiu transformar um volume de aproximadamente 1,6 milhão de propostas mensais em uma camada de análise navegável e orientada à gestão.

## 13.9 Evolução da maturidade de Analytics

O projeto representou uma evolução de:

**Relatórios operacionais → Business Intelligence → Credit Analytics → Policy Analytics → Decision Support.**

A solução deixou de responder somente **"quanto aconteceu?"** e passou a apoiar perguntas como:

**"onde aconteceu?", "quando aconteceu?", "qual regra influenciou?", "qual segmento apresentou o comportamento?" e "onde devemos concentrar a investigação?"**

---

# 14. Valor Estratégico do Projeto

O principal valor estratégico do projeto esteve na transformação de dados de originação em **inteligência aplicada à decisão de crédito**.

A solução criou uma estrutura na qual:

**Dados** representavam a operação;

**Evidências** demonstravam o comportamento;

**Análises** explicavam diferenças e relações;

**Insights** identificavam oportunidades;

**Decisões** direcionavam ações;

**Impacto** podia ser acompanhado por indicadores.

Essa lógica permitiu aproximar Analytics das decisões de negócio.

O dashboard não funcionou apenas como uma ferramenta de visualização, mas como uma camada de **governança, monitoramento e suporte à decisão**.

A capacidade de analisar individualmente as políticas do Crivo, combinada às análises multidimensionais da operação, criou maior transparência sobre o funcionamento da esteira de crédito.

---

# 15. Síntese Executiva — Problema → Dados → Evidência → Análise → Insight → Decisão → Impacto

| Etapa | Aplicação no projeto |
|---|---|
| **Problema** | Baixa visibilidade sobre uma operação de aproximadamente 1,6 milhão de propostas mensais e dificuldade para compreender o impacto das políticas de crédito. |
| **Dados** | Originação, eventos da esteira, decisões, políticas Crivo e dimensões de produto, modalidade, matriz, hierarquia, UF, companhia elétrica, vendedor, período e horário. |
| **Evidência** | 1.664.003 propostas digitadas, 936.051 recusadas e 691.855 aprovadas em P1, além de crescimento de 30,3%, 36,8% e 17,4%, respectivamente, entre os períodos analisados. |
| **Análise** | Modelagem analítica, DAX, KPIs, análise multidimensional, segmentações, filtros, evolução temporal e análise das políticas. |
| **Insight** | Identificação de padrões, concentração de impacto, gargalos, comportamento diferenciado entre segmentos e oportunidades de otimização das regras. |
| **Decisão** | Suporte à revisão de políticas, monitoramento operacional, priorização de análises e fortalecimento da governança entre Crédito, Risco, Operações e Negócios. |
| **Impacto** | Maior visibilidade, governança analítica, eficiência operacional, capacidade de monitoramento e tomada de decisão orientada por evidências. |

---

# 16. Conclusão

O projeto consolidou uma aplicação estratégica de **Credit Analytics, Risk Analytics e Business Intelligence** voltada ao monitoramento da originação e à governança das políticas de decisão de crédito.

Ao lidar com uma operação de aproximadamente 1,6 milhão de propostas mensais, a solução demonstrou que o desafio não estava apenas no processamento de grandes volumes de dados, mas na capacidade de transformar esse volume em **informação acionável para gestão**.

Por meio do Microsoft Power BI, modelagem analítica, métricas DAX, análises multidimensionais e visualizações avançadas, foi criada uma camada integrada para monitorar a jornada das propostas e investigar os fatores que influenciavam seus resultados.

A análise das políticas parametrizadas no Crivo representou um diferencial importante ao permitir que decisões automatizadas fossem acompanhadas de forma analítica, tornando possível identificar as regras de maior influência sobre aprovação, recusa e retenção.

As análises waterfall ampliaram essa capacidade ao decompor os resultados e demonstrar o impacto incremental das políticas, proporcionando maior transparência para discussões de governança e otimização.

Dessa forma, o projeto conectou **tecnologia, dados, crédito, risco e negócio**, estabelecendo um modelo de gestão baseado em evidências.

Mais do que um dashboard, a solução constituiu uma plataforma analítica para apoiar a evolução contínua da operação de crédito, fortalecendo a governança das decisões automatizadas, aumentando a eficiência da esteira e criando maior alinhamento entre as áreas responsáveis pela gestão do processo.

---

# 17. Competências Demonstradas

## Competências Técnicas

Credit Analytics · Risk Analytics · Business Intelligence · Microsoft Power BI · Data Analytics · Dashboard Development · KPI Monitoring · Data Visualization · DAX · Data Modeling · Analytical Modeling · Performance Monitoring · Credit Policy Monitoring · Decision Engine Analysis · Waterfall Analysis · Business Analysis · Data Storytelling · Reporting · Operational Analytics · Quantitative Analysis · Analytical Reporting · Multidimensional Analysis · Metrics Engineering · Data Interpretation

## Competências de Negócio

Credit Risk Management · Credit Policy Governance · Credit Operations · Decision Support · Business Strategy · Portfolio Monitoring · Operational Excellence · Continuous Improvement · Process Optimization · Performance Management · Analytical Governance · Data-Driven Decision Making · Stakeholder Management · Business Performance · Strategic Analysis · Financial Services Analytics · Risk Management · Business Insights · Organizational Efficiency · Value Generation