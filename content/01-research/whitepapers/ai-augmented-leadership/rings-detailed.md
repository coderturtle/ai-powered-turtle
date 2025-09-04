Amazing—here’s a **Rings-of-Risk SDLC playbook (v1.1)** that promotes ideas through **desirability → feasibility (tech + business) → scalability**, ties every ring to **golden pipelines**, and shows exactly **what’s automated vs. approved**, plus **how we evidence EU/UK compliance** (EU AI Act, GDPR/UK-GDPR, DORA, FCA Consumer Duty, PRA MRM).

---

# Rings at a glance (what we “prove” at each stage)

|Ring|Core question we’re proving|Primary activities|Data policy|Who can touch it|
|---|---|---|---|---|
|**R0 – Sandbox**|_Is the idea desirable?_ (user value)|Rapid prototyping (48–72h), fake-door tests, UX copy|Synthetic / public only|Makers (PM/Eng/Design)|
|**R1 – Prototype**|_Is it technically feasible & safe to try?_|Seedable spike → scaffold, eval baselines, DPIA screen|Pseudonymised / synthetic; **no live PII**|Squad + Platform|
|**R2 – Pilot**|_Is it valuable & compliant with real users?_|Staff-only or opt-in pilot, HIL, incident drill, business feasibility|**Minimised** live data; logging rules|Limited cohort (staff/advisors)|
|**R3 – Controlled Prod**|_Can it scale reliably & fairly?_|SLOs, fairness & drift monitoring, model validation, cost SLOs|Live data under SLOs|Target cohort|
|**R4 – Broad Prod**|_Is it fit for BAU?_|Quarterly red-team, governance cadence, MI for outcomes & costs|As above|All eligible users|

