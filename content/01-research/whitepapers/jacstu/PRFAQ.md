# PRFAQ-Lite — Jacquard Studio (AI Experimentation Hub)

**Owner:** Head of Architecture & CTO (EU)  
**Audience:** Product, Engineering, Operations, Advisor Services, Compliance  
**Document purpose:** Explain why the hub exists, what experiments look like, how they work, and how we judge value.

---

## Press note (internal) — why now

We are setting up **Jacquard Studio**, a single place to run and compare small, time-boxed experiments across product, engineering and operations. The aim is simple: **put real software in people’s hands earlier**, learn with data, and scale only the patterns that work. By using a shared baseline and a short comparison table, teams can show progress without extra ceremony and leaders can see—at a glance—**what’s worth backing**.

---

## FAQ

### 1) What is Jacquard Studio?

A lightweight hub (repository, templates and dashboards) where teams propose, run and compare experiments. It provides:

- A one-page plan (PRFAQ) per experiment.
    
- A **baseline** before work starts.
    
- A small **set of shared measures** after release.
    
- A simple **comparison table** so results from different teams make sense side-by-side.
    

### 2) What problems does it solve?

- Ideas that drift because no one measures them.
    
- Pilots that can’t be compared, so nothing scales.
    
- Long discovery cycles that keep clients waiting.
    
- Concerns about safety and standards when trying new tools.
    

### 3) What types of experiments will we run?

We use three **experiment categories** (what’s being changed), kept distinct from where impact lands.

**A. Workflow & Stack**  
Changes to delivery methods and tools (pipelines, automation, testing, documentation).  
_Examples:_ feature-flagged continuous delivery; evaluation checks in CI; structured prompts for coding and docs.

**B. Role Evolution**  
Changes to responsibilities and skills, built on multiple Workflow & Stack trials.  
_Examples:_ a “Scenario Engineer” owning evaluations; an “Agent Wrangler” curating prompts and tools.

**C. Team Topology**  
Changes to the shape and scope of teams (size, cross-functional mix, support from central specialists).  
_Examples:_ four-person pods with shared agents; pods borrowing a “green-beret” engineer for short, difficult tasks.

### 4) How do experiments work in practice?

Each experiment is **small, real, and time-boxed**.

1. **Plan (one page):** a PRFAQ stating scope, a few measures, and a stop rule.
    
2. **Baseline (week 1):** capture the current figures using the shared definitions.
    
3. **Build & release:** ship a flagged change to a small cohort (advisors/clients) and collect data.
    
4. **Compare & decide:** publish the deltas; if the pattern holds and remains safe, we scale; if not, we stop and record the finding.
    

Most experiments run **6–12 weeks** and must put **working software** in front of advisors/clients or internal users.

### 5) How do we measure impact—and why these three areas?

We report results against three **impact dimensions** because they reflect how value is actually created.

**Team** — _Can small crews do more of the right work?_

- **Why it matters:** delivery speed and staff engagement drive capacity.
    
- **Typical measures:** lead time for change; rework %; team satisfaction; time spent on routine vs improvement work.
    

**Clients** — _Are clients and advisors better served, sooner?_

- **Why it matters:** early client contact cuts waste and raises adoption.
    
- **Typical measures:** time to first client feedback; conversion or usage uplift; advisor/service first-contact resolution; NPS shift.
    

**Process** — _Is the way we build safer and simpler?_

- **Why it matters:** fewer hand-offs, more automation, and stable quality reduce risk and cost.
    
- **Typical measures:** automation coverage; dependency count; change-fail rate; evaluation pass rate.
    

> We always record a **baseline** first, then publish the **percentage change** (good or bad) using the same definitions across teams. That is how we avoid noisy anecdotes and make fair comparisons.

### 6) How do we keep experiments safe and compliant?

- Use the standard pipeline and controls; policy checks run automatically.
    
- No client PII in dashboards; access is governed by existing rules.
    
- If a measure can’t be instrumented, we note the method (e.g., time-study) and its confidence.
    
- We stop or roll back if quality worsens beyond the agreed limit.
    

### 7) What value should teams expect?

- **Faster learning:** smaller bets, earlier feedback, less argument.
    
- **Clearer claims:** numbers with dates and sources, not slides.
    
- **Better focus:** a short list of measures and an explicit “won’t do” section.
    
- **Career clarity:** evidence for how roles are changing, not speculation.
    
- **Scale with confidence:** only patterns that clear the bar become standard practice.
    

### 8) How are categories different from impact?

- **Category = what we changed** (Workflow & Stack; Role Evolution; Team Topology).
    
- **Impact = where results showed up** (Team; Clients; Process).  
    We keep them separate so we know **which levers** really move the **outcomes**.
    

### 9) What are examples of first-wave experiments?

- **Workflow & Stack:** feature-flagged releases with evaluation checks for EU onboarding.
    
- **Role Evolution:** “Scenario Engineer” owning evaluation suites on one value stream.
    
- **Team Topology:** four-person pod delivering advisor fund comparison behind a flag.
    

### 10) What does “good” look like in the first quarter?

- Every new experiment has a baseline and three measures.
    
- Median time from proposal to first measured result is **a week or less**.
    
- We have at least one **credible win** to scale, and one honest “stop” we learn from.
    
- No rise in change-fail rate on participating teams.
    

### 11) How do we decide to scale or stop?

Each experiment sets a **go/no-go rule** in its PRFAQ. We scale only when the rule is met and controls remain green. Otherwise we either adjust and retry, or stop and document the finding.

### 12) Is this extra process?

It is one page up front and a baseline row. Dashboards update on push. If it does not help teams ship and learn faster, we will change it.

---

## Appendix — shared definitions (short)

- **Lead time for change:** work item created → running in production.
    
- **Change-fail rate:** percentage of deployments that cause an incident or rollback.
    
- **Automation coverage:** percentage of checks run automatically (tests, evaluations, policy).
    
- **Time to first client feedback:** release → first client or advisor response.
    
- **Composite view (optional):** a simple weighted summary to aid comparisons; teams should still look at the raw measures first.
    
