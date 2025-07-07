Below is a **two-part playbook** for taking GitHub Copilot from first install to a fully-agentic, multi-role SDLC platform and then running the **“AI Act Journey Assistant”** sample project end-to-end.

---

## Part A – GitHub Copilot Agentic: Zero → Hero

|#|What you do|Why it matters|Key refs|
|---|---|---|---|
|**0. Prereqs**|• Copilot Pro + or Enterprise seat• VS Code ≥ 1.90 (or JetBrains / Visual Studio)• Enable **Copilot agent mode** in editor settings ▶ _Settings › GitHub Copilot › Experimental › Agent Mode_• Org admin toggles **“Enable coding agent”** repo policy|Brings IDE “agent mode” **and** repository-level **coding agent** alive|([docs.github.com](https://docs.github.com/en/copilot/how-tos/agents/copilot-coding-agent/enabling-copilot-coding-agent "Enabling Copilot coding agent - GitHub Docs"))|
|**1. Install & sign in**|`ext install GitHub.copilot-chat` in VS Code, sign in with GitHub|Chat + agent mode in the IDE|([github.blog](https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/ "GitHub Copilot: Meet the new coding agent - The GitHub Blog"))|
|**2. Turn on coding agent in the repo**|Repo → _Settings ▸ Copilot ▸ Coding Agent ▸ Enable_ → choose Runner size & timeout|Lets Copilot work issues & open PRs via GitHub Actions|([github.blog](https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/ "GitHub Copilot: Meet the new coding agent - The GitHub Blog"))|
|**3. Create custom instructions & chat modes**|In repo root: `.github/custom-instructions/architect.md`, `.github/chatmodes/architect.chatmode.md`, etc. Use `mode: agent` or `chat` headers and list allowed tools|Gives each SDLC role (Architect, PM, QA, …) its own persona & tool belt|([devblogs.microsoft.com](https://devblogs.microsoft.com/blog/introducing-awesome-github-copilot-customizations-repo "Introducing the Awesome GitHub Copilot Customizations repo - Microsoft for Developers"))|
|**4. Add reusable prompts**|`.github/prompts/create-prd.prompt.md`, `.github/prompts/create-adr.prompt.md`|Slash-run them in chat (`/create-prd`) to keep flows consistent|([devblogs.microsoft.com](https://devblogs.microsoft.com/blog/introducing-awesome-github-copilot-customizations-repo "Introducing the Awesome GitHub Copilot Customizations repo - Microsoft for Developers"))|
|**5. Provide regulation corpus**|Put **EU AI Act** text (chunked .md) in `docs/regulation/` and push. Copilot’s semantic index auto-ingests repo content|Gives agent RAG-ready law text with no extra infra||
|**6. Custom dev env for coding agent**|`.github/copilot-agent.yml` (or repo Settings ▶ Copilot ► **Agent environment**) – add extra apt/pip installs: `mermaid-cli`, `pthon-pdfkit`, etc.|Makes GitHub Actions VM pre-install tools the agent will call|([docs.github.com](https://docs.github.com/en/copilot/how-tos/agents/copilot-coding-agent/customizing-the-development-environment-for-copilot-coding-agent "Customizing the development environment for Copilot coding agent - GitHub Docs"))|
|**7. (Opt) Bring external data via MCP**|Repo → _Settings ▸ MCP servers_ → add GitHub MCP or your own RAG endpoint|Lets agents call vector stores, ticketing APIs, etc.|([github.blog](https://github.blog/ai-and-ml/github-copilot/from-idea-to-pr-a-guide-to-github-copilots-agentic-workflows/ "From idea to PR: A guide to GitHub Copilot’s agentic workflows - The GitHub Blog"))|
|**8. IDE agent mode “vibe coding”**|In VS Code Chat, switch Mode ▸ **Agent** ➜ ask multi-step tasks (“refactor”, “generate tests”)|Local autonomy with visible reasoning loop|([github.blog](https://github.blog/ai-and-ml/github-copilot/from-idea-to-pr-a-guide-to-github-copilots-agentic-workflows/ "From idea to PR: A guide to GitHub Copilot’s agentic workflows - The GitHub Blog"))|
|**9. Issue-to-PR workflow (coding agent)**|1. Create granular Issue with Acceptance Criteria2. **Assign to @github-copilot**3. Watch draft PR & session logs, request tweaks via PR comments|Hands off boilerplate; keeps you as reviewer of record|([github.blog](https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/ "GitHub Copilot: Meet the new coding agent - The GitHub Blog"))|
|**10. Level-up tips**|• Use Codespaces for reproducible envs• Gate agent PRs behind branch protection• Track tokens: each coding-agent model call costs one “premium request”|Enterprise-grade control & cost visibility|([github.blog](https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/ "GitHub Copilot: Meet the new coding agent - The GitHub Blog"))|

---

## Part B – Running the “AI Act Journey Assistant” Project

> **Vision**: A web app that classifies AI use cases against the EU AI Act, walks users through required controls, and spits out an audit-ready PDF/Markdown pack.

### 1. Bootstrap the repo

```bash
gh repo create ai-act-journey-assistant --public
mkdir -p docs/regulation .github/chatmodes .github/prompts
curl -L https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R1684 \
     -o docs/regulation/eu_ai_act.md
git add .
git commit -m "Seed repo with EU AI Act text"
git push -u origin main
```

### 2. Seed role personas

```markdown
# .github/chatmodes/architect.chatmode.md
---
description: "Designs cloud & data architecture, outputs C4+ADRs"
mode: agent
tools: ["codebase","editFiles","runCommands","mermaid","githubRepo"]
---
You are a pragmatic cloud architect…
```

Replicate for **product-manager**, **qa**, **security**, **finops**, etc. ([devblogs.microsoft.com](https://devblogs.microsoft.com/blog/introducing-awesome-github-copilot-customizations-repo "Introducing the Awesome GitHub Copilot Customizations repo - Microsoft for Developers"))

### 3. Reusable prompts

_`.github/prompts/create-prd.prompt.md`_

```yaml
---
mode: agent
description: "Turn a one-line idea into a PRD template."
tools: ["codebase","editFiles"]
---
Generate a full PRD (problem, KPIs, success criteria, epics, UX high-level)…
```

### 4. Kick-off in IDE agent mode

1. Open repo in VS Code.
    
2. Chat → Mode: **Agent**
    
3. `/create-prd "Automate EU AI Act classification for internal teams"` → Copilot writes `docs/prd.md`.
    

### 5. Turn PRD into backlog

```
/create-backlog docs/prd.md granularity:medium estimate:t-shirt
```

Chat command (or slash prompt) produces GitHub Issues.

### 6. Hand tasks to the coding agent

For each generated Issue that’s boilerplate-friendly (e.g., “create Flask service skeleton”, “write Terraform for S3 bucket”):

_Assign_ → **@github-copilot**.  
The coding agent spins up a runner, pushes a draft PR, and logs reasoning/**RAG hits** against `docs/regulation/*`. ([github.blog](https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/ "GitHub Copilot: Meet the new coding agent - The GitHub Blog"))

### 7. Architecture pass

Create an Issue “Produce C4 diagrams + ADRs for initial architecture”, assign to **Architect chat mode** (or Copilot agent).  
Review draft PR: `diagrams/context.mmd`, `docs/adr/0001-tech-stack.md`.

### 8. Front-to-back implementation loop

|Stage|How|
|---|---|
|**Backend**|Copilot coding agent implements FastAPI endpoint, integrates LangChain to embed/reg chunk EU Act text into local SQLite vector DB.|
|**Frontend**|Chat in IDE: “Build a multi-step React form: Step 1 use-case, Step 2 risk results, Step 3 mitigation download.”|
|**Docs**|`/create-audit-template` prompt generates Markdown → coding agent converts to PDF via `pdfkit` in custom agent env.|

### 9. QA & Security

- “Generate PyTest unit + integration tests for classifier” – assign to coding agent.
    
- `/threat-model` custom chat mode produces stride table + mitigations.
    

### 10. Review & merge

Human reviews draft PRs, Copilot auto-responds to change-request comments, CI runs, merge when green.

Resulting repo skeleton:

```
.
├── docs/
│   ├── prd.md
│   ├── architecture.md
│   └── audit-template.md
├── src/
│   ├── api/   # FastAPI
│   └── web/   # React
├── diagrams/
│   └── context.mmd
├── infra/
│   └── main.tf
└── .github/
    ├── chatmodes/
    ├── prompts/
    └── copilot-agent.yml
```

---

### What you get

- **Minutes** from idea → PRD → backlog.
    
- **Hours** instead of days for infra scaffolding, UX shell, and docs.
    
- **Traceable** agent reasoning & RAG citations for every commit (session logs).
    
- **Audit-ready** PDF + markdown pack for Risk/Legal sign-off.
    

---

### Ready for the zip scaffold?

I can generate a downloadable starter repo containing:

1. Fully-wired **chat modes**, **prompts**, and **agent env** file
    
2. Empty FastAPI/React skeleton + Terraform IaC
    
3. Example Issues already assigned to Copilot
    

Just say the word, and I’ll package it up!