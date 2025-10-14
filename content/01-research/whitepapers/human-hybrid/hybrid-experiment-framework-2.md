
## Title: Hybrid Experimentation Playbook — Framework for Future Team, Client, and Process Experiments  
Author: Head of Architecture & CTO (EU)  
Audience: Experiment Leads, Product & Technology Teams, AI Enablement Council  
Version: v1.1 (with Baseline & Comparison Enhancements)  
Tags: [experimentation, ai, team-design, process, client-engagement, bedrock, copilot, claude-code, writer]

# 🧭 Purpose

This playbook provides a **reusable framework** for designing, running, and evaluating experiments that explore how **AI-augmented teams, client engagement, and processes** evolve within the organisation. It now includes guidance on **establishing baselines prior to experiments** and **comparing results across teams**, ensuring consistency and confidence in outcomes.


# ⚙️ How to Use This Playbook

1. Clone or duplicate this markdown into your team’s repo or workspace.
    
2. Fill out the **Experiment Template** (Section 2) to propose a new idea.
    
3. Establish a **baseline** before launching any experiment.
    
4. For each experiment, explicitly address all **three pillars** — **Team**, **Clients**, and **Process**.
    
5. Use consistent metrics and tagging for **cross-experiment comparison**.
    
6. Submit proposals via the **Hybrid Operating Council (HOC)** or AI Enablement Team.
    
7. Capture learnings and evidence in the provided structure.
    

---

# 1️⃣ Framework Overview

Every experiment touches three connected dimensions:

|Pillar|Core Belief|Desired Outcome|
|---|---|---|
|**Team**|Leaner is better; roles become broader; new specialists emerge; teams own focused domains.|Identify optimal team size, role mix, and required new skill archetypes.|
|**Clients**|Client zeal fuels discovery; early engagement and real software trump opinion.|Shorten feedback loops; validate business value through real client use.|
|**Process**|Crews are agent leaders; automate sustain work; minimise hand-offs.|Increase autonomy, velocity, and quality through lean, test-driven, AI-powered delivery.|

---

# 2️⃣ Experiment Template (Copy & Fill)

```markdown
## Experiment Title
### 1. Baseline
Summarise pre-experiment metrics (lead time, satisfaction, rework %, client feedback cycles). Attach baseline.csv extract.

### 2. Problem Statement
What organisational or delivery challenge are you addressing?

### 3. Hypothesis (cross-pillar)
Link Team, Client, and Process assumptions.  
Example: “A 4-person hybrid pod (Team) using Copilot and Bedrock for discovery (Process) will deliver earlier value to clients (Clients).”

### 4. AI Tools & Enablers
| Tool | Role | Purpose |
|------|------|----------|
| Amazon Bedrock | Architect / Agent Wrangler | Foundation for multi-agent workflows |
| Claude Code | Engineer / QA | Complex refactors, reasoning, tests |
| GitHub Copilot | Engineer / QA | Code, doc, and task automation |
| Microsoft Copilot | PM / Ops / Finance | Planning, BRD, analysis |
| Writer | Comms / Compliance | Policy-safe content |

### 5. Participants & Roles
List participants and assign roles (Problem Framer, Builder-Curator, Agent Wrangler, Scenario Engineer, Evidence Lead, etc.)

### 6. Metrics & Evidence (per pillar)
| Pillar | Quantitative Metrics | Qualitative Measures |
|---------|----------------------|--------------------|
| Team | Lead time, rework %, engagement score | Role clarity, collaboration feedback |
| Clients | Time-to-first-feedback, NPS, conversion | Perceived client understanding |
| Process | Automation %, dependency count | Team autonomy, process simplicity |

### 7. Baseline vs Post-Experiment Evaluation
Compare metrics to baseline; present delta (% improvement or regression). Contextualise using consistent metric definitions.

### 8. Cross-Experiment Tags
Toolset, team size, function, domain, experiment type.

### 9. Learning Objectives
What do we expect to learn about future roles, tooling, or governance?

### 10. Scale / Sunset Criteria
Quantitative gates for next phase (e.g., “20% cycle time improvement; 0 critical incidents”).
```

