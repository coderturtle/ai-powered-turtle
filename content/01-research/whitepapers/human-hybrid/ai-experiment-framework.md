## Title: AI Tool Experimentation Playbook — Learning Framework for Existing AI Tools  
Author: Head of Architecture & CTO (EU)  
Audience: AI Enablement Team, Product & Engineering Leads, Experiment Owners  
Version: v1.1 (with Baseline & Comparison Guidance)  
Tags: [ai-tools, experimentation, learning-framework, bedrock, copilot, claude-code, writer, microsoft-copilot]

# 🧠 Purpose

This playbook provides a **structured framework** for capturing learnings from experiments focused on our **existing AI tools**. It now includes a method for establishing **baselines before experiments** and **comparing results across experiments** to ensure consistency and confidence in insights.


# ⚙️ How to Use

1. Clone or copy this playbook into your team or tool-specific repo.
    
2. Use the **Experiment Template (Section 3)** to propose and document AI tool experiments.
    
3. Establish a **clear baseline** before running any experiment.
    
4. Capture data using common metrics and dashboards to enable cross-experiment comparison.
    
5. Submit results to the **AI Enablement Team** and archive in `/ai-tool-experiments/`.
    

---

# 1️⃣ Objectives

|Goal|Description|
|---|---|
|**Measure Value**|Quantify productivity, quality, and compliance impact of each AI tool against a baseline.|
|**Ensure Comparability**|Use shared metrics and normalised baselines so disparate experiments can be confidently compared.|
|**Understand Adoption**|Identify which roles and workflows gain the most traction.|
|**Evolve Practices**|Derive repeatable, role-based best practices and exemplars.|
|**Strengthen Governance**|Produce evidence for safe, compliant AI use across all functions.|

---

# 2️⃣ Framework Overview

Each experiment follows six standard phases:

|Phase|Key Question|Deliverable|
|---|---|---|
|**Baseline**|What’s the current state of performance or behaviour before AI intervention?|Metrics snapshot & benchmark definitions|
|**Discovery**|What workflow or problem are we exploring?|Use-case statement|
|**Pilot Setup**|How will we instrument and govern the tool?|Config + data logging plan|
|**Execution**|Who’s using it, how often, and with what support?|Usage data + artefacts|
|**Evaluation**|Did it deliver measurable benefit vs. baseline?|Metrics summary + insights|
|**Compare & Scale**|How does this compare to other experiments?|Normalised data + recommendations|

---

# 3️⃣ Establishing Baselines

**Purpose:** To ensure all experiments begin with measurable starting points so improvements can be attributed to the AI tool, not external factors.

### Baseline Principles

- Capture _before_ introducing AI tools — same workflow, same participants, same metrics.
    
- Use **quantitative data** (e.g., time, quality, throughput) and **qualitative input** (confidence, friction, satisfaction).
    
- Document contextual factors (team size, workload, product domain) for fair comparison.
    
- Maintain a **Baseline Register** in `/ai-tool-experiments/baselines.csv` for transparency.
    

### Example Baseline Metrics

|Category|Measurement|Frequency|Tool/Source|
|---|---|---|---|
|Productivity|Avg. task completion time (min/task)|Weekly|JIRA / GitHub / Copilot telemetry|
|Quality|Defect density / review comments per PR|Weekly|GitHub / QA tools|
|Adoption|Active user count|Weekly|Tool analytics|
|Compliance|Violations / audit exceptions|Monthly|Risk logs|
|Satisfaction|User confidence score (1–5)|Monthly|Survey|

---

# 4️⃣ Cross-Experiment Comparison Framework

**Goal:** Ensure data and outcomes from different teams, tools, and domains can be compared confidently.

### Comparison Principles

1. **Normalise Metrics** — Convert raw metrics into percentage deltas vs. baseline (e.g., “Cycle time ↓ 22%”).
    
2. **Contextual Tags** — Each experiment includes tags for function, tool, region, team size, and experiment type to enable filtering.
    
