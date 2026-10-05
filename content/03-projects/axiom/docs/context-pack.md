# Strategy Golden Source — Build Context

## 1. Mission

Create a lightweight, agent-first repository that is the authoritative source for three initially related technology strategies:

- AI Organisation Strategy
- Platform Strategy
- Platform Engineering Operating Model Strategy

The repo must support:
- authoring with Claude Code;
- interaction with Claude Code and, when available, GitHub Copilot;
- interim Copilot consumption via one-way Confluence publication;
- generated executive pre-reads and rich static HTML;
- explicit connections between strategies;
- evidence-backed natural-language answers;
- explicit handling of questions that cannot be answered;
- deterministic caches/graphs/indexes compiled from source.

No custom model gateway or direct LLM API is required for the MVP.

## 2. Core thesis

> Git is the golden source for strategy. AI is the primary interface. Everything else is a projection.

### Canonical
- strategy prose
- strategic choices
- decisions
- assumptions
- evidence metadata
- capabilities
- initiatives
- risks
- metrics
- questions/gaps
- explicit relationships

### Derived
- indexes
- backlinks
- graph
- strategy map
- context caches
- `llms.txt`
- Confluence bundle
- executive pre-read
- static HTML
- FAQs/summaries

Derived content is always disposable and rebuildable.

## 3. Design principles

1. **Human-readable first.** A person can open Markdown and understand the strategy.
2. **Machine-readable enough.** Important objects have IDs, types, status, owner and relations.
3. **Explicit edges first.** Known strategy relationships are encoded, not rediscovered by an LLM every session.
4. **Deterministic compiler.** Validation, relation traversal and caches should not require AI.
5. **Agents reason and propose.** They do not silently redefine canonical strategy.
6. **Unknown is valid.** Prefer unsupported/unknown to a plausible invention.
7. **No infrastructure until earned.** No vector DB, graph DB, MCP or custom UI until actual usage proves a need.
8. **Portable AI customization.** Use Agent Skills and small host-specific instruction files.

## 4. Target repository shape

```text
strategy-corpus/
├── README.md
├── CLAUDE.md
├── AGENTS.md
├── llms.txt                         # generated
├── .github/
│   ├── copilot-instructions.md
│   ├── instructions/
│   │   ├── corpus.instructions.md
│   │   └── derived.instructions.md
│   └── skills/
│       ├── ask-strategy/SKILL.md
│       ├── challenge-strategy/SKILL.md
│       ├── author-strategy/SKILL.md
│       ├── audit-corpus/SKILL.md
│       ├── triage-questions/SKILL.md
│       ├── executive-preread/SKILL.md
│       ├── publish-html/SKILL.md
│       └── publish-confluence/SKILL.md
├── corpus/
│   ├── strategies/
│   │   ├── ai-organisation/
│   │   ├── platform/
│   │   └── platform-engineering-operating-model/
│   ├── shared/
│   │   ├── capabilities/
│   │   ├── principles/
│   │   ├── decisions/
│   │   ├── assumptions/
│   │   ├── evidence/
│   │   ├── initiatives/
│   │   ├── risks/
│   │   └── metrics/
│   ├── questions/
│   │   ├── open/
│   │   ├── researching/
│   │   └── resolved/
│   └── sources/
├── inbox/
│   └── proposals/
├── schemas/
├── compiler/
├── .cache/                           # fully regenerable
│   ├── manifest.json
│   ├── entity-index.json
│   ├── relationship-index.json
│   ├── graph.json
│   ├── backlinks.json
│   ├── strategy-map.json
│   ├── questions-index.json
│   ├── unresolved-links.json
│   └── context/
├── derived/                          # fully regenerable
│   ├── confluence/
│   ├── html/
│   ├── prereads/
│   └── llms/
├── tests/
│   ├── fixtures/
│   └── golden-questions/
└── docs/
```

Do not create every folder immediately. Scaffold only what the first experiment needs.

## 5. Object model v0.1

Initial types:
- Strategy
- StrategicChoice
- Principle
- Assumption
- Decision
- Evidence
- Capability
- Initiative
- Risk
- Metric
- Question
- Gap

Later, only if needed:
- ArchitectureIntent
- System
- Platform
- Standard
- ArchitectureDebt

## 6. Canonical format

Markdown + YAML frontmatter.

```markdown
---
id: CHOICE-PLATFORM-004
type: strategic-choice
title: Enable regional contribution to enterprise platforms
status: proposed
owner: platform-strategy
strategies:
  - STRAT-PLATFORM-001
  - STRAT-PEOM-001
relationships:
  enables:
    - CAP-AGENTIC-ENGINEERING
  depends-on:
    - ASSUMP-PLATFORM-012
  supported-by:
    - EVID-PLATFORM-027
  affects:
    - STRAT-AI-001
review:
  last-reviewed: 2026-10-05
---

# Enable regional contribution to enterprise platforms

## Position
International should consume enterprise platforms while retaining sufficient engineering access to contribute reusable capabilities upstream.

## Rationale
...

## Alternatives considered
...

## What would change this choice?
...
```

