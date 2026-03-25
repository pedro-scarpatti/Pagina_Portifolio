# Pedro Scarpatti — Portfolio Profissional

> **Python Developer & Data Engineer** — procesamiento de dados, IA, índices reversos e otimização de consultas SQL.

[![Deploy](https://img.shields.io/badge/Deploy-GitHub%20Pages-blue?style=flat-square)](https://pedro-scarpatti.github.io/portifolio/)
[![Python](https://img.shields.io/badge/Python-3.11+-3776ab?style=flat-square&logo=python)](https://www.python.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql)](https://www.postgresql.org/)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6%2B-F7DF1E?style=flat-square&logo=javascript)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## 🎯 O que é

Um portfólio que demonstra **capacidade real de engenharia de dados** através de uma demo interativa funcional (o Simulador de Pipeline de Dados). O site usa apenas HTML, CSS e JavaScript vanilla — provando que o desenvolvedor entende arquitetura sem depender de frameworks.

O objetivo: um recrutador que abre o código deve pensar *"esse dev entende como sistemas de dados funcionam em produção"* — não apenas "sabe fazer um site".

---

## 🔗 Links Rápidos

| Recurso | URL |
|---------|-----|
| **Site ao vivo** | `https://pedro-scarpatti.github.io/portifolio/` |
| **Pipeline Demo** | `/pipeline-simulator.html` |
| **GitHub** | `https://github.com/pedro-scarpatti` |
| **LinkedIn** | `https://linkedin.com/in/pedro-batista-2k99` |

---

## 💼 Projetos Principais

### ⭐ Simulador de Pipeline de Processamento de Dados _(projeto destaque)_

> Demo interativa que simula uma arquitetura real de pipeline de dados no navegador.

**Problema que resolve:** Pipelines de dados em produção falham silenciosamente — sem visibilidade de estado, duplicidade não detectada e logs inexistentes.

**Stack:** JavaScript ES6+ · FIFO Queue · Idempotência via Hash · Event Bus · Structured Logging · Retry Pattern · ETL Pattern

**Funcionalidades implementadas:**

- 🔀 **Fila FIFO com prioridade** — jobs ordenados por criticidade, max 3 workers simultâneos
- 🔒 **Idempotência via hash** — jobs duplicados bloqueados antes do processamento
- 📊 **4 estados visíveis** — `PENDENTE → PROCESSANDO → CONCLUÍDO / ERRO` com timestamps
- 📋 **Logging estruturado** — níveis DEBUG, INFO, SUCCESS, WARNING, ERROR + exportação JSON
- ⚠️ **Simulação de falhas** — taxa configurável 0–50%, erros realistas de produção
- 🔁 **Retry pattern** — até 3 tentativas automáticas
- 🔄 **ETL simulado** — normalização e enriquecimento de dados

---

### 🏥 Sistema de Senhas e Atendimentos (SESA/SUS)

**Stack:** HTML5 · CSS3 · JavaScript ES6 · LocalStorage · Event-driven UI

- Painel operacional com controle de guichês e triage
- Dashboard ao vivo com métricas em tempo real
- Fila ordenada por prioridade e categoria
- Persistência em LocalStorage

---

### ✍️ Editor de Artigos

**Stack:** HTML5 · CSS3 · JavaScript ES6 · ContentEditable API · LocalStorage

- Editor WYSIWYG com toolbar contextual
- Preview em tempo real com formatação live
- Categorização e busca de artigos
- Publicação integrada

---

## 🏗 Arquitetura do Simulador de Pipeline

```
┌──────────────────────────────────────────────────────┐
│                      UI LAYER                         │
│              (pipeline-simulator.html)                │
│   Métricas · Fila · Logs · Controles                  │
└──────────────────────┬───────────────────────────────┘
                       │ eventos
                       ▼
┌──────────────────────────────────────────────────────┐
│               PIPELINE SERVICE                        │
│          (pipeline-simulator.js — Wiring)             │
│   Orchestration · Event handling · UI updates         │
└──────────────────────┬───────────────────────────────┘
                       │ calls
          ┌────────────┼────────────┐
          │            │            │
          ▼            ▼            ▼
┌─────────────┐ ┌──────────┐ ┌──────────────┐
│  Job Model  │ │ Validator│ │  EventBus     │
│  (Job.js)   │ │(DataVal..│ │  (PUB/SUB)   │
└─────────────┘ └──────────┘ └──────────────┘

          ┌────────────┐  ┌────────────────────┐
          │QueueService│  │IdempotencyService  │
          │  (FIFO)    │  │ (Hash → Cache)     │
          └──────┬─────┘  └─────────┬──────────┘
                 │ dequeue           │ hash check
                 ▼                   ▼
┌──────────────────────────────────────────────────────┐
│           PIPELINE PROCESSOR                         │
│        (async workers, retry, ETL)                   │
│  • simulação de delay                                │
│  • simulação de falhas (configurável)               │
│  • enriquecimento de dados                           │
└──────────────────────────────────────────────────────┘
                 │
                 ▼
┌──────────────────────────────────────────────────────┐
│              LOGGING SERVICE                         │
│           (Logger.js — Structured)                   │
│  Timestamps · Níveis · Metadata · Export             │
└──────────────────────────────────────────────────────┘
```

### Decisões Arquiteturais

| Decisão | Por quê |
|---------|---------|
| **Separação services/processors/validators** | Mentalidade de engenharia — cada módulo é independente como um microserviço |
| **FIFO com prioridade** | Simula priority queues reais (RabbitMQ, Azure Service Bus) |
| **Hash de idempotência** | Padrão crítico em sistemas distributed — evita double-processing |
| **Event Bus (PUB/SUB)** | Comunicação desacoplada — se um módulo quebra, os outros continuam |
| **Retry com limite** | Circuit breaker pattern — falha rápida após N tentativas |
| **Structured Logging** | Mesma prática de logging em sistemas Python de produção |
| **JavaScript vanilla** | Dominação da plataforma sem muleta de framework |

---

## 🛠 Stack & Ferramentas

### Linguagens & Dados
| Tecnologia | Nível |
|-----------|-------|
| Python | Avançado |
| SQL / PostgreSQL | Avançado |
| JavaScript ES6+ | Intermediário |
| HTML5 / CSS3 | Intermediário |

### IA & Processamento de Dados
| Tecnologia | Nível |
|-----------|-------|
| LLMs / OpenAI API | Intermediário |
| ETL / Pipelines | Intermediário |
| Índices Reversos | Intermediário |
| Busca Semântica | Básico |

### DevOps & Tools
| Tecnologia | Nível |
|-----------|-------|
| Git | Intermediário |
| Docker | Básico |

---

## 🚀 Como Rodar

### Local (recomendado)

Precisa de um servidor HTTP por causa dos módulos ES6:

```bash
# Python (já vem no Windows/macOS)
cd portifolio
python -m http.server 8080

# Node.js
npx serve .

# PHP
php -S localhost:8080
```

Acesse `http://localhost:8080`

> ⚠️ Os módulos JavaScript usam `type="module"` — Chrome/Firefox bloqueiam execução via `file://` por CORS.

### GitHub Pages

1. Fork ou clone este repositório
2. Habilite GitHub Pages em **Settings → Pages → Source: main**
3. Acesse `https://[seu-user].github.io/[repo]/`

---

## ✅ Checklist de Qualidade

| Área | Implementado |
|------|:---:|
| Validação de input (schema) | ✅ |
| Deduplicação por hash (idempotência) | ✅ |
| Estados do pipeline | ✅ |
| Logging estruturado multi-nível | ✅ |
| Simulação de falhas configurável | ✅ |
| Retry com limite de tentativas | ✅ |
| Transformação de dados (ETL) | ✅ |
| Event Bus (PUB/SUB) | ✅ |
| FIFO com prioridade | ✅ |
| Cache de resultados com TTL | ✅ |
| Exportação de logs (JSON) | ✅ |
| Módulos ES6 separados | ✅ |
| UI responsiva | ✅ |
| Sem frameworks externos | ✅ |
| SEO meta tags | ✅ |
| Acessibilidade (focus-visible, semantic HTML) | ✅ |
| Tema dark | ✅ |

---

## 📁 Estrutura do Projeto

```
portifolio/
├── index.html                     # Página principal
├── pipeline-simulator.html        # Demo interativa
│
├── js/
│   ├── main.js                    # Navegação e efeitos
│   ├── pipeline-simulator.js       # Wiring UI ↔ modules
│   └── modules/
│       ├── models/
│       │   └── Job.js            # Modelo (estados, hash, retry)
│       ├── processors/
│       │   └── PipelineProcessor.js
│       ├── services/
│       │   ├── QueueService.js
│       │   └── IdempotencyService.js
│       ├── validators/
│       │   └── DataValidator.js
│       └── utils/
│           ├── EventBus.js
│           └── Logger.js
│
├── projects/
│   ├── Gerenciador de Senhas.html
│   └── monolithic-article-editor.html
│
└── css/
    ├── variables.css
    ├── base.css
    ├── layout.css
    ├── components.css
    ├── pages.css
    └── pipeline-simulator.css
```

---

## 🔧 Possíveis Melhoras

- [ ] **Persistência em IndexedDB** — fila e resultados persistem entre reloads
- [ ] **Web Workers** — processar items em thread separada (UI não trava)
- [ ] **Backend em Python** — API FastAPI + PostgreSQL para o pipeline real
- [ ] **Integração com LLM** — usar Python + OpenAI API para enriquecimento dos jobs
- [ ] **Índice reverso funcional** — construção de índice invertido sobre os jobs processados
- [ ] **Busca semântica** — vector similarity sobre o conteúdo dos jobs
- [ ] **Gráfico de throughput** — mostrar items processados por segundo
- [ ] **CI/CD** — GitHub Actions para deploy automático no push

---

## 📬 Contato

- 📧 **Email:** scarpatti.pedro@gmail.com
- 💻 **GitHub:** github.com/pedro-scarpatti
- 💼 **LinkedIn:** linkedin.com/in/pedro-batista-2k99

Procuro oportunidades em **Python, dados ou IA** — remote ou híbrido.

---

## 📄 Licença

MIT — sinta-se livre para usar como template, mas personalize com seus próprios projetos.
