# Setup

## Prerequisites

- Node.js 20 or newer
- npm 9.3.1 or newer

Check prerequisites:

```bash
scripts/check-prereqs.sh
```

## Install

```bash
npm install
```

The repository contains `package-lock.json`, so use npm unless a later decision changes the package manager.

## Verify

```bash
scripts/verify-project.sh
```

After dependencies are installed, run:

```bash
npm run check
npm test
```

## Build

```bash
npm run quartz -- build
```

The README also documents `bun install` and `bun run build`; the current `package.json` and lockfile point to npm as the safer reproducible default for this Hekton adoption.
