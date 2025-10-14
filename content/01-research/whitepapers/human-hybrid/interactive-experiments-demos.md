Love that. Here’s a tight, “show-by-doing” plan that turns your static docs into an **interactive, hands-on program** using **GitHub Copilot** and **Claude Code**. It’s designed so anyone can clone a repo (or open Codespaces), follow the prompts, and _experience_ hybrid human+agent work—not just read about it.

# 0) What “interactive” means here

- **A runnable repo** with labs that mirror your experiments (A1, A2, A3).
    
- **Guided prompts** for Copilot & Claude Code embedded right in issues, READMEs, and PR templates.
    
- **CI checks** that score agent-assisted work (tests + “evals”).
    
- **Bots-as-coaches**: automated PR comments with next steps, plus “green-beret hints” when people get stuck.
    

---

# 1) Repo blueprint (hands-on lab monorepo)

```
hybrid-humans-agents/
├─ README.md                          # 5-minute tour + quickstart
├─ /labs/
│  ├─ A1-product-discovery/           # Onboarding journey lab (PM/Design/BA heavy)
│  │   ├─ README.md                   # Story + acceptance criteria + demo script
│  │   ├─ /prompts/                   # Prompt recipes (Copilot & Claude)
│  │   ├─ /brd/                       # BRD templates; “agent-draft → human-sign”
│  │   └─ /ui-prototype/              # Minimal Next.js prototype to iterate
│  ├─ A2-engineering-cell/            # Refactor fund-selection to micro-frontend
│  │   ├─ README.md
│  │   ├─ /app/                       # Starter code w/ failing tests & TODOs
│  │   ├─ /tests/                     # Unit/contract/property tests
│  │   └─ /evals/                     # Simple eval harness (e.g., pytest scripts)
│  └─ A3-advisor-service-desk/        # Advisor support workflow (Writer/MS 365 Copilot)
│      ├─ README.md
│      ├─ /playbooks/                 # Email templates, policy clauses, disclaimers
│      └─ /workflow/                  # Minimal service app stub (forms + summaries)
├─ /ops/
│  ├─ golden-pipeline.md              # “Policy lives in the pipeline” checklist
│  └─ evidence-pack.md                # What to capture for audit-by-default
├─ /.github/
│  ├─ ISSUE_TEMPLATE/
│  │   ├─ 01_lab_task.yml             # Pre-filled tasks with agent prompts
│  │   └─ 02_retro.yml                # What data and reflections to capture
│  ├─ PULL_REQUEST_TEMPLATE.md        # “What did the agent do vs you?” + checkboxes
│  └─ workflows/
│      ├─ ci.yml                      # build/test + evals + artifact report
│      └─ pr-comment.yml              # posts coach-style feedback on PRs
└─ /dev/
   ├─ devcontainer.json               # Codespaces/Dev Container w/ Copilot enabled
   └─ editor-setup.md                 # How to enable Claude Code + Copilot locally
```

---

# 2) Codespaces & local dev: zero-friction start

- **devcontainer.json** pre-installs Node/Python + test tools, enables GitHub Copilot, and includes a “Start Here” postCreateCommand that:
    
    - opens `/labs/A1-product-discovery/README.md`,
        
    - runs `npm install` for prototypes,
        
    - prints “Try these Copilot/Claude prompts” next steps in the terminal.
        

---

# 3) “Guided prompts” woven into the work

Each lab has **copy-pasteable prompt cards** that participants use in Copilot Chat or Claude Code. Examples:

### Copilot (PM/BA/Design)

- “Draft a BRD from these user stories and acceptance criteria (below). Add explicit out-of-scope, risks, and open questions.”
    
- “Generate a testable epic → story → task tree for the onboarding journey targeting . Include a definition of done per task.”
    

### Claude Code (Engineers/Architects)

- “Given `app/` and `tests/`, refactor `FundSelector` into a micro-frontend while preserving all contract tests. Propose a rollout plan (behind a flag) and create migration steps.”
    
- “Write property tests for `PortfolioRebalancer` covering edge cases for fee thresholds and currency rounding.”
    

### Mixed (Advisor Support)

- “From `/playbooks/suitability-clauses.md`, draft a client-ready email comparing Fund A vs Fund B with required disclaimers; keep reading age 9–10, add a ‘check with your advisor’ CTA.”
    

---

# 4) Issue & PR templates that teach by doing

**Issue template** (excerpt):

```yaml
name: A2 – Refactor task
body:
  - type: markdown
    attributes:
      value: |
        **Goal**: Extract FundSelector into `mf-fund-selector` MFE.
        **Try this in Copilot Chat**: “Outline a safe MFE extraction plan with steps and guardrails.”
  - type: checkboxes
    attributes:
      label: Did you try these?
      options:
        - label: Copilot: scaffold tests first
        - label: Claude Code: generate refactor plan & migration script
        - label: Human review of API boundaries completed
  - type: textarea
    attributes:
      label: What the agent proposed vs what you accepted (and why)
```

