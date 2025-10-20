---
title: Regulatory Mapping — EU AI Act, DORA, Consumer Duty
tags: [regulation, compliance, jacquard]
---

# Regulatory Mapping

> We map obligations to concrete controls and evidence. Keep this current.

Regulation | Obligation | Control | Evidence | Owner
---|---|---|---|---
EU AI Act | Logging & transparency | POL-AI-004; redacted logs; model gateway pin | CI logs; PRFAQ §6; eval reports | Risk
EU AI Act | Human oversight | Promotion rule (two approvals) | Decision record on Experiment | Architecture
DORA | ICT change management | Feature flags; rollback runbook | RB-FF-01; PRs | Ops
Consumer Duty | Fair outcomes | Guardrail metrics; monitored rollouts | Dashboard deltas; cohort notes | Product
GDPR | Data minimisation | No PII in dashboards; masking | SEC-012; data policy link | Data

## Gap tracker
- [ ] Open issue(s) and target dates for any gaps:
