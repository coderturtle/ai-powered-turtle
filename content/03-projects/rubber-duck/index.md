---
title: "Operation Rubber Duck"
tags: [context-pack, workshop, copilot, agents, skills, prompts]
publish: true
project: "Rubber Duck"
description: "Operation Rubber Duck — a build context pack for a 105-minute operations leadership workshop that uses rubber-duck Copilot personal agents to sharpen problems before solving them, with a local-first facilitator website as mission control."
date: 2026-10-18
status: "draft"
vault: "ai-powered-turtle"
---

# Operation Rubber Duck

**Don't ask AI for the answer. Use it to find a better question.**

Operation Rubber Duck is a context pack for building and running a 15-minute provocation plus 90-minute workshop for an operations leadership group. Teams move from vague frustration → better-defined problem → process sketch → critique → hypothesis and cheap experiment, with humans checking every handoff.

Operating rhythm:

> THINK (human) → CHALLENGE (AI) → DECIDE (human).

Four Copilot personal agents, each backed by a native skill, carry the missions:

- **The Duck** — Socratic problem framing (`problem-discovery`)
- **The Mirror** — current-state process reconstruction (`process-archaeology`)
- **The Quackquisition** — sceptic, customer and controls challenge (`adversarial-review`)
- **The Hatchmaster** — simplify/augment/reinvent options and experiment design (`experiment-design`)

The shared deliverable is an **Opportunity Passport** (JSON Schema in `contracts/`). A local-first static website acts as mission control, not a chatbot. All scenario data is fictional/synthetic.

See [[03-projects/rubber-duck/README|the pack README]] for the reading order, plus the supporting material in this folder:

- `docs/` — decisions and boundaries, workshop blueprint, UX/technical spec, facilitator runbook, corporate rollout, scope gates
- `prompts/` — ordered Claude Code build sessions (Opus/Sonnet) and a one-session fallback
- `agents/` — the four personal agent definitions and test prompts
- `skills/` — four native skill drafts with acceptance cases
- `contracts/` — Opportunity Passport schema, example passport, handoff rules
- `scenarios/account-transfer/` — fictional demo case with a planted reveal
- `workshop/` — mission config (`event.json`), participant and offline challenge cards, Duck-Off scoring
- `tests/` — acceptance and adversarial checklist
- `site/` — design reference
- `MANIFEST.json`