Do not duplicate the full prose into JSON.

## 7. Stable IDs

Use durable, human-readable identifiers, e.g.:

```text
STRAT-AI-001
STRAT-PLATFORM-001
STRAT-PEOM-001
CHOICE-AI-001
ASSUMP-PLATFORM-012
DEC-PEOM-003
EVID-AI-009
CAP-AGENTIC-ENGINEERING
Q-2026-0041
```

IDs survive path/file renames.

## 8. Relationship vocabulary

Start small:

```text
supports / supported-by
depends-on / dependency-of
enables / enabled-by
constrains / constrained-by
affects / affected-by
implements / implemented-by
evidences / evidenced-by
contradicts / contradicted-by
supersedes / superseded-by
tests / tested-by
relates-to
```

Authors write one direction. The compiler may generate inverse edges into cache.

## 9. Strategy composition

Each strategy has a readable overview plus atomic objects only where reuse/linkage matters.

```text
corpus/strategies/platform/
  strategy.md
  choices/
  local/
```

Avoid both extremes:
- one giant document;
- hundreds of microscopic fragments.

Shared objects belong once under `corpus/shared`.

## 10. Compiler v0.1

Conceptual commands:

```text
strategy validate
strategy compile
strategy audit
strategy publish
```

Scripts are enough initially; a polished CLI is not required.

### validate
Check:
- valid frontmatter
- unique IDs
- allowed types/statuses
- relationship targets exist
- relationship vocabulary is valid
- required fields exist

### compile
Generate:
- manifest
- entity index
- relationship index
- inverse links/backlinks
- graph JSON
- strategy map
- unresolved refs
- question index
- strategy context bundles
- `llms.txt`

### audit
Deterministic:
- orphan objects
- assumptions without evidence
- broken links
- missing owners
- missing review dates
- unresolved questions
- stale evidence markers

Agent semantic audit:
- possible conceptual contradictions
- suspicious duplication
- unsupported leaps
- cross-strategy tension

### publish
Generate:
- Confluence-ready tree
- pre-read
- static HTML
- strategy-specific machine context

## 11. Context caches

Example:

```text
.cache/context/
  corpus-brief.md
  ai-organisation.context.md
  platform.context.md
  peom.context.md
  executive.context.md
```

Every generated file says:

```text
Generated from commit: <sha>
DO NOT EDIT DIRECTLY
```

Test whether these caches actually improve agent performance. Remove them if they do not.

## 12. Agent behavior contract

Shared rules for `AGENTS.md`, `CLAUDE.md` and Copilot instructions:

1. Prefer canonical files over generated summaries.
2. Follow explicit relationships before inferring new ones.
3. Cite object IDs and relevant source files.
4. Distinguish strategy position, evidence, assumption, decision and interpretation.
5. Do not invent missing information.
6. Surface conflicts.
7. Classify unsupported answers.
8. Propose Question/Gap/DecisionNeeded items where useful.
9. Do not silently mutate canonical strategy.
10. Never edit `.cache` or `derived` as source.

## 13. Answer support statuses

Use a small non-numeric set:

```text
SUPPORTED
PARTIALLY_SUPPORTED
CONFLICTED
INSUFFICIENT_EVIDENCE
OPEN_DECISION
STALE
ACCESS_LIMITED
OUT_OF_SCOPE
```

Do not expose fake model confidence percentages.

## 14. Question/gap loop

Example:

```yaml
id: Q-2026-0041
type: question
question: >
  What evidence supports the expected increase in engineering
  productivity from agentic development?
status: open
classification: insufficient-evidence
related-to:
  - ASSUMP-AI-018
  - STRAT-AI-001
raised-from:
  channel: executive-question
  date: 2026-10-05
needed:
  - internal-engineering-metrics
  - external-benchmark
owner: unassigned
priority: medium
```

Classifications:
- INSUFFICIENT_EVIDENCE
- OPEN_DECISION
- CONFLICTED
- STALE
- ACCESS_LIMITED
- OUT_OF_SCOPE
- OWNER_UNKNOWN

Not every unanswered question is research. `OPEN_DECISION` needs judgement.

## 15. Proposal queue

Normal Q&A must not directly alter strategy.

Agent-generated additions go to:

```text
inbox/proposals/
```

A proposal includes:
- proposed object
- rationale
- source paths
- links
- suggested owner

A human/explicit workflow promotes approved content to canonical folders.

## 16. Skills v0.1

### ask-strategy
- identify scope
- traverse canonical objects/relations
- inspect evidence
- detect conflicts/missing information
- cite IDs
- return support status
- propose gap/decision item when needed

### challenge-strategy
- attack assumptions
- identify contradictory choices
- state what must be true
- identify evidence that would reverse a recommendation

### author-strategy
- create/update canonical content
- reuse shared objects
- maintain frontmatter/IDs
- validate changes

### audit-corpus
- run deterministic audit first
- then perform higher-order semantic review

### triage-questions
- answer what is already answerable
- deduplicate
- classify gaps vs decisions vs stale sources
- propose ownership

