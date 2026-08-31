# Decisions

## 2026-06-04 - Adopt as factory-output

Status: Accepted

### Context

`ai-powered-turtle` is an existing Quartz/Obsidian-style knowledge site owned through the `coderturtle` GitHub handle. The user stated it is not directly part of the Hekton factory machinery.

### Decision

Adopt the repository as a Hekton `factory-output` project.

- Local path: `<hekton>/factory-output/ai-powered-turtle`
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

Hekton has first-class GitHub account routing in `<hekton-machinery>/config/github-accounts.yaml`. Factory-output projects can use `coderturtle`, and the SSH alias `github.com-coderturtle` selects the correct key.

### Decision

Record `github_account: coderturtle` and `github_remote_url: git@github.com-coderturtle:coderturtle/ai-powered-turtle.git` in `.hekton/project.yaml`.

### Consequences

- Future validation can compare the registered account to the actual `origin` remote.
- Agents should use the coderturtle SSH alias for this repo.
- No central Hekton machinery change is needed for GitHub-handle routing.

## 2026-08-31 - Incorporate deep-research report as a partners-research whitepaper

Status: Accepted

### Context

The user had a deep-research report (`~/Downloads/deep-research-report-5.md`, on partnership-ready technology and agentic identity/delegation for financial institutions) they wanted incorporated into the vault, alongside a general check that agent context/instructions are current. This followed the 2026-07-31/08-01 open-core boundary remediation (`a201c74`, `3f7d4e4`) that git-ignored the control-plane files (`.hekton/`, `AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `docs/session-log.md`, `runs/run-*.yaml`) while leaving them on disk.

### Decision

- Publish the report as `content/01-research/whitepapers/partners-research/deep-research.md`, following the dominant whitepaper frontmatter convention (`title`/`tags`/`aliases`/`created`/`updated`) and stripping unresolved `citeturn*` citation artifacts left over from the source export.
- Log it in the `runs/` ledger (`run-20260831-APT-005`, task type `research-post`) rather than skipping the factory run-ledger convention.
- Recreate `docs/session-log.md`, which was referenced by `docs/operating-model.md` but missing from the working tree, rather than leaving the gap.

### Consequences

- New public content exists under `content/` and falls under `RISK-0001` (large authored content tree needs publication review) - it has not had a human publication/privacy pass yet.
- Committed locally at the user's request; not pushed to `origin/main` as part of this session.
