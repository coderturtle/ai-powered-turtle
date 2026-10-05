# Research Findings

## Conclusion

No single mature open-source project exactly implements an agent-native strategy corpus, but several projects provide strong, compatible patterns. The opportunity is to combine proven ideas rather than invent a new platform.

## AgentDocs — strongest compiler precedent

https://github.com/SomneelSaha2042/AgentDocs

AgentDocs is a deterministic, local-first compiler and auditor for agent-readable documentation. It leaves source documents untouched and creates a separate generated layer containing `AGENTS.md`, `llms.txt`, typed maps, indexes, freshness state, task packs and readiness reports.

**Borrow:** source-vs-derived separation, deterministic compilation, freshness, source coverage, evidence-linked generated artifacts, optional future read-only MCP.

**Do not:** fork its coding-documentation ontology.

## Yurtle — closest lightweight semantic Markdown pattern

https://github.com/Congruentsys/yurtle

Yurtle combines human-readable Markdown with YAML frontmatter, stable IDs and explicit relationships, then treats those files as a graph without requiring a database.

**Borrow:** frontmatter + prose, stable IDs, explicit edges, graph as a derived view.

**Caution:** small/experimental project; use as design inspiration rather than a core dependency.

## Backstage Catalog — mature Git-as-source precedent

https://github.com/backstage/backstage

Backstage models entities and relations from repository-owned metadata and explicitly recommends Git/YAML as the primary source while the catalog acts as a cache/view.

**Borrow:** GitOps source of truth, entity refs, typed relations, model useful human concepts rather than everything.

## Quartz — rich static publishing candidate

https://github.com/jackyzha0/quartz

Quartz v5 turns Markdown into a static site with graph views, backlinks, search and link previews.

**Use:** one-day candidate spike for the executive/static HTML projection.

**Do not:** bend the canonical corpus around Quartz conventions.

## Foam / SilverBullet — durable Markdown knowledge-network patterns

https://github.com/foambubble/foam
https://github.com/silverbulletmd/silverbullet

Both reinforce the idea that Markdown should remain durable truth while backlinks, graphs, queries and publishing sit above it.

**Borrow:** portability, backlinks, source durability.

## LikeC4 / Structurizr — architecture projections

https://github.com/likec4/likec4
https://github.com/structurizr/structurizr

Both show how one machine-readable model can generate multiple architecture views.

**Use:** optional future projection targets for architecture-related portions of strategy.

**Do not:** make either architecture DSL the canonical strategy schema.

## MADR — decision-as-code precedent

https://github.com/adr/madr

MADR captures decision context, alternatives, outcome and consequences in Markdown.

**Borrow:** decision object shape.

## TRACE — living document + question loop

https://github.com/shandar/trace

TRACE captures decisions, assumptions and open questions from Claude Code work, stages proposals and requires review before updating the canonical living PRD.

**Borrow:** questions as first-class objects, staged proposals, explicit review before canonical mutation.

**Do not:** adopt its hook/API runtime; this project intentionally avoids direct model plumbing.

## Assumptions — evidence-backed assumption ledger

https://github.com/Teycir/Assumptions

A lightweight Claude skill that records assumptions, evidence, failure impact and falsification tests.

**Borrow:** every material strategy assumption should say what must be true, what supports it and what would disprove it.

## PM OS — closest repo-as-operating-system example

https://github.com/agentmart/pm-os

PM OS combines a repository context library, strategy skills, reviewer agents, GitHub Copilot instructions and Claude Code workflows.

**Borrow:** context-library + repo-local skills + specialist reviewers.

**Do not:** copy its product-management ontology wholesale.

## Anthropic Agent Skills / Claude Code examples

https://github.com/anthropics/skills
https://github.com/anthropics/claude-code-playground

Skills are self-contained `SKILL.md` directories with optional scripts, references, examples and assets, using progressive disclosure.

**Use:** standard shape for `ask-strategy`, `challenge-strategy`, `audit-corpus`, `publish-html`, `publish-confluence`, `executive-preread`, etc.

## GitHub Awesome Copilot + native Copilot customization

https://github.com/github/awesome-copilot

Current Copilot supports:
- `.github/copilot-instructions.md`
- path-specific `.github/instructions/*.instructions.md`
- `AGENTS.md`
- custom agents
- Agent Skills under `.github/skills`, `.claude/skills`, or `.agents/skills`

This makes a single repo viable for both Claude Code and Copilot.

## llms.txt — generated machine entry point

https://github.com/AnswerDotAI/llms-txt

A concise Markdown map to important content for LLMs/agents.

**Use:** generated navigation artifact, not source of truth.

## Confluence publishers — Git-to-Confluence precedent

https://github.com/pipewell/confluence-publisher
https://github.com/Workable/confluence-docs-as-code
https://github.com/YouSysAdmin/md2confluence

These demonstrate one-way docs-as-code publication from Git to Confluence.

**Recommendation:** Git is authoritative; Confluence is distribution. Evaluate an approved internal publisher rather than writing one first.

# Overall research conclusion

The reusable architecture is:

1. Human-readable Markdown source.
2. YAML frontmatter with stable IDs and typed relationships.
3. Deterministic compiler producing indexes, graph, backlinks, context caches and `llms.txt`.
4. Repo-local instructions and Agent Skills.
5. Natural-language interaction through Claude Code/Copilot.
6. One-way Confluence and static HTML publishing.
7. Unsupported questions become reviewed gap/decision proposals.

What is novel is the application to strategy, not the underlying plumbing.