---

# 3️⃣ Baseline & Comparison Framework

## Baseline Principles

- Capture measurable **starting data** before changing roles, processes, or introducing new AI tooling.
    
- Use identical **KPI definitions** across experiments (e.g., DORA metrics, NPS methodology, engagement scoring).
    
- Record contextual factors (team size, LOB, toolset, region) in a **Baseline Register** (`/hybrid-experiments/baselines.csv`).
    
- Ensure data is collected for a minimum of **two sprints or four weeks** to establish stability.
    

### Example Baseline Metrics

|Pillar|Measurement|Frequency|Data Source|
|---|---|---|---|
|Team|Lead time, rework %, throughput|Weekly|Jira, GitHub, DORA reports|
|Clients|NPS, feedback loop length, client engagement rate|Biweekly|Product analytics, surveys|
|Process|Automation %, dependency count, change-fail rate|Weekly|CI/CD telemetry|

## Comparison Principles

1. **Normalise Metrics** — Express outcomes as percentage deltas vs. baseline.
    
2. **Tag Context** — Each experiment includes metadata: function, team size, domain, AI toolset.
    
3. **Shared KPI Dictionary** — AI Enablement Team maintains metric definitions.
    
4. **Composite Scoring** — Weighted summary (e.g., Team 40%, Clients 30%, Process 30%) for aggregate view.
    
5. **Central Dashboard** — Store comparative results in `/hybrid-experiments/dashboard.csv` for quarterly reporting.
    

### Comparison Dashboard Example

|Experiment|Team Size|Δ Lead Time|Δ NPS|Δ Automation|Composite Score|
|---|---|---|---|---|---|
|H1 – 4-Person Hybrid Pod|4|-22%|+10|+18%|0.74|
|H2 – Advisor Copilot Workflow|5|-15%|+12|+10%|0.70|
|H3 – Continuous Delivery Pod|6|-25%|+8|+25%|0.76|

---

# 4️⃣ Pillar Design Checklists

(Updated with baseline requirements)

## 🧩 Team

-  Baseline metrics captured (lead time, rework %, engagement).
    
-  Small cross-functional team (≤6).
    
-  Mix of generalists + specialists (Agent Wrangler, Scenario Engineer).
    
-  Post-experiment delta recorded and normalised.
    

## 🤝 Clients

-  Baseline client engagement metrics (feedback loop, NPS).
    
-  Real client feedback loop in experiment (<4 weeks).
    
-  Comparison delta captured post-experiment.
    

## ⚙️ Process

-  Baseline cycle time & automation rate captured.
    
-  Policy-as-code guardrails enforced.
    
-  Comparative improvement logged post-experiment.
    

---

# 5️⃣ Governance & Evidence

|Deliverable|Description|
|---|---|
|**Baseline Register**|Shared repository of pre-experiment metrics.|
|**Evidence Pack**|Includes baseline vs. outcome deltas + qualitative insights.|
|**Comparison Dashboard**|Aggregates results across experiments for executive view.|
|**Metric Dictionary**|Maintained by AI Enablement Team to ensure consistent definitions.|

---

# 6️⃣ Repo Structure (Updated for Baselines & Comparisons)

```bash
/hybrid-experiments/
├── baselines.csv              # All experiment baselines
├── dashboard.csv              # Comparison dashboard
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

- ≥10 hybrid experiments executed with valid baselines.
    
- ≥80% use consistent KPI definitions enabling cross-comparison.
    
- Documented 25%+ average improvement across at least two pillars.
    
- Quarterly **Hybrid Org Experimentation Dashboard** maintained.
    
- Insights incorporated into role and process design playbooks.
    

---

# 🧩 Narrative Anchor

> _“Progress starts with proof. By baselining where we stand and comparing across teams, we turn bold ideas into measurable impact. Every experiment becomes a datapoint in a shared journey toward leaner teams, faster feedback, and smarter delivery.”_