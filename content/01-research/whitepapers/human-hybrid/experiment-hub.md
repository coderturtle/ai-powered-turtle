## Title: Experiment Hub — Unified Index for Hybrid & AI Tool Experiments  
Author: Head of Architecture & CTO (EU)  
Audience: Experiment Leads, AI Enablement Team, Product & Engineering Heads  
Version: v1.0  
Tags: [experimentation, ai-tools, hybrid-teams, governance, metrics, comparison, baseline]

# 🧭 Purpose

The **Experiment Hub** serves as the single point of coordination and visibility for all experimentation activity across the organisation. It connects both the **Hybrid Experimentation Framework** (focused on Team, Clients, and Process) and the **AI Tool Experimentation Framework** (focused on tool adoption, value, and learning) under one unified structure.

It provides:

- A single, **governed process** for proposing and tracking experiments.
    
- Consistent **baseline and comparison standards** across all experiments.
    
- Clear visibility into **what’s being tested, who’s involved, and what’s working.**
    
- Aggregated metrics and insights for leadership to make data-driven decisions.
    

---

# 🧩 Frameworks Overview

|Framework|Focus|Key Question|Output|
|---|---|---|---|
|**Hybrid Experimentation**|Team, Clients, Process|How do hybrid human+agent teams deliver faster, safer, smarter?|New role archetypes, process playbooks, validated delivery models|
|**AI Tool Experimentation**|Bedrock, Copilot, Claude Code, MS Copilot, Writer|Which tools create measurable value, and for whom?|Tool usage patterns, performance data, adoption insights|

---

# 🧱 Repository Structure

```bash
/experiments-hub/
├── /hybrid-experiments/              # Team, Client, and Process experiments
│   ├── baselines.csv
│   ├── dashboard.csv
│   ├── playbook.md                   # Hybrid Experimentation Playbook
│   └── /<experiment-folders>/
├── /ai-tool-experiments/             # Tool-focused experiments
│   ├── baselines.csv
│   ├── dashboard.csv
│   ├── playbook.md                   # AI Tool Experimentation Playbook
│   └── /<tool-folders>/
├── /shared-assets/
│   ├── metric-dictionary.md          # Standardised KPI definitions
│   ├── governance-policy.md          # Experiment guardrails & compliance
│   ├── templates/                    # Markdown templates for proposals, retros, surveys
│   ├── dashboards/                   # Power BI / Streamlit dashboards
│   └── logo.svg                      # Visual branding asset for Experiment Hub
└── README.md                         # Entry point linking all playbooks and dashboards
```

---

# 📈 Shared Standards

### 1. Baseline Capture

- All experiments (hybrid or tool) must define **pre-intervention baselines**.
    
- Baseline format: CSV with consistent headers → `experiment_id, pillar/tool, metric, baseline_value, date_collected, data_source`.
    
- Data stored centrally in `/baselines.csv` for both frameworks.
    

### 2. KPI Dictionary (maintained in `/shared-assets/metric-dictionary.md`)

Defines common metrics and formulas:

- **Lead Time** – Avg. time from idea → deployment.
    
- **Cycle Efficiency** – Active time ÷ total time.
    
- **Automation Coverage** – % of tasks auto-completed by agents.
    
- **Client Feedback Loop** – Days from release → first client feedback.
    
- **AI Suggestion Acceptance** – Accepted ÷ total suggestions.
    

### 3. Comparison Methodology

- Express results as **Δ% vs baseline**.
    
- Use shared **Composite Score Formula**: `(Team × 0.4) + (Clients × 0.3) + (Process × 0.3)` for hybrid experiments; `(Productivity × 0.4) + (Quality × 0.3) + (Adoption × 0.2) + (Compliance × 0.1)` for AI tool experiments.
    
- Store in `/dashboard.csv` for aggregation and visualisation.
    

---

# 🚀 Governance & Lifecycle

|Stage|Description|Owner|
|---|---|---|
|**Proposal**|Submit via GitHub issue using shared template.|Experiment Lead|
|**Review**|AI Enablement Team validates scope, safety, and metric alignment.|AI Enablement Team|
|**Execution**|Team runs experiment following baseline & data collection rules.|Experiment Owner|
|**Evaluation**|Compare outcomes to baseline, document evidence pack.|Evidence Lead|
|**Publication**|Add results to dashboards and Experiment Library.|AI Enablement PM|
|**Promotion / Scale**|Convert successful patterns into official playbooks.|HOC / Architecture Council|

---

# 🧮 Dashboards

Visual dashboards combine data from both frameworks:

- **Hybrid Dashboard:** Delivery velocity, team size vs performance, client NPS improvement.
    
- **AI Tool Dashboard:** Productivity lift, code quality delta, adoption curves, trust scores.
    
- **Aggregate Dashboard:** Composite metrics, experiment health, cross-team trends.
    

Example fields:

|Experiment|Framework|Δ Metric|Score|Owner|Status|
|---|---|---|---|---|---|
|H1 – Hybrid Pod|Hybrid|+22% lead time|0.74|EU Platform|🟢 Active|
|T4 – Copilot BRDs|AI Tool|+18% productivity|0.67|PMO|🔵 Completed|

---

# 🧭 Roles & Responsibilities

|Role|Description|
|---|---|
|**Experiment Lead**|Owns setup, data collection, and retrospective.|
|**Evidence Lead**|Validates baseline and ensures consistent metric definitions.|
|**Agent Wrangler / Scenario Engineer**|Manages AI agent usage and logs.|
|**AI Enablement PM**|Oversees dashboards, publishes quarterly summary.|
|**Architecture Council**|Reviews learnings, updates frameworks, and scales patterns.|

---

# 🧩 Shared Experiment Library Template

```markdown
## Experiment Summary
- Title:
- Framework: (Hybrid / AI Tool)
- Owner(s):
- Start / End Dates:
- Tools Used:
- Pillars / Categories:
- Baseline Summary:
- Results Summary (Δ% vs baseline):
- Composite Score:
- Key Learnings:
- Next Steps:
- Artefacts: (Links to repo, dashboards, reports)
```

---

# 🧭 Success Metrics for 2026–2027

- ≥25 total experiments executed across both frameworks.
    
- ≥80% with validated baselines and comparable metrics.
    
- Quarterly Experiment Hub report to ExCo summarising learnings.
    
- 5+ patterns promoted to enterprise playbooks.
    
- Consistent participation from all regions (EU, US, APAC).
    

---

# 🌍 Narrative Anchor

> _“Our Experiment Hub is the nervous system of transformation — connecting data, people, and ideas.  
> Every experiment tells a story; together, they reveal the architecture of our future.  
> With shared baselines, common measures, and transparent learnings, we move from intuition to evidence, from isolated pilots to an adaptive, AI-powered organisation.”_