Regulatory anchors: **EU AI Act timeline** (bans from **Feb 2 2025**; GPAI & governance from **Aug 2 2025**; broad application **Aug 2 2026**; embedded high-risk to **Aug 2 2027**), **DORA in force Jan 17 2025**, **Consumer Duty ongoing outcomes monitoring**, **DPIA required for high-risk processing**, **PRA SS1/23 MRM as best-practice**. ([Digital Strategy](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai?utm_source=chatgpt.com "AI Act | Shaping Europe's digital future - European Union"), [EIOPA](https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en?utm_source=chatgpt.com "Digital Operational Resilience Act (DORA) - EIOPA"), [FCA](https://www.fca.org.uk/firms/consumer-duty-information-firms?utm_source=chatgpt.com "Consumer Duty – information for firms"), [ICO](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/?utm_source=chatgpt.com "When do we need to do a DPIA? | ICO"), [Bank of England](https://www.bankofengland.co.uk/prudential-regulation/publication/2023/may/model-risk-management-principles-for-banks-ss?utm_source=chatgpt.com "SS1/23 – Model risk management principles for banks"))

---

## Golden pipeline spine (what’s automated vs. approved)

**Automated gates (CI/CD) across rings**

- **Security:** SBOM, secrets scan, dependency policy.
    
- **Privacy:** DPIA _screen_ status, PII lints, redaction checks.
    
- **AI Safety:** eval suite (golden & red-team), toxicity/safety, latency SLO, drift check.
    
- **Data:** contract validation & quality SLAs.
    
- **Resilience:** rollback/kill-switch present, incident runbook proof.
    
- **FinOps:** cost tags, budget policy.
    

**Human approvals (only where needed)**

- **R2:** Privacy/Risk sign-off from pipeline evidence (DPIA complete if high-risk).
    
- **R3:** Independent model validation + Product Owner acceptance of HIL design.
    
- **R4:** Risk acceptance of residual risks + board-level MI on Consumer Duty outcomes.
    

> Goal: **evidence in the pipeline, not in decks.** Only escalate what _cannot_ be encoded as checks.

---

## Ring details: what happens, what’s checked, who approves

### R0 — Sandbox (rapid prototyping & desirability)

- **Activities:** Throwaway or seedable prototypes; quick “problem fit” demos; copy tested for clarity.
    
- **Data & tools:** Synthetic/public only; offline sandboxes; prompt registry (sandbox scope).
    
- **Automated gates:** license/SBOM; PII lints; eval smoke tests (optional).
    
- **Approvals:** none (PM owns).
    
- **Exit to R1:** 5-min demo, seedability checklist (deps compatible with paved roads).
    

### R1 — Prototype (technical feasibility & safety)

- **Activities:** Scaffold on paved roads; implement **eval baselines** (accuracy, latency, policy); **DPIA screening**; threat-model stub.
    
- **Automated gates:** security scans; **eval ≥ baseline**; data-contract validation.
    
- **Approvals:** none if DPIA screen = “not high-risk”; consult Privacy/Risk if likely high-risk (GDPR Art 35). ([ICO](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/?utm_source=chatgpt.com "When do we need to do a DPIA? | ICO"))
    
- **Exit to R2:** Eval green; rollback plan; feature-flag ready; DPIA status recorded.
    

### R2 — Pilot (business feasibility & regulatory proof with real users)

- **Activities:** Staff-only/opt-in pilot; **HIL** enabled; incident tabletop; update privacy notices; measure conversion/CSAT/cost.
    
- **Automated gates:** consent flags; log-retention config ≥ **6 months** (AI Act deployer duty); incident drill record; MI hooks for Consumer Duty outcomes; DORA incident taxonomy mapping. ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/26/?utm_source=chatgpt.com "Article 26: Obligations of Deployers of High-Risk AI Systems"), [FCA](https://www.fca.org.uk/firms/consumer-duty-information-firms?utm_source=chatgpt.com "Consumer Duty – information for firms"), [EIOPA](https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en?utm_source=chatgpt.com "Digital Operational Resilience Act (DORA) - EIOPA"))
    
- **Approvals:** Privacy signs DPIA (if high-risk); Risk notes AI Act classification; Product approves business KPIs.
    
- **Notes:** If deployer = public body / providing public services, run **FRIA** before first use (AI Act Article 27). ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/27/?utm_source=chatgpt.com "Article 27: Fundamental Rights Impact Assessment for High ..."))
    
- **Exit to R3:** SLOs green 2 sprints; pilot KPIs met; no red controls.
    

### R3 — Controlled Production (scalability, fairness, reliability)

- **Activities:** Independent **model validation**; fairness tests; drift & cost SLOs; third-party contract controls; resilience testing.
    
