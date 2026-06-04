# AGENTS.md - AI Powered Turtle

## Project Classification

This repository is a Hekton **factory-output** project.

- Local repo path: `/Users/hekton/Development/hekton/factory-output/ai-powered-turtle`
- Vault control-plane path: `20-projects/factory-output/ai-powered-turtle`
- GitHub account: `coderturtle`
- Privacy boundary: `public`
- Vault mutation allowed: `false`

## Operating Rules

Before structural changes, read:

- `.hekton/project.yaml`
- `README.md`
- `docs/project-walkthrough.md`
- `docs/session-log.md`
- `docs/decisions.md`
- `docs/next-actions.md`
- this file

Agents must not write to the live Obsidian vault from this repo unless the human explicitly authorizes that write in the current session. Use the repo-local `mind-palace/` mirror for proposed notes.

## Scope Boundaries

This adoption commit must remain behavior-neutral. Do not modify Quartz source, content notes, dependency manifests, lockfiles, or GitHub Actions workflows unless a later task explicitly requests that work.

For future sessions:

- Keep authored content review separate from infrastructure work.
- Treat deployment workflow changes as human-approved only.
- Do not publish, push, or change remotes without explicit approval.
- Run the cheapest relevant validation and record the result in `docs/session-log.md`.

## Known Validation Commands

```bash
scripts/check-prereqs.sh
scripts/verify-project.sh
npm run check
npm test
```

Run `npm` commands only after dependencies are installed and the human is comfortable with local package execution for this repo.