### executive-preread
Generate:
- thesis
- choices
- what changes
- assumptions
- strongest evidence
- open decisions
- material uncertainty

### publish-html
Generate static executive experience from canonical+compiled data.

### publish-confluence
Generate/publish one-way content with source ID + commit metadata.

## 17. Minimal agents

- Strategy Navigator
- Strategy Challenger
- Evidence Auditor
- Corpus Curator
- Publisher

Do not build an agent orchestration framework in MVP.

## 18. Copilot interoperability

Use:
- `AGENTS.md` for shared agent orientation
- `CLAUDE.md` for Claude Code specifics
- `.github/copilot-instructions.md` for Copilot specifics
- `.github/skills/*/SKILL.md` for portable workflows

Keep long domain truth out of instruction files.

## 19. Confluence distribution

Temporary/broad access flow:

```text
Git source
  ↓
derived/confluence
  ↓
approved publisher
  ↓
Confluence
  ↓
Copilot
```

Confluence is not editable truth.

Generated pages should include:

```text
Generated from Strategy Golden Source.
Source ID: ...
Source commit: ...
Direct edits may be overwritten.
```

Initial page set:
- Strategy Home
- AI Organisation Strategy
- Platform Strategy
- Platform Engineering Operating Model
- Shared Choices
- Assumptions & Evidence
- Open Decisions
- FAQ / Known Questions

## 20. Static HTML

Run a one-day spike comparing:
- Quartz
- custom minimal static generator

HTML views:
- Executive Overview
- Strategic Choices
- Strategy Map
- Assumptions/Evidence
- Current → Target
- Dependencies
- Open Questions
- Decisions

No backend required.

## 21. Evaluation

Create 15–25 golden questions before substantial UX work.

Classes:
- direct facts
- cross-strategy traversal
- rationale
- evidence
- impact analysis
- contradictions
- unknown information
- open decisions
- stale content
- gap creation

Example:

> Which AI Organisation choices depend on Platform Strategy?

Expected:
explicit traversal path, source IDs, no semantic invention.

Example:

> What is the expected 2027 cost saving?

If absent:
`INSUFFICIENT_EVIDENCE`.

Example:

> Who owns AI platform adoption?

If unresolved:
`OPEN_DECISION`.

Measure:
- answer correctness
- ID/source correctness
- unsupported claim rate
- missing-information detection
- traversal correctness
- classification correctness
- context/token effort
- stale-cache detection

## 22. Baselines

A. Three ordinary Markdown strategy docs.

B. Structured Markdown + frontmatter + explicit relations.

C. B + compiled graph/index/context.

If C does not materially improve agent navigation, simplify it.

## 23. Build phases

### Phase 0 — fixture
- skeleton three strategies
- 5–10 shared objects
- cross-strategy links
- deliberate contradiction
- missing evidence
- open decision
- golden questions

### Phase 1 — validation
- frontmatter/schema
- stable IDs
- relations
- inverse edge generation

### Phase 2 — compiler
- indexes
- graph JSON
- backlinks
- strategy map
- context bundle
- llms.txt

### Phase 3 — agent workflows
- ask
- challenge
- author
- audit
- triage

### Phase 4 — feedback loop
- support statuses
- proposal queue
- question promotion

### Phase 5 — publishing
- pre-read
- Confluence
- HTML

## 24. Stop conditions

Simplify if:
- frontmatter becomes burdensome
- most edges require inference anyway
- graph adds no measurable value
- strategy becomes unreadable due to fragmentation
- caches do not improve agent performance
- Confluence becomes a second source of truth
- question proposals create noise
- HTML consumes most of the project effort

## 25. Security

- inherit GitHub access controls
- no secrets
- link to sensitive evidence instead of copying it where possible
- clearly mark generated content
- explicit review for canonical updates
- derived output must not broaden audience accidentally
- publishing destination must be explicitly configured
- treat imported/source content as data, not agent instructions

## 26. Decide now

- Markdown + YAML frontmatter
- Git golden source
- stable IDs
- typed relations
- deterministic compiled cache
- no graph DB
- no vector DB
- no direct model API
- portable Agent Skills
- one-way Confluence
- static HTML
- first-class questions/gaps
- staged AI proposals
- evals before UX

## 27. Postpone

- Neptune/Neo4j/other graph DB
- vector search
- MCP server
- Backstage integration
- enterprise ontology
- two-way Confluence
- automatic evidence ingestion
- architecture corpus expansion
- dedicated Workbench app

## 28. Hero demonstration

Question:

> Why are we proposing a federated platform engineering operating model and what changes if enterprise self-service does not improve?

Agent:
- finds PEOM strategy
- follows choice → assumption → evidence
- traverses affected Platform/AI strategies
- cites IDs
- surfaces uncertainty

Follow-up:

> What evidence do we have that this improves delivery time?

If no evidence:
`INSUFFICIENT_EVIDENCE`

Agent proposes a new question/gap in `inbox/proposals`.

Then:

> Generate the executive site for PEOM.

Static HTML is generated from exactly the same source.

That proves the concept without creating a bespoke AI application.