- **Automated gates:** weekly eval regression; fairness guardrails; cost per invocation/use-case; change-control with model pinning; DORA reporting timers in runbook. ([EIOPA](https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en?utm_source=chatgpt.com "Digital Operational Resilience Act (DORA) - EIOPA"), [Securiti](https://securiti.ai/eu-regulation-2025-301/?utm_source=chatgpt.com "EU Regulation 2025/301: ICT Incident Reporting"))
    
- **Approvals:** Model Risk/Architecture clinic sign-off (PRA SS1/23 principles as best practice). ([Bank of England](https://www.bankofengland.co.uk/prudential-regulation/publication/2023/may/model-risk-management-principles-for-banks-ss?utm_source=chatgpt.com "SS1/23 – Model risk management principles for banks"))
    
- **Exit to R4:** Error budgets healthy 3 cycles; duty MI shows no harm; residual risks accepted.
    

### R4 — Broad Production (BAU governance)

- **Activities:** Quarterly red-team & fairness testing; monthly drift & cost review; periodic DPIA refresh (if context changes); maintain technical docs/records per AI Act. ([Digital Strategy](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai?utm_source=chatgpt.com "AI Act | Shaping Europe's digital future - European Union"))
    
- **Automated gates:** release blocked on missing model card updates; MI export for Consumer Duty board packs. ([FCA](https://www.fca.org.uk/firms/consumer-duty-information-firms?utm_source=chatgpt.com "Consumer Duty – information for firms"))
    
- **Approvals:** Risk/Privacy periodic review; Product/Finance commit to cost guardrails.
    

---

## Evidence we capture (and show auditors) — by law

|Law / Guidance|What the pipeline proves|Where it lives|
|---|---|---|
|**EU AI Act**|Use-case classification; **human oversight** pattern; **logs ≥6 months** (R2+); technical docs/model card; monitoring & accuracy/fairness tests; GPAI usage documented.|`/ai/model_card.yaml`, `/ai/evals/*`, audit logs, registry. ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/14/?utm_source=chatgpt.com "Article 14: Human Oversight \| EU Artificial Intelligence Act"), [Digital Strategy](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai?utm_source=chatgpt.com "AI Act \| Shaping Europe's digital future - European Union"))|
|**GDPR / UK-GDPR**|DPIA screen/complete; data minimisation; lawful basis & notices; privacy lints/redaction; retention.|`/risk/dpia/*`, privacy job in CI. ([ICO](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/?utm_source=chatgpt.com "When do we need to do a DPIA? \| ICO"))|
|**DORA**|ICT asset inventory entry; incident classification playbook; reporting timers; resilience tests; third-party risk controls.|`/ops/runbooks/*`, incident drills, vendor records. ([EIOPA](https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en?utm_source=chatgpt.com "Digital Operational Resilience Act (DORA) - EIOPA"))|
|**FCA Consumer Duty**|Outcomes monitoring (fair value, understanding, support); clarity tests; vulnerable customer scenarios; MI exports.|`/comms/consumer_duty_checks.md`, MI dashboards. ([FCA](https://www.fca.org.uk/publication/finalised-guidance/fg22-5.pdf?utm_source=chatgpt.com "FG22/5: Final non-Handbook Guidance for firms on the ..."))|
|**PRA SS1/23 (MRM)**|Model inventory; ownership; validation evidence; change control (pins/rollbacks).|`/ai/model_card.yaml`, validation notes. ([Bank of England](https://www.bankofengland.co.uk/prudential-regulation/publication/2023/may/model-risk-management-principles-for-banks-ss?utm_source=chatgpt.com "SS1/23 – Model risk management principles for banks"))|

---

## Golden pipeline: example policy (drop-in)

```yaml
# .rings/promotion-policy.yaml
r1_to_r2_require:
  ai.evals.passed: ">=0.75"
  privacy.dpia_status: ["screened","complete"]     # ICO/UK-GDPR
  security.sbom_scan: "pass"
  feature.flag_present: true
  rollback.plan_present: true
r2_to_r3_require:
  ai.logs_retention_months: ">=6"                   # EU AI Act deployer
  dora.incident_tabletop: "pass"                    # DORA drill evidence
  hil.pattern: "documented"                         # human oversight
  slo.error_budget_status: "healthy_2_sprints"
  consumer_duty.mi_hook: "enabled"                  # outcomes MI
r3_to_r4_require:
  model.validation_independent: "pass"              # MRM-style
  ai.fairness_tests: "green"
  finops.cost_per_usecase: "<=budget"
  docs.model_card_updated: true
on_fail:
  block: true
  notify: ["#rings-of-risk","@product-ops","@ai-ops"]
  create_issue: true
```

---

## Reviews: who attends (and what disappears)

- **Stays manual (short & focused):**
    
    - **R2 Gate:** 15-min async approval by **Privacy** (DPIA), **Risk** (classification), **Product** (pilot KPIs).
        
    - **R3 Gate:** **Model validation** review (peer + central architect).
        
- **Becomes automated (no recurring meeting):**
    
    - Security scans, eval thresholds, fairness, SLO burn-rate, incident drill proof, FinOps budget checks, log-retention config, consent flags, data-contract checks.
        

> If a gate fails → fix code/config, re-run pipeline. No committee meetings.

---

## “Promote the idea” checklists (what we literally tick)

**R0 → R1 (Desirability → Tech Feasibility)**

-  Seedable prototype (paved-road-compatible)
    
-  Golden evals drafted + first run
    
-  DPIA **screen** done, decision logged (screen/needed) ([ICO](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/?utm_source=chatgpt.com "When do we need to do a DPIA? | ICO"))
    

**R1 → R2 (Tech Feasibility → Business Feasibility)**

-  MVP behind feature-flag & rollback plan
    
-  HIL pattern documented (who approves actions) ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/14/?utm_source=chatgpt.com "Article 14: Human Oversight | EU Artificial Intelligence Act"))
    
-  DPIA **complete** if high-risk; privacy notices updated
    
-  Log retention ≥ 6 months configured (AI Act) ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/26/?utm_source=chatgpt.com "Article 26: Obligations of Deployers of High-Risk AI Systems"))
    
-  DORA incident tabletop passed (evidence attached) ([EIOPA](https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en?utm_source=chatgpt.com "Digital Operational Resilience Act (DORA) - EIOPA"))
    

**R2 → R3 (Business Feasibility → Scalability)**

-  SLOs green two sprints; error budget healthy
    
-  Independent model validation (MRM style) ([Bank of England](https://www.bankofengland.co.uk/prudential-regulation/publication/2023/may/model-risk-management-principles-for-banks-ss?utm_source=chatgpt.com "SS1/23 – Model risk management principles for banks"))
    
-  Fairness tests green; cost SLOs in place
    
-  Third-party/GPAI contracts & risk checks aligned to DORA
    

**R3 → R4 (Scalability → BAU)**

-  Red-team cadence booked; drift monitor/alerts live
    
-  Consumer Duty MI shows positive outcomes (no harm) ([FCA](https://www.fca.org.uk/firms/consumer-duty-information-firms?utm_source=chatgpt.com "Consumer Duty – information for firms"))
    
-  Technical docs/model card updated per AI Act schedule ([Digital Strategy](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai?utm_source=chatgpt.com "AI Act | Shaping Europe's digital future - European Union"))
    

---

## Two boxed experiments to trial this now

1. **“Pilot Gate as Code” (R1→R2)**  
    **Hypothesis:** converting DPIA status, HIL pattern, log-retention, and incident-drill proof into CI gates halves approval time with no control regressions.  
    **Measure:** ready→pilot lead time; # manual reviews avoided; post-pilot incidents (target: zero).  
    **Why it’s compliant:** DPIA/consent/logging + human oversight are explicit AI Act & GDPR-aligned proofs. ([Artificial Intelligence Act](https://artificialintelligenceact.eu/article/26/?utm_source=chatgpt.com "Article 26: Obligations of Deployers of High-Risk AI Systems"), [ICO](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments-dpias/when-do-we-need-to-do-a-dpia/?utm_source=chatgpt.com "When do we need to do a DPIA? | ICO"))
    
2. **“Fairness in the Pipeline” (R2→R3)**  
    **Hypothesis:** adding fairness metrics to weekly eval regression catches issues pre-scale without slowing releases.  
    **Measure:** fairness regression rate; time-to-fix; release cadence preserved.  
    **Why it’s compliant:** supports AI Act transparency/monitoring and FCA outcomes monitoring. ([Digital Strategy](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai?utm_source=chatgpt.com "AI Act | Shaping Europe's digital future - European Union"), [FCA](https://www.fca.org.uk/firms/consumer-duty-information-firms?utm_source=chatgpt.com "Consumer Duty – information for firms"))
    

---

If you like, I can turn this into a **repo starter** (`/.rings`, `/ai/evals`, `/risk/dpia`, `/ops/runbooks`) with the YAML policy above and checklists wired into your golden pipelines.