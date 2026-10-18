# Session 2 — Sonnet 5 — Implement local-first website MVP

Read README, `docs/02-ux-and-technical-spec.md`, `site/design-reference.md`, `workshop/event.json` and schema. Build only a **static React + Vite + TypeScript** website, using corporate-approved preinstalled packages or obtain human approval before new dependency downloads.

Required working paths:
- Projector `showtime` view and facilitator overlay: missions, real countdown/pause/resume/extend/skip/back/reset, notes, surprise cards, offline indicator.
- Participant companion: mission detail, role, prompt copy, fallback instructions, human-review checkpoint.
- Editable Passport with data provenance/status, schema validation, safe import/export JSON and readable Markdown.
- Agent/skill catalogue and copy prompt; user opens their own approved Copilot. NO fake API integration or fictional booking/poll results.
- Duck-Off scoring 3 separately visible dimensions with manual entry, outcome HATCH/INCUBATE/DUCK.
- Responsive high contrast design, keyboard focus, reduced motion, system fonts, no remote assets/CDN.

Constraints:
- No backend, no external calls/analytics/telemetry, no real PII persistence, no Strata embedding.
- Static assets only, config bundled at build time for offline compatibility. Diagnose corporate `localhost` vs file:// support rather than guessing.
- A participant should not have to read implementation details to use it.

Write component/unit tests for clock state, mission navigation, safe data handling, export/import, clipboard-denial fallback. Run build and tests; report results accurately. Create a 3-minute manual demo script. Make focused commits, no deployment/publish.
