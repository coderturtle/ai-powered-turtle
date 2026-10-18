# Operation Rubber Duck — Corporate Build Context Pack

**Audience:** corporate-machine Claude Code (Opus 5 + Sonnet 5), corporate Microsoft 365 Copilot personal agents with native skills, operations leadership offsite.
**Status:** implementation input, not a claim of deployed or tested software.
**Boundary:** no personal infrastructure, Strata dependency, model API/backend, sensitive real data, or unapproved data sharing. Synthetic example only.

## Start here
1. Read `docs/00-decisions-and-boundaries.md` and `docs/01-workshop-blueprint.md`.
2. Open Claude Code in a **new empty approved corporate workspace**. Paste `prompts/00-bootstrap-opus.md` using Opus 5.
3. Execute phases one at a time with `prompts/01-content-contracts-opus.md`, `02-frontend-sonnet.md`, `03-copilot-agents-skills-opus.md`, `04-qa-sonnet.md`, `05-review-opus.md`.
4. Before a phase, review git diff, run tests, and approve the next scope explicitly. Avoid unattended parallel implementations or a sprawling agent graph.
5. Test personal agent skill authoring **on the actual tenant**. You confirmed this feature exists. Do not assume personal agents can be published to other attendees without checking.

## Target 105-minute day segment
15-minute provocation followed by 90-minute workshop. Mission breakdown and handoffs are in `docs/01-workshop-blueprint.md`; `workshop/event.json` is the machine-readable source.

## Directory guide
- `docs/`: decisions, workshop, UX, technical architecture, deployment, facilitator runbook
- `prompts/`: ordered Claude Code build sessions, acceptance gates, fallback prompt
- `agents/`: four Copilot personal agent definitions and tests
- `skills/`: four native skill content packs with SKILL.md, examples, supporting templates
- `contracts/`: passport JSON Schema and handoff rules
- `scenarios/account-transfer/`: **fictional** demo artefacts with planted contradictions/reveal
- `workshop/`: mission config, cards, voting criteria and printable offline challenges
- `tests/`: manual acceptance and red-team cases
- `site/`: UI content/design tokens specification

## Non-negotiable outcome
A nontechnical participant can get from vague frustration → better-defined problem → process sketch → critique → hypothesis + cheap experiment, with humans checking each handoff. The website is mission control, not a chatbot.

## Five-minute smoke check
- Website builds as static files, no network required at runtime for core functions.
- Each mission displays instruction, working mode, prompt/skill entrypoint, exit criteria, fallback.
- Export/import of passport survives browser refresh and remains schema-valid.
- Copilot handoffs work by explicit copy/paste, including in ordinary Copilot fallback.
- Facilitator can operate keyboard-only and can skip, pause, extend, reset, and display fallback.
- Demo's fictional data never gets presented as verified process facts.
