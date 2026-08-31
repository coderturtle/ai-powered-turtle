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

## 2026-08-31 (later same day) - Merge partners-research branch; add platform-operating-model whitepaper

Status: Accepted

### Context

The user approved merging `agent/claude/partners-research-whitepaper` and asked for a second deep-research report (`~/Downloads/deep-research-report-6.md`, on federated/agentic platform-engineering operating models) to be added as a new `platform-operating-model` whitepaper on a fresh branch, plus general tidy-up so it renders correctly.

### Decision

- Merged the partners-research branch into local `main` (commit `b289c50`) and deleted the branch. Left `main` unpushed: `.github/workflows` deploys the public site on push to `main`, and `.hekton/governance.yaml` marks `public_release`/`deployment_changes` as `human_required`, so pushing is a separate decision from merging locally.
- Added `content/01-research/whitepapers/platform-operating-model/deep-research.md` on `agent/claude/platform-operating-model-whitepaper`, following the same frontmatter convention and citation-token cleanup as the partners-research whitepaper (96 tokens stripped this time).
- Validated rendering with an actual `quartz build` (not just a Markdown read-through) into a scratch directory, then discarded the build output.

### Consequences

- `main` is 2 commits ahead of `origin/main`, unpushed pending an explicit publish decision.
- `agent/claude/platform-operating-model-whitepaper` is committed but not yet merged - awaiting the same kind of explicit merge approval the partners-research branch got.
- Both new whitepapers remain covered by `RISK-0001` until a human publication/privacy pass happens.

## 2026-08-31 (later same day) - Push main and merge the platform-operating-model PR; both whitepapers go live

Status: Accepted

### Context

User explicitly asked to PR and push "as both should go live" - i.e. both the partners-research whitepaper (already merged locally into `main`) and the platform-operating-model whitepaper (still on its own branch) should be published.

### Decision

- Pushed local `main` (containing the partners-research merge, `b289c50`) directly to `origin/main` - a fast-forward push, not a GitHub PR, since that merge had already happened locally at the user's explicit request in the prior turn.
- Pushed `agent/claude/platform-operating-model-whitepaper` and opened GitHub PR #34 (`coderturtle/ai-powered-turtle`) for it, matching this repo's established convention (its git history is almost entirely "Merge pull request #N" commits) rather than another local merge.
- Merged PR #34 (`gh pr merge --merge --delete-branch`) on the user's explicit go-live instruction, then fast-forwarded local `main` and deleted the local branch.
- Both pushes triggered `.github/workflows` "Deploy Quartz site to GitHub Pages"; both runs completed successfully (verified via `gh run watch`).
- Used `gh auth switch` to the `coderturtle` account for the push/PR/merge operations (this machine's default `gh` account is `dermdunc`), then switched back afterwards to avoid leaving global `gh` state changed.

### Consequences

- Both whitepapers are now live at https://coderturtle.github.io/ai-powered-turtle/.
- `RISK-0001` (content publication/privacy review) is now retrospective rather than pre-publication for these two files - tracked in `docs/next-actions.md`.
- No open branches remain from this work; `main` is in sync with `origin/main`.