**PR template** (excerpt):

```md
### What did the agent propose vs. what shipped?
- Agent diffs attached? ☐
- Human changes & rationale:

### Evidence by default
- [ ] Contract & property tests added
- [ ] Eval report attached (artifact link)
- [ ] Policy checklist passed (PII, logging)
```

---

# 5) CI that “scores” the work (gentle, useful)

**.github/workflows/ci.yml** runs:

- `npm test` / `pytest` (unit + contract + property tests)
    
- `/labs/**/evals/` scripts (simple evals that produce a JSON or HTML report)
    
- uploads an **artifact** (`/artifacts/eval-report.html`)
    
- **comments** on the PR with a friendly rubric (pass/fail, “try this next”)
    

Example PR comment:

> ✅ Tests: 42/42 pass.  
> 🧪 Evals: 3/4 pass (edge case: non-GBP rounding failed).  
> 🔎 Tip: Ask Copilot to “generate property tests for non-GBP fee rounding using these invariants…”

---

# 6) The three interactive labs that map to your experiments

### Lab A1 — **AI-Augmented Product Discovery**

- Start with a minimal Next.js journey (two screens).
    
- Use **MS 365 Copilot** to draft the BRD; **Writer** for client-facing copy.
    
- Gate to done: prototype + BRD + “agent vs human” summary in PR.
    

### Lab A2 — **Agentic Engineering Cell**

- Start with failing tests & TODOs in `app/`.
    
- Use **Claude Code** for refactor plans & scaffolding; **Copilot** for tests & docs.
    
- Gate: micro-frontend behind a flag, full tests, evals pass.
    

### Lab A3 — **AI-Enhanced Advisor Service Desk**

- Starter workflow (form + template rendering).
    
- Use **Writer** to generate compliant advisor comms; **MS 365 Copilot** for Excel what-ifs.
    
- Gate: live-ready artifact, disclaimers inserted, evidence pack updated.
    

---

# 7) “Coach” automation: lightweight PR helper

Add a simple Action (`pr-comment.yml`) that posts coach tips keyed to test/eval results. It doesn’t need external APIs—just parses test output and prints tailored guidance (e.g., “consider property-based tests,” “split business rules from UI”).

---

# 8) Leaderboard & telemetry (privacy-safe)

- A tiny `/scripts/log_usage.sh` that contributors run to append anonymised metrics (time spent, prompts used) to `/metrics/usage.csv`.
    
- A `make dashboard` command renders a simple HTML leaderboard (commits, eval passes, time-to-first-PR).
    

---

# 9) “Green-Beret hints”

Create `/hints/` with short, surgical exemplars:

- “Safe rollout with feature flags”
    
- “Design a contract test first”
    
- “Property testing invariants: fees & rounding”  
    Each hint page ends with a **copyable Copilot & Claude prompt**.
    

---

# 10) Live “dojo” format (1 hour)

1. **5 min**: Open Codespaces → run quickstart.
    
2. **10 min**: Copilot “story slicing” & BRD draft (A1).
    
3. **25 min**: Claude Code refactor + tests (A2).
    
4. **10 min**: Run CI → review evals → PR comment coaching.
    
5. **10 min**: Retro: “what the agent did vs what we accepted”.
    

---

# 11) Role-specific on-ramps (who benefits and how to start)

- **PM / BA**: Start in A1. Use MS Copilot to draft BRDs; iterate with Writer for client-safe language. Aim: _cut BRD time by 40%_.
    
- **Engineers**: Start in A2. Use Claude Code for plans/scaffolds; Copilot for tests/docs. Aim: _+20% throughput without quality loss_.
    
- **Architects**: Review A2 designs; add `/ops/golden-pipeline.md`. Aim: _interactive docs + exemplar patterns_.
    
- **QA (Scenario Engineers)**: Own `/labs/**/evals/` and property tests. Aim: _evals as first-class citizens_.
    
- **Advisor Support / Marketing**: A3 flow. Writer for compliant comms, Copilot for Excel what-ifs. Aim: _+10% FCR, –15% AHT_.
    
- **Compliance / Risk**: Add checklists to PR template; verify `/ops/evidence-pack.md`. Aim: _evidence-by-default_.
    

---

# 12) What I can generate next (fast)

- A **starter repo** with all the above files scaffolded (README, issue/PR templates, Actions, lab stubs, eval harness, devcontainer).
    
- Optional: a **one-page facilitator guide** for running the 60-min dojo.
    
- Optional: a **progress badge** system (shields) that lights up when a team passes A1/A2/A3.
    

If you want, I’ll spin up the repo skeleton (with realistic sample code and tests) so you can start running sessions this week.