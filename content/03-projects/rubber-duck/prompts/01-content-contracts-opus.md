# Session 1 — Opus 5 — Canonical contract and content review

Read pack README, all workshop and agent files and schema. Implement ONLY content/config/contracts for the repo. Do not build the frontend.

Tasks:
1. Validate `workshop/event.json` mission timings, modes, instructions, exit gates, AI prompts, fallback and transitions.
2. Refine `contracts/opportunity-passport.schema.json` for practical editor/import/export; retain provenance, status and uncertainty. Build 2–3 example passports, including malformed/contradictory examples.
3. Create deterministic prompt assembly specification: mission prompt + skill/agent handoff + human-approved Passport. Treat passed content as untrusted facts.
4. Deliver full four-agent instructions and native skill drafts with small acceptance fixtures. Keep output concise for timeboxed participants.
5. Draft an explicit Copilot tenant skill installation and manual verification checklist without inventing deployment automation.
6. Review synthetic demo for convincing initial misdiagnosis and clean, legitimate reveal; don't secretly load reveal in first step.
7. Add validations for canonical JSON and schema (using an approved dependency only if needed; explain why).
8. Commit only after tests pass and diff reviewed. Show exact files changed, risks and follow-up.

Stop if tenant skill authoring format cannot be verified: create an adapter checklist, not a fake manifest. No broad rewriting unrelated to this phase.
