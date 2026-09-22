# Enterprise Context Corpus Starter Pack

This pack is designed to bootstrap a 2–3 week internal prototype exploring:

- a reusable enterprise context corpus;
- machine-readable architecture intent;
- context compilation for humans and AI agents;
- architecture drift / debt detection;
- evidence and provenance;
- advisory assurance through Aegis;
- a Strategy Workbench as the first human-facing experience.

## Recommended agent split

### Opus
Use for:
- architecture planning;
- schema design;
- experiment design;
- critical review;
- deciding when to add infrastructure or split components.

### Sonnet
Use for:
- implementation;
- tests;
- adapters;
- UI;
- deterministic corpus tooling;
- context compiler;
- architecture intelligence;
- Aegis advisory rules.

### Haiku
Use for:
- narrow deterministic edits;
- test fixtures;
- schema examples;
- documentation cleanup;
- repetitive conversions;
- simple validation scripts;
- low-risk refactors.

## Important rule

Do **not** start by building the Workbench UI, Neptune integration, GraphRAG, or a generic agent framework.

The first milestone is an evaluation fixture and a small authoritative corpus.

The prototype should attempt to disprove the architecture hypothesis through small experiments.

## Suggested execution sequence

1. Read `docs/context-pack.md`
2. Read `docs/validation-plan.md`
3. Run `prompts/01-opus-plan.md`
4. Review and amend the plan
5. Run `prompts/02-sonnet-bootstrap.md`
6. Use `prompts/03-sonnet-implementation-loop.md` for each bounded implementation phase
7. Use `prompts/04-haiku-small-task.md` for narrow deterministic work
8. Run `prompts/05-opus-critical-review.md` at major gates
9. Do not add graph infrastructure until the retrieval/context evals justify it

## Core hypothesis

The working architecture is:

Organisational intent
→ machine-readable context
→ task-specific context compilation
→ execution
→ observed evidence
→ assurance
→ updated organisational understanding

The most important reusable capability may be the **context compiler**, not the Strategy Workbench itself.
