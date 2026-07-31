# Operating Model

## Purpose

AI Powered Turtle is a Quartz-powered public knowledge site for AI architecture notes, prompt kits, research, dashboards, and project writeups.

Within Hekton, it is a factory-output project: a deliverable produced or maintained by the broader Hekton operating environment, not part of the Hekton factory machinery itself.

## Ownership And Routing

- Hekton classification: `factory-output`
- GitHub account: `coderturtle`
- Remote: `git@github.com-coderturtle:coderturtle/ai-powered-turtle.git`
- Local path: `<hekton>/factory-output/ai-powered-turtle`
- Vault path: `20-projects/factory-output/ai-powered-turtle`

## Maintenance Rules

- Keep adoption, content edits, infrastructure edits, and deployment changes as separate sessions.
- Do not change `.github/workflows/` without explicit human approval.
- Do not install or upgrade dependencies as part of unrelated work.
- Review authored content before public publishing or deployment changes.
- Update `docs/session-log.md`, `docs/decisions.md`, and `docs/next-actions.md` after material sessions.

## Validation

Cheapest Hekton checks:

```bash
scripts/check-prereqs.sh
scripts/verify-project.sh
```

Project checks, after dependencies are installed:

```bash
npm run check
npm test
```

Central Hekton checks:

```bash
cd <hekton-machinery>
just validate-reproducibility <hekton>/factory-output/ai-powered-turtle
just governance-check -- <hekton>/factory-output/ai-powered-turtle
```

## Vault Policy

Live vault mutation is not allowed by default. Draft proposed control-plane notes in `mind-palace/` and sync only after explicit human approval and the normal backup/sync process.
