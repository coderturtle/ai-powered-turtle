# Session 0 — Opus 5 — Reconnaissance and scope lock

You are acting as principal engineer and workshop learning designer. I have supplied a folder called `operation-rubber-duck-pack` as authoritative **design intent**, not existing implementation. Read `README.md`, `docs/00-decisions-and-boundaries.md`, `docs/01-workshop-blueprint.md`, `docs/02-ux-and-technical-spec.md` and `contracts/handoff-rules.md` first.

Context: corporate Windows laptop; Claude Code with **Opus 5 / Sonnet 5 only**. Our tenant **supports skills inside Copilot personal agents**, but deployment, packaging and sharing mechanics require a tenant capability spike. No Copilot Studio. Never assume personal agents are shareable. No Strata dependency.

Do now:
1. Inspect environment read-only: project directory, OS, Node/npm, package manager, Git, corporate constraints visible locally. No network/install until approved.
2. Record architecture, threat/data boundaries, MVP stages, dependencies, unknowns, and a pragmatic test plan in `docs/implementation-plan.md`.
3. Separate native personal-agent skills (confirmed concept) from **their as-yet-unverified tenant packaging and rollout**.
4. Identify precisely which tasks Sonnet can implement independently and which Opus should review.
5. Verify the synthetic scenario tells a good story. Do not reveal hidden evidence to demo first pass.
6. Return a short execution plan with stop/go gates. Do not build the whole app or install/deploy things in this session.

Principles: human-controlled handoffs, local-first web app, no backend, no invented process facts, auditable evidence, minimal build. Use existing context pack unless a documented contradiction is found. Don't ask broad ideation questions; make reasoned assumptions and list material blockers.
