
---

# 🛠️ Step-by-Step Setup: Windsurf for Full Agentic SDLC

---

## ⚙️ Step 0: Prerequisites

### 🧑‍💻 Local Environment

- OS: macOS or Linux (recommended)
    
- Python: ≥ 3.10
    
- Node.js: ≥ 18
    
- Docker: (optional, for sandboxing or vector stores)
    
- GitHub account (for GitHub Actions integration)
    
- Obsidian (for documentation if needed)
    

### 📦 Install Essentials

```bash
brew install python node git
pip install --upgrade pip
```

---

## 🌀 Step 1: Install Windsurf

Clone Windsurf (use latest stable release or your fork):

```bash
git clone https://github.com/epfml/windsurf.git
cd windsurf
pip install -e .
```

> 🔍 You can use a virtualenv (`python -m venv .venv && source .venv/bin/activate`) to isolate your Windsurf environment.

---

## 📁 Step 2: Initialize Project

```bash
windsurf init mini-fund-tracker
cd mini-fund-tracker
```

This scaffolds the project with:

```
agents/
memory/
docs/
src/
```

---

## ⚙️ Step 3: Install Core Plugins

```bash
windsurf install windsurf-task-master
windsurf install windsurf-doc-writer
windsurf install windsurf-agent-sandbox
windsurf install windsurf-github
```

Optionally:

```bash
windsurf install windsurf-obsidian-exporter
windsurf install windsurf-memory-weaviate
```

---

## 🧠 Step 4: Setup Memory Backend

### Option 1: Local Memory (basic)

In your `.windsurf/config.yaml`:

```yaml
memory:
  provider: "local"
  path: "./memory/"
```

### Option 2: Vector DB with Weaviate (recommended for persistent agent memory)

Spin up Weaviate locally:

```bash
docker run -d -p 8080:8080 semitechnologies/weaviate:latest \
  --env QUERY_DEFAULTS_LIMIT=25 \
  --env AUTHENTICATION_ANONYMOUS_ACCESS_ENABLED=true \
  --env PERSISTENCE_DATA_PATH="/var/lib/weaviate" \
  --env DEFAULT_VECTORIZER_MODULE="none"
```

Update `config.yaml`:

```yaml
memory:
  provider: "weaviate"
  url: "http://localhost:8080"
```

---

## 🤖 Step 5: Define Role-Based Agents

In `agents/architect.json`:

```json
{
  "name": "Architect Agent",
  "role": "Designs high-level system and cloud architecture",
  "tools": ["doc-writer", "github", "vector-memory"],
  "context_scope": "project",
  "instructions": "./prompts/architect-instructions.md"
}
```

Repeat for:

- `product-strategist.json`
    
- `product-manager.json`
    
- `cloud-engineer.json`
    
- `software-engineer.json`
    
- `qa.json`
    
- `platform.json`
    
- `finops.json`
    
- `security.json`
    

---

## 🧾 Step 6: Write Prompts & Instructions

In `prompts/architect-instructions.md`:

```markdown
You are an architecture agent. Your job is to turn PRDs into C4 diagrams, create ADRs, and propose cloud architecture...
```

Each agent should have a scoped set of instructions.

---

## 📋 Step 7: Configure Task-Master

In `workflows/task-master-config.yaml`:

```yaml
strategy: "round-robin"
default_agent: "product-manager"
routes:
  - trigger: "idea"
    agent: "product-strategist"
  - trigger: "create-prd"
    agent: "product-manager"
  - trigger: "build-architecture"
    agent: "architect"
```

---

## 📄 Step 8: Run the Workflow

```bash
windsurf run --task "idea" --input "I want to build a fund tracker app with personalized alerts and dashboards"
```

This kicks off a task routed to the product strategist, who then hands off to PRD, architecture, and so on.

---

## 📦 Step 9: Export Docs

If you installed `windsurf-obsidian-exporter`:

```bash
windsurf export --format obsidian
```

This creates Quartz/Obsidian-compatible `.md` files in a `vault/` directory.

---

## ✅ Step 10: Test with Example Project

```bash
windsurf run --task "idea" --input "Build a web app that lets users track funds from multiple brokers with analytics"
```

- Agent: Product Strategist → outputs product vision
    
- Agent: Product Manager → writes PRD
    
- Agent: Architect → generates C4 model and ADRs
    
- Agent: Cloud Engineer → provisions IaC setup
    
- Agent: Software Engineer → creates code stubs
    
- Agent: QA → writes tests
    
- Agent: Doc Writer → produces README and runbook
    

---

## 🧙 Final Thoughts

You now have a complete **agentic development environment** that:

- Starts with business ideas
    
- Produces PRDs and diagrams
    
- Creates infra and code
    
- Documents everything for reuse
    

Would you like:

- ✅ A downloadable zip scaffold with prebuilt folders and agent configs?
    
- ✅ A `docker-compose.yaml` for full dev container setup?
    
- ✅ Example PRD and architecture outputs from a sample run?
    

Let me know how you want to proceed!