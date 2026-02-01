This pack helps you build Loop-ready artifacts and Mermaid diagrams showing org evolution and responsibility boundaries.

## Recommended run order

1) E0 Master Context
2) E1 Copilot: generate NOW org from direct reports
3) E2 Now narrative + boundaries
4) E3 Next Internal view
5) E4 Next External view
6) E5 Later target org
7) E6 Loop components pack
8) E7 Leveling & expectations


---

## E0 — Master Context Prompt for Org Evolution (Now/Next/Later)

You are my org design partner. I need to produce a clear “Now / Next / Later” evolution narrative for my organisation and publish it as Loop-shareable components (tables + mermaid diagrams + short narrative blocks).

Standards for storage
- Loop-Shareable: org evolution pages, diagrams, RACI boundaries, role definitions, ceremony expectations.
- OneNote-Confidential: sensitive headcount, budget, named performance issues.
- OneNote-Private: candid people notes.

Mission
1) Interview me (max 12 questions) to confirm any missing context (names, current reporting lines, level definitions, constraints).
2) Generate Loop-ready content in small reusable blocks:
   - 60s narrative
   - Now/Next/Later summary table
   - Mermaid org charts (Now, Next-Internal, Next-External, Later)
   - Responsibility boundaries (Architecture team vs CTO team)
   - Ownership/RACI-lite examples

Key requirements
- “Now” must split into: Architecture Team and CTO Team.
- “Next” includes two architecture views: Internal (capability buckets) and External (business-aligned view).
- “Later” includes location (London/Manchester), manager layers, and optional enablement structure (1 IC to me vs 2–3 under a manager).
- Also include a leveling plan: balance of level 3s and 4s (currently mostly 4s), with expectations per level and industry-wide responsibilities for solution vs technical architects.

Output format (strict)
A) Loop page outline (6 pages max) with what goes where
B) Loop components (copy/paste blocks) for each page
C) Mermaid diagrams (code fenced) for each view
D) A decision log + open questions list

Start with the interview questions.


---

## E1 — Copilot prompt: Generate “Now” org diagram from direct reports + split into Architecture vs CTO teams

You are Microsoft 365 Copilot. You have access to my organisation chart and my direct reports list.

Goal
Produce a Mermaid diagram of my CURRENT (“Now”) org, and then split it into two buckets:
1) Architecture Team
2) CTO Team

Instructions
1) Identify my direct reports and current reporting structure (1–2 levels deep).
2) Produce a Mermaid diagram (flowchart or mindmap) showing:
   - Me at top
   - Two subgraphs: Architecture Team and CTO Team
   - Each person under the correct subgraph
3) If a person’s classification is unclear, list them under “Unclassified” and ask me to assign.
4) Output:
   - Mermaid code block
   - A simple table (Name | Current Title | Current Level | Team bucket | Notes)

Constraints
- Do not include any confidential performance commentary.
- Use initials if names are sensitive (or ask me if full names are OK).

Start now: pull the org info and draft the Mermaid + table.


---

## E2 — Build the “Now” narrative + responsibilities boundary (Architecture vs CTO team)

You are my org operating model writer. Using the “Now” diagram and my context, produce Loop-ready content that explains the current split between Architecture Team and CTO Team.

Required outputs (copy/paste blocks)
1) 60-second narrative: why we have two buckets and the value of the split
2) Responsibilities boundary table:
   - Architecture Team: owns / co-owns / influences / does not do
   - CTO Team: owns / co-owns / influences / does not do
3) Engagement/handshake rules between the two buckets (5–10 bullets)
4) “What changes immediately” vs “What stays the same” lists
5) Open questions + decision log (if any)

Keep it pragmatic and non-theoretical.


---

## E3 — “Next” Architecture Team: Internal capability view (5 buckets) + Mermaid

You are my org designer. Create the “Next” internal capability view of my Architecture Team and output Loop-ready components plus a Mermaid diagram.

Internal buckets (must match exactly)
1) Domain Architects: 1
2) Product Architects: 5 (3 consultants)
3) Domain Solution Consultants: 1
4) Product Solution Consultants: 4 (2 consultants)
5) Enablement Engineers: 1 (consultant)

Rules
- Show me at top, then Architecture Team bucket, then 5 capability buckets beneath.
- Within each bucket, show counts and consultant flags (e.g., “(consultant)”).
- Output must include:
  A) Mermaid diagram code block
  B) A table listing each bucket: purpose, responsibilities, key outputs, success measures, and key partner teams
  C) A short narrative on why this capability split increases leverage and reduces firefighting

