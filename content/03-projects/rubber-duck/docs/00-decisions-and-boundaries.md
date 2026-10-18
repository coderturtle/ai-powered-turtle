# Product decisions and boundaries

## Confirmed
- Author has Claude Code with **Opus 5 and Sonnet 5 only** on a corporate machine.
- Work tenant supports **skills within Copilot personal agents**. Implement and test these as first-class assets.
- Workshop uses both personal and team thinking, operations context, rubber duck theme.
- Local corporate app is main event control; Strata separate and optional.

## Unverified: test, do not infer
- Exact tenant-specific skill manifest/import process and supported tools; agents created via GUI versus files.
- Whether personal agents / their skills can be shared, centrally deployed or reused between attendee accounts.
- Whether attendees have the requisite licenses, permissions, or skill execution surfaces.
- Whether corporate PC supports localhost dev server, Node installation, package downloads, file:// fetch, browser clipboard, QR access, Web Storage, full-screen projector.
- Whether internal static hosting, Forms/SharePoint collection, or live voting is approved.

## Governance
- No real client, adviser, employee, account or transaction data in local site, localStorage, exported files, repository or external services.
- For real workshop problems, use generalized descriptions and approved Copilot sessions only. No unapproved bulk paste into external app.
- All demo artefacts explicitly labelled FICTIONAL / SYNTHETIC. Synthetic metrics are demonstration props, not validation.
- No attempt to bypass corporate endpoint restrictions, telemetry, DLP, permissions or agent sharing controls.
- Build app with no backend, no LLM API, no live sync by default, no fabricated agent confidence scores.
- Human accepts each handoff; AI propositions never silently promoted to facts.
- Only approved corporate M365 collection methods may receive team submissions; offline exports stay local.

## Engineering controls
- Create work in new repo; inspect existing workspace before writing anything.
- Keep implementation incremental; no autonomous multi-agent orchestration or needless infrastructure.
- Prefer Sonnet for bounded frontend/test implementation, Opus for architecture, agent behaviors, integration review.
- No installation/deployment/share/publish outside local workspace without human approval.
- No code snippets copied from personal repos or external private services.

## Decisions to capture after tenant spike
Agent name | installation method | native SKILL.md support | knowledge file constraints | test invocation | shareability | license dependency | fallback
