

# What “Level-5” should mean (vs L4)

**Scope & span**

- **Enterprise span across portfolios/regions**; shapes multi-year tech strategy and the target architecture.
    
- **Owns design authority** (standards, reference architectures) and **investment guardrails** (e.g., platform re-use, “build vs buy”).
    
- Leads **cross-org forums** (ARB, AI/Model Risk Council, Standards Council); escalates only the biggest bets to CTO/CIO.
    

**Decision rights (RACI)**

- **A**: North-Star Architecture, Standards, Reference Implementations, Platform Adoption Priorities, AI governance.
    
- **C**: Budgeting & headcount (with COO/CFO), vendor selections, major outsourcing, regulatory commitments.
    
- **R** (delegates to L4/L3): Solution/Program architecture, ADRs, detailed designs, delivery reviews.
    

**Outcome metrics**

- DORA (lead time, deploy freq, CFR, MTTR) trending to top quartile; **% reuse** of platform components; **AI-in-prod** (# of governed models, time-to-production); **legacy decommission**; **risk/compliance pass rate**; **capex/opex per change**.
    

---

# L5: Head of Architecture (Europe) — Role Charter

**Mission.** Own the **EU technology strategy & target architecture**, steer the portfolio to the North Star, and industrialise AI patterns in partnership with central Platform/Data.

**Accountabilities**

- **Strategy & Blueprint.** Publish and maintain EU Target Architecture & 3-year Roadmap (aligned to group strategy); codify “golden paths”.
    
- **Design Authority.** Chair ARB; approve exceptions; own the **Architecture Playbook** (APIs, events, data mesh, AI gateway/MCP, zero-trust, PQC path).
    
- **AI & Innovation.** Run the **AI/Innovation funnel** (idea → prototype → pattern → platform). Ensure model governance (EU AI Act readiness) with Risk.
    
- **Portfolio shaping.** Gate keep major investments (reuse first); enforce strangler patterns and platform adoption OKRs with Product/Tech.
    
- **Partner management.** Primary EU interface to central Cloud/IDP, Data/ML, and Security teams; maintain a **Platform Adoption Backlog**.
    
- **Talent & Culture.** Build the architecture community (guilds, mentoring), succession planning for L3/L4 leads, external evangelism.
    

**Team topology (directs ≤5)**

- **Domain Architecture Lead (L3/L4)** – owns FAS & UKPI architects (and Manchester Site Arch when relevant).
    
- **AI & Innovation Lead (L3)** – small pod to prove patterns (RAG/agents/feature-store usage).
    
- **Governance & Enablement Lead (L3/L4)** – ARB ops, standards, DevEx liaison to US IDP, model risk templates.
    
- **Solutions Consulting Lead (L3)** – pre-sales/rapid discovery with business.
    

> Why L5: cross-portfolio authority, regulator & board exposure, platform influence without line-owning those teams, and accountability for AI strategy and risk make this a VP-grade remit.

---

# L5 Individual Architecture Roles (IC-heavy “Chief/Distinguished”)

These are **architectural force-multipliers** without large line orgs. They lead by standards, reference builds, and cross-portfolio outcomes.

## 1) **Chief Architect — International (Group-wide) [L5]**

**When to use:** You need a single canon for cross-region products (PI, FAS) and shared platforms (API, Data, AI, Identity).

- **Charter:** Own **global reference architecture**, pattern catalogue, and cross-region **capability roadmaps** (API economy, data mesh, AI control plane, SSI/tokenisation). Chair the **Global Standards Council**.
    
- **Interfaces:** Regional Heads of Architecture (EU, US, APAC); Central Platform/Data; CISO.
    
- **KPIs:** Standard adoption >80%, interop defects ↓, duplicate build ↓, platform reuse ↑.
    

> If this role exists at group level, your EU Head (L5) is the regional peer/implementer. If it doesn’t, you can **combine** “EU Head” + “International Chief Architect” for a period (see Option A below).

## 2) **Chief Architect — Region (e.g., Europe) [L5]**

**When to use:** Only if the **Head of Architecture** is scoped narrowly (e.g., portfolio only).  
**Risk of overlap:** Often redundant—prefer **Head of Architecture (Europe)** at L5 to cover both strategy **and** regional chief architecture.  
**Charter (if used):** Guard the **regional canonical models** (regulatory, data residency, channel specifics), arbitrate cross-LOB conflicts, sponsor DXO.

## 3) **Chief Architect — International LOB (PI or FAS) [L5]**

**When to use:** Global product lines with multiple regional variants need a unifying hand.

- **Charter:** Own the **product-line architecture** (PI or FAS) end-to-end: domain maps, API/event contracts, core journeys, data products, and migration waves. Publish **versioned reference implementations** (e.g., PI Onboarding v3).
    
- **Interfaces:** Regional LOB architects (L4), Product GM, Compliance, Data/ML platform.
    
- **KPIs:** Time-to-market for LOB initiatives; % reuse of LOB components; defect escape across regions.
    

## 4) **Chief Architect — Regional LOB (e.g., EUFAS, UKPI) [L5 or L4]**

**When to use:** High-stakes EU programmes (e.g., **DXO** spanning EUFAS & UKPI) that need one accountable owner above multiple squads.

- **Charter:** Own the **EU LOB target state** and delivery guardrails; orchestrate **shared capabilities** (omnichannel, advisor desktop, onboarding, payments, AML/KYC).
    
- **Staffing:** L4/L3 architects for each sub-domain report **to this role** for the duration of the programme.
    
- **Graduation:** Convert to **Principal Architect (L4)** after major milestones when steady-state returns to Domain Lead.
    

## 5) **Distinguished Architect — AI & Agentic Platforms [L5 IC]**

**Charter:** Define the **AI control plane** (gateway/MCP, identity pass-through, observability), model-risk controls, feature-store standards, and reference patterns (RAG, agents, safety rails).  
**Output:** RFCs, code templates, guardrail libraries, golden pipelines; mentor MLEs across regions.  
**KPIs:** Models to prod ↑, time-to-prod ↓, auditability “green” across AI systems.

## 6) **Distinguished Architect — Data/Streaming & Interop [L5 IC]**

**Charter:** Event-driven architecture, **contracted event models**, data-product SLOs, lineage/mesh governance; ensures global interop (Kafka/Flink/Iceberg patterns).  
**KPIs:** Event reuse rate, schema-breaks ↓, mesh SLO adherence.

## 7) **Distinguished Security Architect — Identity & PQC [L5 IC]**

**Charter:** Zero-trust blueprints, **SSI/VC** adoption, crypto agility & PQC transition plan, AI-security guardrails.  
**KPIs:** Control adherence, time-to-patch critical vulns, PQC rollout milestones met.

---

# How to compose these L5 roles with your EU team

## Option A — **Combined EU Head (L5) who also acts as International Chief Architect (interim)**

Use when you already exert global influence (patterns, vendors) and need speed.

```mermaid
graph LR
  A[L5 Head of Architecture (Europe) + Acting Chief Architect (International)]
  A --> B[L4 Domain Architecture Lead (EU)]
  A --> C[L3 AI & Innovation Lead]
  A --> D[L3/4 Governance & Enablement Lead]
  A --> E[L3 Solutions Consulting Lead]
  A -. dotted .-> P[Central Platform/Data/CISO]
  A -. standards .-> R[L4/L5 Regional LOB Chiefs (EUFAS, UKPI)]
```

**Pros:** Single throat to choke; maximum clarity and pace.  
**Cons:** Time-bound—plan to split once standards & patterns stabilise.

## Option B — **EU Head (L5) + International LOB Chief Architect(s) (L5)**

Use when PI and FAS each have significant global pipelines.

```mermaid
graph LR
  A[L5 Head of Architecture (Europe)]
  A --> B[L4 Domain Arch Lead (EU)]
  A --> C[L3 AI & Innovation Lead]
  A --> D[L3/4 Governance Lead]
  X[L5 Chief Architect - PI (International)]
  Y[L5 Chief Architect - FAS (International)]
  X -. matrix .- B
  Y -. matrix .- B
  B --> B1[L4 EUFAS Arch]
  B --> B2[L4 UKPI Arch]
```

**Pros:** Clear product-line ownership; regions implement.  
**Cons:** Requires crisp matrix to avoid double-hatting decisions.

## Option C — **EU Head (L5) + EU DXO Chief Architect (L5) spanning EUFAS & UKPI**

Perfect for your **DXO** opportunity—one L5 sits across both EU LOBs with L4s beneath.

```mermaid
graph LR
  A[L5 Head of Architecture (Europe)]
  A --> Z[L5 Chief Architect - EU DXO]
  Z --> B1[L4 Chief Architect - EUFAS]
  Z --> B2[L4 Chief Architect - UKPI]
  A --> C[L3 AI & Innovation Lead]
  A --> D[L3/4 Governance & Enablement Lead]
  Z -. platform asks .- P[Central Platform/Data]
```

**Pros:** Unifies EU digital experience; reduces duplication across EUFAS/UKPI; creates a visible L5 “programme” role.  
**Cons:** Needs explicit remit boundaries with Product & Engineering to prevent scope creep.

---

# Leveling & titling guidance

- **Head of Architecture (Europe) — L5** _(people leader; regional enterprise scope)_
    
- **Chief Architect — International (PI/FAS) — L5** _(IC leader; product-line global scope)_
    
- **Chief Architect — EU DXO — L5** _(programme L5 for a time-boxed transformation covering EUFAS & UKPI)_
    
- **Chief Architect — Regional LOB (EUFAS/UKPI) — L4** _(steady-state after DXO)_
    
- **Distinguished/Principal Architect (AI, Data, Security) — L5 IC** _(no line, broad impact)_
    

> Rule of thumb: **L5 when scope crosses either multiple regions or multiple portfolios with budgetary & risk accountability.** Otherwise, default to **L4**.

---

# Decision rights & guardrails (quick table)

|Topic|L5 Head (EU)|L5 Intl Chief Arch|L5 EU DXO CA|L4 Regional LOB CA|
|---|---|---|---|---|
|Target State & Standards|**A**|C|C|I|
|Major Tech Selections|**A/C**|C|C|R|
|Platform Reuse & Exceptions|**A**|C|C|R|
|Programme Architecture (DXO)|C|I|**A**|R|
|Solution Designs / ADRs|I|I|C|**A/R**|
|AI Governance (EU)|**A**|C|C|R|

(A=Accountable, R=Responsible, C=Consulted, I=Informed)

---

# First moves (next 60–90 days)

1. **Codify role charters** for: L5 Head (EU), L5 EU DXO CA, L5 Intl CA (PI/FAS), L5 ICs (AI/Data/Security).
    
2. **Stand up the councils** (ARB, AI Governance) with clear decision SLAs and exception paths.
    
3. **Appoint interim L4s** for EUFAS and UKPI; start the **DXO L5** search/appointment if you choose Option C.
    
4. **Publish the Architecture Playbook v1.0** and a **DXO Reference Architecture** (APIs, events, data, AI guardrails) to anchor the programme.
    

---

If you want, I can turn these into **one-page JD templates** for each L5 role with competencies, interview rubrics, and OKRs tailored to EUFAS/UKPI + DXO.