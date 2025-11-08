---
title: "PRFAQ Lite — Interim Guardrail for Claude Code (EU)"
author: "Head of Architecture & Platform Engineering, Europe"
date: "8 November 2025"
status: "For Decision by 22 November 2025"
---

# PRFAQ Lite — Interim Guardrail for Claude Code (EU)

## 1) One‑Page Press Release (Internal, For Immediate Use)

**8 November 2025 — Our Firm (Europe) announces an interim, low‑risk enablement of Claude Code for engineers in the EU**, delivered via **Amazon Bedrock** in **eu-west-1 (Ireland)** with **walled‑garden models**. Access is **limited to non‑production or synthetic data** and is gated by **mandatory training** and a **developer attestation**.  
The interim guardrail will **block EU AI Act high‑risk categories** and **run detect‑only** for other uses, preserving developer experience while maintaining oversight and auditability. A full **“vibe coding” guardrail**—tuned for potential production‑data scenarios—will be defined in parallel.

> “This is a pragmatic, low‑risk step that protects our obligations while unlocking developer productivity now,” said the **Head of Architecture & Platform Engineering (EU)**. “We’ll review data and feedback at 30/60/90 days and iterate.”

> “Blocking high‑risk categories and tightening access with training and attestation strikes the right balance for the short term,” noted a **Risk & Compliance representative**. “We retain EU residency, logging, and standard SDLC controls.”

**Target enablement:** within **1 weeks** of approval. **Decision needed by 14 November 2025.**

---

## 2) Tenets (What must be true)

1. **EU Residency by Default:** All inference remains in **eu-west-1 (Ireland)**; models run in a **walled garden**.
2. **Non‑Prod/Synthetic Only:** No production personal data or secrets are permitted.
3. **Human in the Loop:** Code is always reviewed, scanned, and tested through the SDLC.
4. **Guardrail Pragmatism:** **Block** EU AI Act high‑risk categories; **detect‑only** for other uses with logging.
5. **Gated Access:** Mandatory training + developer attestation; periodic re‑attestation.
6. **Auditability:** Access control, retention, and logs support investigation and review.

---

## 3) FAQ (Short Answers for Exec/Legal/Compliance/Privacy/Risk)

**Q1. What problem are we solving now?**  
Developers in the EU lack access to Claude Code while we design a fuller “vibe coding” guardrail. The interim approach unlocks **near‑term productivity** with **low residual risk**.

**Q2. What is “vibe coding” and how is it different from LLMs in apps?**  
“Vibe coding” = **context‑rich IDE assistance** for developers (boilerplate, refactors, tests). It is **not** a customer‑facing AI system making decisions about individuals. Output is **human‑reviewed** and **SDLC‑checked**.

**Q3. What exactly is the interim guardrail?**  
- **Block:** EU AI Act **high‑risk** categories (and prohibited types) relevant to a dev assistant (e.g., biometric ID; decisions affecting employment/credit/education; safety‑critical control; justice/law enforcement).  
- **Detect‑only elsewhere:** log & alert; do not block. Periodic review and tuning.

**Q4. What data can be used?**  
Only **non‑production or synthetic data**. No production personal data or secrets.

**Q5. Where does processing happen and who can see prompts/completions?**  
Processing occurs in **eu-west-1 (Ireland)** using **walled‑garden** models. Logs and access records are retained with **least‑privilege** access for security and audit.

**Q6. How are privacy and security risks mitigated?**  
EU residency, no prod personal data, training & attestation, SDLC controls (reviews, SAST/SCA, secrets/IaC scanning), logging and periodic review.

**Q7. How is the EU AI Act considered?**  
High‑risk categories are **blocked**; other usage is **detect‑only** with oversight. Because this is **developer assistance**, it is not a deployed AI system making decisions about individuals.

**Q8. What’s the risk rating?**  
Considering the mitigations above, **residual risk = Low** (Low‑to‑Medium for licensing/IP) for the interim scope.

**Q9. What are the business risks of delaying?**  
Cost of delay: reduced developer throughput and flow, slower 2026 delivery, talent friction. Interim enablement recovers value **now** while we build the full guardrail.

**Q10. What triggers a pause or rollback?**  
Evidence of policy violations (e.g., prod personal data use), material increase in risky alerts, or failure of SDLC/monitoring controls.

**Q11. What is out of scope?**  
Customer‑facing decisioning, production personal data, autonomous deployment, turning off logs or reviews.

**Q12. What’s next after approval?**  
Enable within **2 weeks**, run **30/60/90‑day** reviews, and publish the detailed proposal for the **“vibe coding” guardrail** for any future production‑data scenarios.

---

## 4) Guardrail Summary (Interim)

| Area | Mode | Example | Rationale |
|---|---|---|---|
| EU AI Act high‑risk/prohibited | **Blocked** | Biometric ID; employment/credit/education decisions; safety‑critical; justice/LE | Regulatory exposure not aligned to dev‑assist |
| Secrets & credentials | **Blocked & Scanned** | API keys, tokens, passwords | Prevent leakage |
| All other dev‑assist usage | **Detect‑only** | Boilerplate, refactors, tests, docs | Preserve DX + telemetry & review |

---

## 5) Success Metrics & Review Cadence

- **Lead time for change** (↓), **PR throughput** (↑), **defect escape rate** (↓), **developer NPS** (↑), **policy alert volume & closure time**.  
- **Reviews:** 30/60/90‑day checkpoints with Legal/Privacy/Security/Risk/Architecture to tune rules and confirm residual risk.

---

## 6) Implementation Snapshot

- **Week 0–1:** finalize block/detect rules; publish policy & FAQ.  
- **Week 1–2:** training & attestation; provision access; baseline dashboards.  
- **Owners:** Architecture (policy), Platform Eng (config/telemetry), Security (SDLC), Privacy/Legal/Compliance/Risk (review), Eng Managers (adoption).

---

## 7) Risk & Mitigations (Lite)

| Risk | Mitigation | Residual |
|---|---|---|
| Data leakage (PII/secrets) | No prod data; training; secrets scanning; EU residency | **Low** |
| Malicious/unsafe code | Reviews; SAST/SCA; tests | **Low** |
| Licensing/IP contamination | Dependency policies; provenance checks | **Low‑to‑Medium** |
| Regulatory misclassification | Block high‑risk; detect‑only elsewhere; reviews | **Low** |

---

## 8) Decision Ask

**Approve** the interim guardrail for **developer‑assist coding** on **non‑production/synthetic data** in **eu-west-1 (Ireland)**, with **high‑risk uses blocked**, **detect‑only for others**, and **training + attestation** gating. Target enablement: **2 weeks**. Decision by **22 November 2025**.

---

## 9) Appendix — Sample Developer Attestation (Plain Language)

> I understand Claude Code is approved only for **non‑production or synthetic data**. I will not input production personal data or secrets. I will follow our secure coding standards and SDLC. I will not use the tool for customer‑impacting decisions or to bypass controls. I agree to monitoring and periodic review.

