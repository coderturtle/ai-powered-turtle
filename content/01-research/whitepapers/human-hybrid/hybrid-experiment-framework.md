

## Title: Hybrid Experimentation Playbook — Framework for Future Team, Client, and Process Experiments  
Author: Head of Architecture & CTO (EU)  
Audience: Experiment Leads, Product & Technology Teams, AI Enablement Council  
Version: v1.0  
Tags: [experimentation, ai, team-design, process, client-engagement, bedrock, copilot, claude-code, writer]

# 🧭 Purpose

This playbook provides a **reusable framework** for designing, running, and evaluating experiments that explore how **AI-augmented teams, client engagement, and processes** evolve within the organisation. It’s a guide for anyone proposing or leading a **hybrid human+agent experiment** — ensuring consistency, transparency, and measurable outcomes.

# ⚙️ How to Use This Playbook

1. Clone or duplicate this markdown into your team’s repo or workspace.
    
2. Fill out the **Experiment Template** (Section 2) to propose a new idea.
    
3. For each experiment, explicitly address all **three pillars** — **Team**, **Clients**, and **Process**.
    
4. Submit proposals via the **Hybrid Operating Council (HOC)** or AI Enablement Team.
    
5. Capture learnings and evidence in the provided structure.
    

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
### 1. Problem Statement
What organisational or delivery challenge are you addressing?

### 2. Hypothesis (cross-pillar)
Write one sentence linking Team, Client, and Process assumptions.  
Example: “A 4-person hybrid pod (Team) using Copilot and Bedrock for discovery (Process) will deliver earlier value to clients (Clients).”

### 3. AI Tools & Enablers
| Tool | Role | Purpose |
|------|------|----------|
| Amazon Bedrock | Architect / Agent Wrangler | Foundation for multi-agent workflows |
| Claude Code | Engineer / QA | Complex refactors, reasoning, tests |
| GitHub Copilot | Engineer / QA | Day-to-day coding and docs |
| Microsoft Copilot | PM / Ops / Finance | Planning, BRD, data analysis |
| Writer | Comms / Compliance | On-brand, policy-safe content |

### 4. Participants & Roles
List participants and assign roles (Problem Framer, Builder-Curator, Agent Wrangler, Scenario Engineer, Evidence Lead, etc.)

### 5. Metrics & Evidence (per pillar)
| Pillar | Quantitative Metrics | Qualitative Measures |
|---------|----------------------|--------------------|
| Team | Lead time, rework %, engagement score | Role clarity, collaboration feedback |
| Clients | Time-to-first-feedback, NPS, conversion | Perceived client understanding |
| Process | Automation %, dependency count | Team autonomy, process simplicity |

### 6. Data Collection Method
Telemetry, surveys, eval logs, agent usage reports, compliance checks.

### 7. Duration & Phasing
Example: 12 weeks — 2w setup, 8w execution, 2w evaluation.

### 8. Learning Objectives
What do we expect to learn about future roles, tooling, or governance?

