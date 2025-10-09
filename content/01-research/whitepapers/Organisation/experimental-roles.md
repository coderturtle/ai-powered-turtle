
# 🧪 Experimental Framework for the Hybrid Human + Agent Organisation (2026)

> **Goal:** Gather hard data — not anecdotes — on how AI-augmented tooling and new team structures impact delivery speed, quality, and employee experience.  
> Experiments run in production contexts, not sandboxes. Each has a **business outcome**, a **data outcome**, and a **learning outcome**.

---

## Part 1. Building Familiarity — “Tool Fluency Programme”

### Purpose

Before we experiment with new team structures, everyone needs **hands-on fluency** with the AI tools that will power those teams.  
Think of this like learning to drive before joining Formula 1 — no experiments succeed if people can’t use the instruments confidently.

---

### 🧠 Recommended Core Toolset & How to Introduce Each

|Tool|Description & AI Focus|Target Roles|How to Start & Get Value|Desired Maturity|
|---|---|---|---|---|
|**Amazon Bedrock**|Enterprise foundation model platform; enables secure agent workflows, grounding, guardrails, and orchestration.|Architects, Platform Eng, AI Champions, Data & ML Engineers.|Start with **internal LLM Gateway pilot** – connect to a safe knowledge base and build a simple “AI helper” that retrieves design or compliance artefacts.|Teams can deploy Bedrock-based agents with identity pass-through, cost controls, and logging.|
|**Claude Code (Anthropic)**|Conversational coding assistant for reasoning-heavy development.|Engineers, Tech Leads, QA, Data Scientists.|Use in **pair-programming sessions**: let Claude Code write tests or refactor code while engineers verify logic.|Incorporate into CI/CD; measure reduction in boilerplate + rework.|
|**GitHub Copilot (Chat & Agents)**|Context-aware code & documentation assistant integrated with IDE and GitHub issues/PRs.|Engineers, Tech Leads, QA.|Enable Copilot for code, commits, and PRs; track “suggestion accept rate” and “review comments per PR”.|Become default assistant for 80% of repos; engineers train custom prompts per repo.|
|**Microsoft 365 Copilot**|Productivity copilot across Word, Excel, Teams, Outlook.|Product Managers, BAs, PMOs, Operations, HR, Legal, Finance.|Start with **meeting summarisation, BRD generation, and Excel what-if models.**|Every PM uses Copilot to draft BRDs/epics; Ops uses Excel Copilot for dashboards and reconciliations.|
|**Writer (Enterprise Gen-AI)**|Controlled-language generator for compliant content creation (marketing, advisor comms, policy docs).|Marketing, Communications, Advisor Support, Compliance.|Begin with **fund factsheets or advisor email templates**; track review time and compliance findings.|Integrated into review workflow with policy guardrails (tone, disclaimers, risk tags).|

---

### “Tool Fluency” Training Format

1. **Foundations (2 weeks):** Short video lessons, 1 lab per tool, completion badges.
    
2. **Applied Playgrounds (4 weeks):** Guided challenges (e.g., “Write a policy doc in Writer”, “Refactor with Copilot”).
    
3. **Role Clinics (monthly):** Peer showcases — “How I use Bedrock to automate design discovery”.
    
4. **Usage Dashboard:** telemetry of adoption, satisfaction, productivity indicators.
    

---

## Part 2. Experiments with AI Functionality (What We Build)

These experiments **use the tools** to ship real value.  
Each includes KPIs for business impact _and_ data for role/skill evolution.

---

### 🧪 **Experiment A — “AI-Augmented Product Discovery”**

**Objective:** Test how product and design roles evolve when generative AI drives early-stage discovery and documentation.  
**Scope:** New feature for personal-investing onboarding journey.  
**Stack:** Microsoft Copilot + Writer + Bedrock (for prototypes).  
**Participants:**

- Product Manager (Problem Framer)
    
- Designer
    
- AI Champion (Agent Wrangler)
    
- Engineer (Builder-Curator)
    
- Compliance Partner  
    **Hypotheses:**
    

1. BRD/epic creation time ↓ 40%.
    
2. Requirement churn ↓ 25%.
    
3. PM satisfaction ↑ significantly (survey).  
    **Data captured:** time-to-first-demo, story rework rate, Copilot/Writer usage telemetry.  
    **Output:** a fully deployed, AI-assisted onboarding flow that meets Consumer Duty and GDPR standards.  
    **Learning goal:** define new division of labour between PMs, Designers, and Agents; assess skills for future _Product AI Partner_ role.
    

---

### 🧪 **Experiment B — “Agentic Engineering Cell”**

**Objective:** Observe how engineers, QA, and architects perform when AI agents handle scaffolding, testing, and code documentation.  
**Scope:** Refactor an existing fund-selection module to micro-frontends.  
**Stack:** Claude Code + GitHub Copilot + Bedrock EvalOps.  
**Participants:**

