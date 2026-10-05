# Opus Planning Prompt — Strategy Golden Source

Act as principal architect and experiment designer.

Read:
- `docs/context-pack.md`
- `docs/research-findings.md`
- `docs/open-design-questions.md`

Design the smallest useful implementation for a Git-native, agent-first strategy corpus containing:
1. AI Organisation Strategy
2. Platform Strategy
3. Platform Engineering Operating Model Strategy

## Constraints

- Git is authoritative.
- Claude Code and GitHub Copilot are the model/runtime layer.
- No direct LLM API integration.
- No vector DB.
- No graph DB.
- No bespoke chat UI.
- No MCP unless experiments later justify it.
- No two-way Confluence sync.
- Derived files never become canonical.
- AI canonical updates require explicit review.
- Deterministic scripts handle validation, compiling and straightforward traversal.
- Use portable Agent Skills.
- Build/evaluate corpus before rich UI.

## Hypotheses

1. Markdown + light metadata is pleasant enough to author.
2. Explicit strategy relationships improve cross-strategy reasoning.
3. A deterministic compiler adds value without database plumbing.
4. Claude Code can be the deep interactive interface.
5. Unsupported questions can be correctly classified into evidence gaps, decisions, conflicts, stale data or out-of-scope.
6. One source can create useful Confluence and HTML projections.

## Required output

1. Exact MVP repo scaffold: create-now vs defer.
2. Corpus schema v0.1 with examples.
3. Three-strategy evaluation fixture with:
   - 3+ choices each
   - shared capabilities
   - shared assumptions
   - cross-strategy dependency
   - contradiction
   - missing evidence case
   - open decision.
4. 15–25 golden questions with expected paths/statuses.
5. Compiler v0.1 contract:
   - manifest
   - entity index
   - relations
   - inverse links/backlinks
   - graph JSON
   - strategy map
   - unresolved refs
   - question index
   - context bundle
   - llms.txt.
6. Deterministic audit contract vs semantic agent audit.
7. `AGENTS.md`, `CLAUDE.md`, Copilot instructions design.
8. Initial skills:
   - ask-strategy
   - challenge-strategy
   - author-strategy
   - audit-corpus
   - triage-questions
   - executive-preread
   - publish-html
   - publish-confluence.
9. Question/gap proposal and approval loop.
10. One-day Quartz vs custom HTML spike.
11. Confluence publishing spike and exit criteria.
12. Security/permission considerations.
13. 1–2 day implementation phases, each with:
    - hypothesis
    - output
    - eval
    - pass criterion
    - kill/redirect criterion.
14. Explicit decisions to postpone.
15. Exact first 48-hour sequence.

## Planning discipline

Do not design a platform.
Do not create an enterprise ontology.
Do not assume graphs help — prove it.
Do not make every sentence an object.
Do not use model reasoning for deterministic validation.
Do not build HTML before golden questions work.
Do not couple the corpus to one AI host.
Optimise for fast learning and easy deletion of failed ideas.
