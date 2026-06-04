# Decisions

## 2026-06-04 - Adopt as factory-output

Status: Accepted

### Context

`ai-powered-turtle` is an existing Quartz/Obsidian-style knowledge site owned through the `coderturtle` GitHub handle. The user stated it is not directly part of the Hekton factory machinery.

### Decision

Adopt the repository as a Hekton `factory-output` project.

- Local path: `/Users/hekton/Development/hekton/factory-output/ai-powered-turtle`
- Vault path: `20-projects/factory-output/ai-powered-turtle`
- Adoption status: `adopted`
- Lifecycle stage: `draft`

### Consequences

- The repo must not use the `hekton-` prefix.
- Product/code/content changes remain separate from the adoption commit.
- Hekton control-plane files live in the repo, while live vault updates require explicit human approval.

## 2026-06-04 - Record coderturtle as GitHub account

Status: Accepted

### Context

Hekton has first-class GitHub account routing in `~/hekton/config/github-accounts.yaml`. Factory-output projects can use `coderturtle`, and the SSH alias `github.com-coderturtle` selects the correct key.

### Decision

Record `github_account: coderturtle` and `github_remote_url: git@github.com-coderturtle:coderturtle/ai-powered-turtle.git` in `.hekton/project.yaml`.

### Consequences

- Future validation can compare the registered account to the actual `origin` remote.
- Agents should use the coderturtle SSH alias for this repo.
- No central Hekton machinery change is needed for GitHub-handle routing.
