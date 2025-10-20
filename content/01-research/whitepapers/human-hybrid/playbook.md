
## Title: Hybrid Experimentation Playbook — Framework for Future Team, Client, and Process Experiments  
Author: Head of Architecture & CTO (EU)  
Audience: Experiment Leads, Product & Technology Teams, AI Enablement Council  
Version: v1.2 (adds Experiment Categories: Workflow & Stack · Role Evolution · Team Topology)  
Tags: [experimentation, ai, team-design, process, client-engagement, categories, workflow-stack, role-evolution, team-topology]

# 🧭 Purpose

This playbook provides a **reusable framework** for designing, running, and evaluating experiments that explore how **AI‑augmented teams, client engagement, and processes** evolve within the organisation. It now introduces **Experiment Categories** so we can distinguish the _type of change under test_ from the _areas of impact_, enabling clearer comparison and scaling decisions.

- **Experiment Categories (type):**
    
    - **Workflow & Stack** — process, pipelines, automation, tools
        
    - **Role Evolution** — new/changed responsibilities validated via multiple workflow trials
        
    - **Team Topology** — changes to pod size/shape & cross‑functional mix
        
- **Impact Dimensions (results):** **Team · Clients · Process** (reported as deltas vs. baseline)
    

Think of each experiment as a **matrix**: _Category (row)_ × _Impact Dimensions (columns)_.


# ⚙️ How to Use This Playbook

1. Duplicate this markdown into your team’s repo/workspace.
    
2. Choose an **Experiment Category** and fill the **Experiment Template** (Section 2).
    
3. Establish a **baseline** before launching any experiment.
    
4. Report results against the three **Impact Dimensions** (Team/Clients/Process).
    
5. Tag your experiment with **category** and context for cross‑comparison.
    
6. Submit proposals via the **Hybrid Operating Council (HOC)** or AI Enablement Team.
    

---

# 1️⃣ Framework Overview (Impact Dimensions)

|Pillar|Core Belief|Desired Outcome|
|---|---|---|
|**Team**|Leaner is better; roles broaden; new specialists emerge; teams own focused domains.|Identify optimal team size, role mix, and new skill archetypes.|
|**Clients**|Client zeal fuels discovery; early engagement with real software.|Shorten feedback loops; validate value through real client use.|
|**Process**|Crews are agent leaders; automate sustain work; minimise hand‑offs.|Increase autonomy, velocity, and quality via lean, test‑driven, AI‑powered delivery.|

---

# 🧱 1A. Experiment Categories (Type)

## ✅ Category definitions

- **Workflow & Stack** — Experiments that change _how work flows_ and _which tools/automation_ run in the pipeline (e.g., Copilot/Claude usage, Bedrock guardrails, CI/CD/evals, policy‑as‑code).
    
- **Role Evolution** — Experiments that **bundle ≥2 Workflow & Stack trials** to validate a **role change** (e.g., introducing _Scenario Engineer_ or _Agent Wrangler_ responsibilities).
    
- **Team Topology** — Experiments that adjust **pod shape** (size, cross‑functional mix, guild support) and governance, often incorporating Role Evolution **and** Workflow & Stack changes.
    

## ⛳ Gating logic

- To run **Role Evolution**, reference results from **≥2 Workflow & Stack** experiments.
    
- To run **Team Topology**, reference results from **≥1 Role Evolution** **and** **≥2 Workflow & Stack** experiments.
    

## 🏷️ Labels & tagging

- GitHub labels: `cat:workflow-stack` · `cat:role-evolution` · `cat:team-topology`
    
- Dashboard `category` column for slicing comparisons.
    

---

# 2️⃣ Experiment Template (Copy & Fill)

```markdown
## Experiment Title

### 1. Experiment Category (pick one)
- [ ] Workflow & Stack
- [ ] Role Evolution
- [ ] Team Topology

### 2. Baseline
Summarise pre‑experiment metrics (lead time, satisfaction, rework %, client feedback cycles). Attach `baselines.csv` rows.

### 3. Problem Statement
What organisational or delivery challenge are you addressing?

### 4. Hypothesis (cross‑pillar)
Link Team, Client, and Process assumptions.

### 5. AI Tools & Enablers
| Tool | Role | Purpose |
|------|------|---------|
| Amazon Bedrock | Architect / Agent Wrangler | Multi‑agent workflows, guardrails |
| Claude Code | Engineer / QA | Reasoning refactors, tests |
| GitHub Copilot | Engineer / QA | Code, docs, task automation |
| Microsoft Copilot | PM / Ops / Finance | BRDs, planning, analysis |
| Writer | Comms / Compliance | Policy‑safe content |

### 6. Participants & Roles
List participants and assign roles (Problem Framer, Builder‑Curator, Agent Wrangler, Scenario Engineer, Evidence Lead, etc.)

### 7. Metrics & Evidence (per Impact Dimension)
| Pillar | Quantitative Metrics | Qualitative Measures |
|--------|----------------------|---------------------|
| Team | Lead time, rework %, engagement score | Role clarity, collaboration |
| Clients | Time‑to‑first‑feedback, NPS, conversion | Perceived client understanding |
| Process | Automation %, dependency count | Team autonomy, process simplicity |

### 8. Evaluation vs Baseline
Present deltas (% improvement/regression) for each pillar with context.

### 9. Cross‑Experiment Tags
Category, toolset, team size, function, domain, region, experiment type.

### 10. Learning Objectives
What do we expect to learn about future roles, tooling, or governance?

### 11. Scale / Sunset Criteria
Quantitative gates for next phase (e.g., “20% cycle‑time improvement; 0 critical incidents”).
```

