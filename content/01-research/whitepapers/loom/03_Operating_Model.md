---
title: 03_Operating_Model
owners: [Head of Architecture & Platform Engineering (International)]
status: draft
tags: [loom, operating-model]
last_review: 2025-10-18
---

> [!info] How to use this page
> Day‑to‑day, predictable, boring in the right ways.

## Tenets
AI‑First · Fast & Safe · Federated not fragmented · Facts over opinions · Frictionless DevEx

## Cadence
Weekly Intake Clinic · Bi‑weekly Standards Forum · Monthly Exec Review · Office Hours · Monthly Showcase

## Ways of working
- Embed upstream with central teams so **intl‑ready at GA** is normal.
- Keep guardrails in code (templates, CI checks, telemetry).
- Run **Rotation Pods** quarterly; graduates become champions.

```mermaid
graph LR
  Squad[Squad] -->|Intake| Triage
  Triage{Evidence & Risk Triage} --> Scaff[Template Scaffolder]
  Scaff --> Build[Build & Test]
  Build --> Review[Design/Code Review]
  Review --> Pilot[Pilot]
  Pilot --> Template[Publish Template + Docs]
```