3. **Consistent KPIs** — Use a standard metric dictionary maintained by the AI Enablement Team.
    
4. **Weighted Scoring** — Assign weightings to performance (40%), quality (30%), adoption (20%), and compliance (10%) for unified comparison.
    
5. **Central Dashboard** — Aggregate all results in `/ai-tool-experiments/dashboard.csv` for visualisation.
    

### Comparison Dashboard Example

|Experiment|Tool|Function|Δ Productivity|Δ Quality|Δ Adoption|Δ Compliance|Composite Score|
|---|---|---|---|---|---|---|---|
|E1 – Copilot ADR Drafting|GitHub Copilot|Engineering|+25%|+10%|+70%|0|0.67|
|E2 – Claude Code Tests|Claude Code|QA|+40%|+15%|+50%|0|0.73|
|E4 – Writer Factsheets|Writer|Compliance|+20%|+25%|+40%|0|0.71|

---

# 5️⃣ Experiment Template (Copy & Fill)

```markdown
## AI Tool Experiment Title

### 1. Baseline
Summarise metrics before introducing the tool (attach baseline.csv extract).

### 2. Tool & Version
Which AI tool / model / plugin are you testing?

### 3. Business or Technical Problem
What workflow or pain point are you addressing?

### 4. Hypothesis
Expected outcome vs baseline.

### 5. Participants & Roles
| Role | Department | Expected Use |
|------|-------------|---------------|
| Engineer | Architecture | Refactor, generate unit tests |
| Product Manager | Platform | Draft BRDs and epics |
| Advisor Support | Ops | Generate client emails |

### 6. Metrics & Data Capture
Describe data collection (telemetry, surveys, code analytics) and frequency.

### 7. Evaluation vs Baseline
Compare new results to baseline values; provide percentage change and qualitative narrative.

### 8. Cross-Experiment Tags
Tool, team size, function, region, type (coding, writing, orchestration, analysis).

### 9. Learnings & Insights
Key takeaways, blockers, role evolution observed.

### 10. Next Steps
Scale / iterate / sunset? Update central playbook entry.
```

---

# 6️⃣ Data Collection Checklist

-  Baseline captured before tool introduction.
    
-  Metrics tracked weekly during experiment.
    
-  Consistent KPI definitions used.
    
-  Survey and telemetry data stored in `/data/`.
    
-  Comparative results published to dashboard.
    

---

# 7️⃣ Governance & Evidence Requirements

|Deliverable|Description|
|---|---|
|**Baseline Register**|Records all initial measurements for traceability.|
|**Evidence Pack**|Metrics summary, artefacts, compliance review, lessons learned.|
|**Comparison Dashboard**|Aggregates results across experiments for executive insights.|
|**Policy Review**|Confirms AI use compliance and data handling standards.|

---

# 8️⃣ Recommended Repo Structure

```bash
/ai-tool-experiments/
├── baselines.csv                # Central baseline register
├── dashboard.csv                # Comparison dashboard
├── /copilot/
│   ├── E1-ADR-Drafting/
│   ├── E2-Code-Reviews/
│   └── playbook.md
├── /claude-code/
│   ├── E1-Test-Authoring/
│   └── playbook.md
├── /bedrock/
│   ├── E1-Agent-Gateway/
│   └── playbook.md
└── /writer/
    ├── E1-Factsheet-Automation/
    └── playbook.md
```

---

# 🧩 Success Measures (2026–2027)

- ≥15 AI tool experiments executed with valid baselines.
    
- ≥80% experiments report comparable metrics via shared dashboard.
    
- Verified 20%+ improvement in at least 3 workflows.
    
- Standardised baseline and comparison process adopted across all experiments.
    

---

# 🗺️ Narrative Anchor

> _“Evidence starts before change. We baseline to see progress, not to prove perfection. By comparing results across teams and tools, we learn what truly scales — transforming anecdote into analytics, and analytics into better ways of working.”_