---

# 3️⃣ Baseline & Comparison Framework

## Baseline Principles

- Capture measurable **starting data** before changing roles, processes, or introducing new AI tooling.
    
- Use identical **KPI definitions** across experiments (see Metric Dictionary).
    
- Record context (team size, LOB, toolset, region, **category**) in a **Baseline Register** (`/hybrid-experiments/baselines.csv`).
    
- Collect data for at least **two sprints / four weeks** where feasible.
    

### Example Baseline Metrics

|Pillar|Measurement|Frequency|Data Source|
|---|---|---|---|
|Team|Lead time, rework %, throughput|Weekly|Jira, GitHub, DORA reports|
|Clients|NPS, feedback loop length, client engagement rate|Biweekly|Product analytics, surveys|
|Process|Automation %, dependency count, change‑fail rate|Weekly|CI/CD telemetry|

## Comparison Principles

1. **Normalise** outcomes as **Δ% vs baseline**.
    
2. **Tag** each experiment with **category** + context to enable slicing.
    
3. Use a shared **KPI dictionary** for consistency.
    
4. **Composite scoring** (suggested weights): Team 40% · Clients 30% · Process 30%.
    
5. Store comparative rows in `/hybrid-experiments/dashboard.csv`.
    

### Comparison Dashboard Schema

`experiment_id, owner, framework, category, metric, delta_pct, composite_score, tags, last_updated`

### Example Comparison View

|Experiment|Category|Team Δ Lead Time|Clients Δ NPS|Process Δ Automation|Composite|
|---|---|---|---|---|---|
|H1 – 4‑Person Hybrid Pod|Team Topology|−22%|+10|+18%|0.74|
|H7 – Scenario Engineer Trial|Role Evolution|−12% rework|+2|+15% eval pass|0.70|
|H3 – Feature‑Flagged CD|Workflow & Stack|−25%|+4|+25%|0.73|

---

# 4️⃣ Pillar Design Checklists

(Updated with baseline and category requirements)

## 🧩 Team

-  **Category selected** and labels applied.
    
-  Baseline metrics captured (lead time, rework %, engagement).
    
-  Small cross‑functional team (≤6) where possible.
    
-  Mix of generalists + specialists (Agent Wrangler, Scenario Engineer).
    
-  Post‑experiment deltas recorded and normalised.
    

## 🤝 Clients

-  Baseline client metrics (NPS, feedback loop).
    
-  Real client feedback < 4 weeks into experiment.
    
-  Client‑facing artefacts produced with policy‑safe tools (Writer/MS Copilot).
    
-  Comparative deltas captured.
    

## ⚙️ Process

-  Baseline cycle time & automation rate captured.
    
-  CI/CD includes eval harness + evidence logging.
    
-  Policy‑as‑code guardrails enforced (PII, logging).
    
-  Comparative improvement logged post‑experiment.
    

---

# 5️⃣ Governance & Evidence

|Deliverable|Description|
|---|---|
|**Baseline Register**|Shared repository of pre‑experiment metrics (with **category** column).|
|**Evidence Pack**|Includes baseline vs outcome deltas + qualitative insights.|
|**Comparison Dashboard**|Aggregates results across experiments; slice by **category**.|
|**Metric Dictionary**|Canonical KPI definitions maintained by AI Enablement Team.|
|**Category Gating Check**|Confirmation that Role Evolution/Team Topology reference prerequisite Workflow & Stack results.|

---

# 6️⃣ Repo Structure (with Categories)

```bash
/hybrid-experiments/
├── baselines.csv              # Includes `category` column
├── dashboard.csv              # Comparison dashboard (category-sliced)
├── /team-experiments/
│   ├── H1-4-Person-Pod/
│   └── playbook.md
├── /client-experiments/
│   ├── H2-Advisor-Workflow/
│   └── playbook.md
└── /process-experiments/
    ├── H3-Continuous-Delivery/
    └── playbook.md
```

---

# 7️⃣ Success Measures (2026–2027)

- ≥10 hybrid experiments with valid baselines.
    
- ≥80% use consistent KPI definitions enabling cross‑comparison.
    
- Documented **25%+ average improvement** across at least two pillars.
    
- **Category coverage:** ≥4 Workflow & Stack, ≥3 Role Evolution, ≥3 Team Topology.
    
- Quarterly **Hybrid Org Experimentation Dashboard** maintained and reviewed.
    

---

# 🧩 Narrative Anchor

> _“Each experiment has a **type** and a **result**.  
> We test **Workflow & Stack**, then prove **Role Evolution**, and finally shape **Team Topology** — always reporting impact on **Team, Clients, and Process**.  
> This ladder turns local wins into an org‑wide operating model, backed by baselines and comparable evidence.”_