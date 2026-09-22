---
title: "Enterprise Context Corpus: Starter Pack"
tags: [starter-pack, context-engineering, architecture, agentic, prompts]
publish: true
project: "Enterprise Context Corpus"
description: "Starter pack for a 2-3 week internal prototype exploring a reusable enterprise context corpus, machine-readable architecture intent, and context compilation for humans and AI agents."
date: 2026-09-22
status: "draft"
vault: "ai-powered-turtle"
---

# Enterprise Context Corpus: Starter Pack

This pack bootstraps a 2-3 week internal prototype exploring:

- a reusable enterprise context corpus;
- machine-readable architecture intent;
- context compilation for humans and AI agents;
- architecture drift / debt detection;
- evidence and provenance;
- advisory assurance through Aegis;
- a Strategy Workbench as the first human-facing experience.

See [[README|the full README]] for the recommended agent split (Opus / Sonnet / Haiku), the core hypothesis, and the suggested execution sequence, plus the supporting docs and prompt files in this folder:

- `docs/context-pack.md`, `docs/validation-plan.md`
- `prompts/01-opus-plan.md` through `prompts/05-opus-critical-review.md`
- `manifest.json`

## IDD add-on pack

A lightweight Intent-Driven Development (IDD) add-on merges into this pack (see `idd/README.md`), scaffolding files-first: schemas, skills/prompts, deterministic validation, and evidence-backed verification — no IDD runtime up front.

- `docs/idd-context-pack.md`
- `idd/schemas/` — `intent.schema.json`, `evidence.schema.json`
- `idd/templates/` — `architecture.yaml`, `current.yaml`, `decisions.md`, `evidence.yaml`
- `idd/skills/` — `intent-create.md`, `intent-plan.md`, `intent-implement.md`, `intent-review.md`, `intent-verify.md`, `intent-close.md`
- `idd/agents/` — `planner-opus.md`, `implementer-sonnet.md`, `verifier-sonnet.md`, `utility-haiku.md`
- `idd/examples/intent-identity-migration.yaml`
- `idd/manifest.json`
