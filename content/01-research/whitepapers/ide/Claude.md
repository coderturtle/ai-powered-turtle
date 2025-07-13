Below is a **“zero → hero” playbook** for turning Anthropic Claude into a _super-charged_ development companion, then applying the workflow to build the **AI Act Journey Assistant** sample project. I’ve blended the latest official docs with community-proven tricks so you can ramp up fast and still look like a wizard in front of your team.

---

## 1 · First-time setup (≈ 10 min)

|Step|What to do|Why / citation|
|---|---|---|
|**1.1 Sign up & keys**|Create or log in at **console.anthropic.com**, generate an **API key** (Settings ▸ API keys).|Needed for CLI & IDE auth ([Anthropic](https://docs.anthropic.com/en/home "Home - Anthropic"))|
|**1.2 Install CLI**|`bash\nnpm install -g @anthropic-ai/claude-code\n`|The `claude` CLI is the core agentic tool ([Anthropic](https://docs.anthropic.com/en/docs/claude-code/quickstart "Quickstart - Anthropic"))|
|**1.3 Bootstrap a repo**|`bash\ngh repo create amazing-ai-act\ncd amazing-ai-act\ngit init\nclaude /init # creates CLAUDE.md & settings\n`|Seeds project config & a starter `CLAUDE.md` ([Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices "Claude Code Best Practices \ Anthropic"))|
|**1.4 IDE integration**|Install **“Claude Code for VS Code”** from the Marketplace or run it once in the VS Code terminal—auto-detect installs the extension.|In-editor diff view, shortcuts, context awareness ([marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code "Claude Code for VSCode - Visual Studio Marketplace"))|

---

## 2 · Tune your environment like a pro

### 2.1 `CLAUDE.md` – your project’s memory palace

Add quick-hit docs (build commands, style rules, architecture links). Claude auto-ingests it every session, so iteratively refine it and ask Claude to update it for you. ([Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices "Claude Code Best Practices \ Anthropic"))

### 2.2 Allowed-tool hygiene

Keep risky actions gated. Use `/permissions` to whitelist only what’s safe (e.g., `git status`). Grant write perms sparingly—common community mishap is mass-add commits. ([Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices "Claude Code Best Practices \ Anthropic"))

### 2.3 Slash-command templates

Store repeat workflows in `.claude/commands/`. Example `deploy-dev.md`:

```
---
Run an end-to-end deploy to dev.
steps:
  - run "npm test"
  - run "terraform plan -out=plan.out"
  - run "terraform apply plan.out"
```

Triggers with `/deploy-dev`, saving dozens of tokens every day.

### 2.4 Model-Context Protocol (MCP) servers

If you need a vector DB or browser automation, drop a `.mcp.json` pointer; Claude will treat external tools as first-class citizens. ([Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices "Claude Code Best Practices \ Anthropic"))

---

## 3 · Battle-tested tips & tricks

|Tip|Origin|
|---|---|
|**Think of Claude as a “very fast intern with perfect memory”**—give clear steps, then review every line.|([Medium](https://waleedk.medium.com/claude-code-top-tips-lessons-from-the-first-20-hours-246032b943b4 "Claude Code Top Tips: Lessons from the First 20 Hours \| by Waleed Kadous \| Medium"))|
|**Break work into short chats & modular files** to avoid prompt drift on large codebases.|([Reddit](https://www.reddit.com/r/ClaudeAI/comments/1fl5j3t/general_tips_for_developing_a_large_project_using/ "General tips for developing a large project using Claude : r/ClaudeAI"))|
|**Teach it your preferences**: when you correct it, ask Claude to patch `CLAUDE.md` so it won’t repeat mistakes.|([Medium](https://waleedk.medium.com/claude-code-top-tips-lessons-from-the-first-20-hours-246032b943b4 "Claude Code Top Tips: Lessons from the First 20 Hours \| by Waleed Kadous \| Medium"))|
|**Full-lifecycle helper**: let Claude draft tests, PR descriptions, commit messages, even diagrams—quality beats rushed human output.|([Medium](https://waleedk.medium.com/claude-code-top-tips-lessons-from-the-first-20-hours-246032b943b4 "Claude Code Top Tips: Lessons from the First 20 Hours \| by Waleed Kadous \| Medium"))|

---

## 4 · Day-to-day workflows for a senior manager / hands-on architect

|Scenario|Shortcut prompt|
|---|---|
|🗂 **Backlog grooming**|`/story-map docs/prd.md granularity:medium` – auto-splits PRD into Epics & Issues.|
|🏗 **Architecture brief**|“Generate C4 and ADRs for the new streaming pipeline; store in `docs/architecture/`.”|
|📋 **Exec summary**|“Summarise today’s incident Slack thread into an exec-friendly status (<200 words).”|
|💡 **Workshop slides**|“Draft 5 slide bullets explaining EU AI Act impact for product leaders; use conversational tone.”|
|💰 **Cost spike**|“Create a cost-forecast table for our LLM endpoints given 10k, 100k, 1 M calls/month.”|

---

## 5 · Sample project: **AI Act Journey Assistant**

> **Mission**: Web app that classifies use-cases against the EU AI Act, explains risk & controls, and exports an audit pack.

### 5.1 Kick-off (IDE agent mode)

```bash
claude "Create a PRD to automate EU AI Act classification for internal teams."
```

_Claude writes `docs/prd.md` with goals, personas, success metrics._

### 5.2 Backlog & branches

```bash
claude "/create-backlog docs/prd.md granularity:medium"
gh issue list   # verify tickets
```

Assign boilerplate tasks (e.g., “create FastAPI skeleton”) to **@github-copilot** _or_ run:

```bash
claude "Implement the FastAPI skeleton and open a PR named backend-skeleton"
```

### 5.3 Architecture pass

```
claude "Produce C4 context & container diagrams + ADRs; save under docs/architecture."
```

### 5.4 Classifier & RAG engine

```bash
claude "Embed docs/regulation/eu_ai_act.md into a local SQLite vectordb; create `/app/classifier.py` with a retrieve-then-classify pipeline."
```

### 5.5 UX flow

In VS Code chat (agent mode):

```
Design a 3-step React journey: 
1. Use-case form 
2. Risk results with explanations 
3. Download audit pack
```

### 5.6 Audit pack export

```
claude "Create a PDF generator with pdfkit; endpoint /export that bundles risk summary + recommended controls."
```

### 5.7 Security & FinOps check-ins

```
/threat-model web app high-level
/cost-estimate openai_calls=2000/mo aws_lambda_invocations=5000/mo
```

### 5.8 CI/CD & docs

```bash
claude "Write GitHub Actions workflow: lint → test → deploy to AWS Amplify on main."
claude "Update README with dev-container setup."
```

**Result**: In one afternoon you’ll have a repo containing code, CI, diagrams and an auto-generated PDF ready for Risk/Legal review—while you focused on the big decisions, not the boilerplate.

---

## 6 · Next-level moves

|Upgrade|Benefit|
|---|---|
|**Codespaces + `claude` prebuild task**|Zero-setup onboarding for new contributors|
|**`CLAUDE_ORG_PROMPT` env var**|Share company coding standards across all projects|
|**Slack/Teams bot**|Submit `/ai-act-review` command → Claude returns risk rating link|
|**Custom MCP server (Sentry / Grafana)**|Let Claude triage prod alerts autonomously|
|**Fine-tune retrieval corpus**|Embed internal policies to extend compliance coverage|

---

### 🚀 Ready to roll?

Spin up a fresh repo, run `claude /init`, and let your new _hyper-intelligent intern_ shoulder the busywork while you focus on architecture, leadership, and delivering business value. Happy coding!