Do not invent names if I haven’t provided them; use placeholders like “PA1…PA5” and mark consultants clearly.


---

## E4 — “Next” Architecture Team: External business-aligned view (UKPI/FAS/CDAO) + Mermaid

You are my org designer. Create the “Next” external view of my Architecture Team aligned to business areas, and output Loop-ready components plus a Mermaid diagram.

External view requirements (must match exactly)
- UKPI: 3 sub-areas
  - S&O: 1
  - Investment Platform: 1
  - Operations: 1 (Operations consists of CRM, getHelp, martech)
- FAS: 1
- CDAO: 1

Layout requirement
- Operations should be at the TOP in this view
- UKPI and FAS in the MIDDLE
- CDAO at the BOTTOM

Outputs
A) Mermaid diagram code block reflecting the vertical layout above
B) A “who to engage” guide (table): business area → typical requests → how to engage us → expected artifacts
C) A short narrative: how this view clarifies stakeholder ownership and reduces confusion

Do not invent names if I haven’t provided them; use placeholders.


---

## E5 — “Later” org design: locations + manager layers + CTO team bucket + enablement options + Mermaid

You are my org design partner. Create the “Later” target org picture including location (London vs Manchester), manager layers, and the CTO team bucket.

Later requirements
- Architecture Team structure:
  - Domain Architect + Domain Solution Consultant as one bucket reporting directly to me
  - New manager for Product Architects (reports to me) — located Manchester
  - New manager for Product Solution Consultants (reports to me)
  - Enablement team: two options
    Option A) single enablement engineer reports to me
    Option B) 2–3 enablement engineers under a manager who reports to me
- CTO Team: one bucket with all 4 reporting to me

Location requirements
- Of the Architecture Team, existing 4 people are in London
- New architect manager is in Manchester
- Consultants in the “Next” phase are replaced with crew in Manchester (assume permanent hires)
- Manager may be hands-on and aligned to a product

Outputs (Loop-ready)
1) Mermaid diagram of “Later” (show locations in node labels, e.g., “(London)”)
2) A short narrative: why the later model (locations + managers) increases scale and resilience
3) A “transition assumptions” list (what must be true for this to work)
4) Open questions / decision log (e.g., enablement option A vs B)

Do not invent individual names; use placeholders and location tags.


---

## E6 — Loop components pack: Now/Next/Later evolution page blocks + decision log + FAQ

You are my Microsoft Loop workspace curator. Create copy/paste Loop components to explain the org evolution end-to-end.

Required components (each as a separate titled block)
1) Start Here block (one paragraph + links list placeholders)
2) Now / Next / Later summary table (rows: phase; columns: structure; why; benefits; risks; decisions)
3) Diagram embed blocks (placeholders with labels for each Mermaid diagram)
4) “Boundary of responsibility” block (Architecture vs CTO)
5) “How to engage us” block (engagement menu; expected artifacts)
6) “What we are not doing” block (anti-patterns and redirect)
7) FAQ (10 questions)
8) Decision log template (ADR-lite) + Open questions list

Constraint
- Everything must be shareable. Do not include people-sensitive content.


---

## E7 — Leveling & expectations: balance L3/L4 + role expectations (solution vs technical architect)

You are my org capability and career framework writer. I need to introduce a healthier mix of level 3 and level 4 roles (currently mostly level 4s), and set clear expectations per level and role type.

Inputs
- I have an internal expectations framework for levels; you will ask me to paste it.
- We also want an industry-aligned view of responsibilities for:
  - Solution Architect / Solution Consultant
  - Technical Architect / Domain Architect
  - Product Architect
  - Enablement Engineer

Mission
1) Interview me (max 10 questions) to capture: internal level framework, current role mix, and what level 3 vs 4 means in our company.
2) Produce Loop-ready content:
   A) Level expectations table (L3 vs L4): autonomy, scope, decision-making, stakeholder influence, quality/ops mindset, mentoring, AI fluency
   B) Role expectations table (solution vs technical vs product vs enablement): purpose, responsibilities, outputs/artifacts, measures, anti-patterns
   C) A practical leveling plan: where L3s make sense, where L4s are required, and how we develop L3→L4 progression
   D) Talking points: how to explain the level mix change without triggering defensiveness

Constraints
- Do not include individual performance judgments.
- Keep it actionable and consistent with a regulated environment.
Start now with the interview questions.