### 9. Scale / Sunset Criteria
Quantitative gates for next phase (e.g., “20% cycle time improvement; 0 critical incidents”).
```

---

# 3️⃣ Pillar Design Checklists

## 🧩 Team

-  Team ≤ 6 people, end-to-end accountable.
    
-  Mix of generalists + emerging specialists (Agent Wrangler, Scenario Engineer).
    
-  Tool telemetry enabled (Copilot, Claude Code).
    
-  DORA metrics baseline captured.
    
-  Engagement survey planned (before & after).
    

## 🤝 Clients

-  Real client feedback loop within first 4 weeks.
    
-  Success criteria defined using measurable outcomes (NPS, conversion, STP%).
    
-  Client comms authored via Writer or MS Copilot for policy safety.
    
-  Prototype/demo deployed to live or pilot audience.
    
-  Business partner identified and active in retrospectives.
    

## ⚙️ Process

-  CI/CD includes eval harness and evidence logging.
    
-  Policy-as-code guardrails enforced (e.g., PII checks via Bedrock Gateway).
    
-  Hand-offs reduced through shared repo and automation.
    
-  AgentOps observability and logging active.
    
-  Post-incident and post-release evals included.
    

---

# 4️⃣ Tool Guidance by Role

|Role|Recommended Tools|Example Activity|
|---|---|---|
|**Architect / Agent Wrangler**|Bedrock, Claude Code|Design and orchestrate agent flows; review AI-assisted code.|
|**Engineer / Builder-Curator**|Copilot, Claude Code|Generate/refactor code; write tests; document via Copilot Chat.|
|**QA / Scenario Engineer**|Bedrock EvalOps, Claude Code|Build eval suites and property tests; analyse safety results.|
|**Product Manager / Problem Framer**|MS Copilot, Writer|Draft BRDs, plan experiments, summarise insights.|
|**Advisor Support / Client Partner**|Writer, MS Copilot|Generate client comms and proposals; measure FCR and satisfaction.|
|**Evidence Lead / Compliance**|Bedrock Guardrails, Writer|Monitor logs, generate evidence packs, validate outputs.|

---

# 5️⃣ Metrics Dashboard Definitions

|Pillar|Quantitative|Qualitative|
|---|---|---|
|Team|Lead time, rework %, story throughput, team size ratio|Autonomy, engagement, learning index|
|Clients|Time-to-feedback, conversion/NPS delta|Insight reuse, trust, perceived relevance|
|Process|Automation %, eval pass rate, dependency reduction|Confidence in independence, governance satisfaction|

---

# 6️⃣ Governance & Lifecycle

1. **Proposal:** 2-page summary using this template → submit to HOC.
    
2. **Review:** Evaluate alignment, feasibility, compliance readiness.
    
3. **Execution:** Run for 6–12 weeks; auto-collect metrics.
    
4. **Evaluation:** Present evidence pack and retrospectives.
    
5. **Scale / Sunset:** Decide whether to scale, iterate, or retire.
    
6. **Library:** Store in central Experiment Library (markdown + data artifacts).
    

---

# 7️⃣ Experiment Library Entry Template

```markdown
## Experiment Summary
- Title:
- Owner(s):
- Dates:
- Tools Used:
- Pillars Covered:
- Key Findings:
- Metrics Achieved:
- Lessons Learned:
- Next Actions:
- Artefacts: (link to repos, eval reports, dashboards)
```

---

# 8️⃣ Interactive Experiment Repo Template

Recommended repo structure for running and documenting experiments:

```bash
/experiment-name/
├── README.md            # Overview + quickstart
├── /prompts/            # Copilot & Claude prompt cards
├── /data/               # Eval outputs, telemetry CSVs
├── /docs/               # BRDs, findings, retrospectives
├── /ci/                 # GitHub Actions for evals + evidence packs
└── experiment-template.md  # Pre-filled proposal form
```

**GitHub Features:**

- Issue templates for experiment proposals & retros.
    
- PR templates prompting “What did the agent do vs you?”
    
- CI workflow producing automatic evidence reports.
    

---

# 9️⃣ Experiment Library Dashboard (Optional)

Use a simple dashboard (Streamlit, Power BI, or Quarto) to visualise:

- Active experiments by pillar.
    
- Performance vs baseline.
    
- Role adoption and new skills emerging.
    
- Client engagement frequency.
    

---

# 🔟 Success Measures (2026–2027)

- ≥10 experiments executed under this framework.
    
- ≥3 validated new role archetypes (e.g., Agent Wrangler, Scenario Engineer, Evidence Lead).
    
- ≥25% reduction in cycle time within experimental pods.
    
- Documented playbook update with evidence-driven role evolution.
    
- Shared learning library accessible across regions.
    

---

# 🧩 Narrative Anchor

> _“Each experiment is a modern voyage: small, data-rich, and accountable.  
> We sail with leaner crews, digital copilots, and clear evidence of where human creativity and agent precision best combine.  
> The goal isn’t fewer people — it’s smarter, more autonomous teams delivering real value to clients faster and safer than ever before.”_