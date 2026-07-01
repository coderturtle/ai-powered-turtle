# Project Walkthrough

## What This Is

AI Powered Turtle is a public knowledge site built with Quartz. It turns an Obsidian-style Markdown content tree into a browsable web site.

The repo contains two broad things:

- The Quartz site machinery: TypeScript, Quartz configuration, static assets, package manifests, and GitHub Actions workflows.
- The authored knowledge base: prompts, research notes, whitepapers, project writeups, dashboards, and scratch notes under `content/`.

## Why It Matters

This is a factory output rather than Hekton machinery. It is useful as a published body of work and a place where AI/software architecture thinking can be organized for readers outside the Hekton operating system.

## How It Fits Hekton

Hekton keeps code and deliverables under `/Users/hekton/Development/hekton/`. Because this repo is linked to the `coderturtle` GitHub handle and is not Hekton platform infrastructure, it belongs under:

```text
/Users/hekton/Development/hekton/factory-output/ai-powered-turtle
```

Its human-facing control plane should live under:

```text
20-projects/factory-output/ai-powered-turtle
```

The live vault has not been changed in this adoption session. The `mind-palace/` folder contains proposed mirror files only.

## What Was Verified

- The repository cloned successfully through the coderturtle SSH alias.
- The remote is configured as `git@github.com-coderturtle:coderturtle/ai-powered-turtle.git`.
- The README, licenses, package manifest, `.gitignore`, recent commits, and tracked files were inspected.
- A credential-shaped secret scan found no obvious token/key/private-key hits.

## What Remains Unverified

- The content tree has not been fully reviewed for publication/privacy suitability.
- GitHub Actions deployment behavior has not been executed or reviewed in detail.
- Dependencies were not installed during adoption.
- `npm run check` and `npm test` have not been run.

## Human Next Step

Review whether this repo should remain public-facing as-is, then decide whether to push the adoption branch back to GitHub.