- Tech Lead (Agent Wrangler)
    
- 3 Engineers (Builder-Curators)
    
- QA (Scenario Engineer)
    
- Architect (Systems & Safety)  
    **Hypotheses:**
    

1. Story throughput ↑ 20%.
    
2. Escaped defects ≤ baseline.
    
3. Engineers spend ≥ 50% time on higher-value logic.  
    **Data captured:** cycle time, PR metrics, eval pass rate, manual-test coverage, sentiment survey.  
    **Output:** Production micro-frontend deployed via golden pipeline.  
    **Learning goal:** quantify productivity & quality impact; refine role definitions and identify need for permanent _EvalOps Engineer_ and _Prompt Curator_ roles.
    

---

### 🧪 **Experiment C — “AI-Enhanced Advisor Service Desk”**

**Objective:** Test hybrid human–agent model in customer-facing operations.  
**Scope:** Advisor support workflow for suitability queries and fund comparisons.  
**Stack:** Writer + Microsoft Copilot + Bedrock Gateway Guardrails.  
**Participants:**

- Advisor Support Lead (Problem Framer)
    
- Advisors & Ops Analysts (Service Operators)
    
- AI Champion (Agent Trainer)
    
- Compliance Oversight (Reviewer)  
    **Hypotheses:**
    

1. First-contact resolution ↑ 10%.
    
2. Handle time ↓ 15%.
    
3. Compliance exceptions ≤ baseline.  
    **Data captured:** FCR, AHT, customer NPS, Copilot/Writer usage, agent-incident logs.  
    **Output:** Live deployment of hybrid chat workflow; approved for full advisor pilot.  
    **Learning goal:** measure role shifts (advisor → coach), define skills for _AI Advisor Coach_ and _Agent Monitor_ roles.
    

---

## Part 3. Experiments on Team & Role Structure (How We Work)

These experiments build on tool familiarity and functional pilots to answer:

> “What is the **optimal shape of future teams** when humans + agents co-deliver?”

---

### 🧩 **Experiment 1 — “Hybrid Pod Structure Trial”**

- **Purpose:** Compare traditional 7-person pod vs. 4-person + agents pod.
    
- **Focus:** Delivery velocity, quality, satisfaction, communication overhead.
    
- **Data:** DORA metrics, story rework %, survey on role clarity & engagement.
    
- **Outcome:** Define recommended pod composition & standard “agent stack”.
    

### 🧩 **Experiment 2 — “Cross-Functional Guild Integration”**

- **Purpose:** Measure value of central _Green-Beret Guild_ supplying exemplars and red-team support to product pods.
    
- **Data:** Rework reduction, defect density, incident response.
    
- **Outcome:** Determine optimal guild-to-pod ratio; prove ROI of central expertise.
    

### 🧩 **Experiment 3 — “AgentOps Service Model”**

- **Purpose:** Test platform team’s ability to run _AgentOps as a Service_ (governance, evals, model updates).
    
- **Scope:** Service 5 active agents across two LOBs; manage incidents & model drift.
    
- **Data:** MTTR for agent incidents, cost per inference, policy-violation rate.
    
- **Outcome:** Define need for _Agent SRE_ and _EvalOps Engineer_ permanent roles.
    

---

## Part 4. Measurement & Governance

|Dimension|Metric|Target / Evidence|
|---|---|---|
|**Delivery**|Lead-time for change|↓ ≥ 20% vs control|
|**Quality**|Change-fail rate|≤ baseline|
|**Adoption**|Tool usage (per role)|≥ 60% by Q4-2026|
|**Engagement**|Employee satisfaction|↑ 10 pp by survey|
|**Compliance**|Policy-violation rate|Zero critical|
|**Learning**|Documented role evolution insights|≥ 3 new roles defined & validated|

---

## Part 5. Expected New / Evolved Roles to Evaluate

|Emerging Role|Origin|Purpose|
|---|---|---|
|**Agent Wrangler**|Tech Lead / Architect|Designs & orchestrates agent workflows.|
|**Scenario Engineer**|QA|Creates eval suites & property tests.|
|**Prompt Curator**|Senior Engineer / BA|Maintains prompts, benchmarks, examples.|
|**Evidence Lead**|Compliance / Risk|Oversees policy-as-code, model cards, eval logs.|
|**Agent SRE**|Platform Ops|Operates AgentOps platform, monitors cost, drift.|
|**AI Advisor Coach**|Advisor Services|Uses copilots to personalise client support.|

---

## Part 6. Narrative Thread (for storytelling)

> _“In the Renaissance, double-entry gave merchants the confidence to scale.  
> In the Industrial age, joint-stock and clearinghouses balanced ambition with safety.  
> Today, hybrid human-agent teams do the same for digital products.  
> These experiments are our modern voyages — each one launching from a well-governed port, returning with data on how the future organisation should really work.”_
