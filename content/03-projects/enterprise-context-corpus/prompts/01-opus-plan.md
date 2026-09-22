# Opus Planning Prompt

You are the principal architect and experiment designer for a 2–3 week prototype named **Enterprise Context Corpus / Strategy Workbench**.

Your job is to produce the implementation plan, not implementation code.

Read in full:

- `README.md`
- `docs/context-pack.md`
- `docs/validation-plan.md`

## Mission

Design the smallest credible implementation that can test the following hypotheses:

1. Organisational and architecture intent can be represented in a small machine-readable authoritative corpus.
2. Task-specific context compilation can outperform naive document retrieval for architecture-sensitive engineering tasks.
3. Declared architecture intent can be compared against observed technical evidence without generating unacceptable false positives.
4. Aegis can provide advisory assurance over those findings.
5. The same underlying corpus can support both agent context and a human Strategy Workbench.

## Constraints

- 2–3 week prototype.
- Enterprise AWS / Bedrock environment.
- One monorepo.
- Prefer one deployable backend initially.
- Git-backed YAML/JSON/Markdown corpus.
- Do not start with Neptune.
- Do not start with GraphRAG.
- Do not start with a large agent framework.
- Do not start with a graph database unless an eval later proves it necessary.
- Aegis is advisory only.
- Deterministic logic before LLM logic wherever practical.
- Evaluation fixture and regression tests precede UI polish.
- The design must be able to fail cheaply.

## Required output

Produce a concrete plan containing:

### 1. Architecture
Describe:
- packages;
- dependencies;
- runtime boundaries;
- data flow;
- source-of-truth boundaries;
- which capabilities are deterministic vs model-assisted.

### 2. Initial schema
Propose a minimal v0.1 schema for:
- StrategyChoice;
- BusinessCapability;
- System;
- Platform;
- ArchitectureIntent;
- ArchitectureDecision;
- Standard;
- Evidence;
- Observation;
- Exception;
- ArchitectureDebt;
- AssuranceFinding;
- Assertion.

Do not over-model.

### 3. Fixture design
Define the exact tiny domain fixture to use.

It must include:
- conformant cases;
- true divergences;
- approved exceptions;
- transition states;
- unknown information;
- contradictory evidence.

### 4. Evaluation suite
Define 20–30 golden questions/cases.

For each class specify:
- what is tested;
- expected answer/path;
- objective scoring method.

### 5. Implementation phases
Break work into bounded phases of no more than 1–2 days.

Each phase must state:
- hypothesis;
- deliverable;
- tests;
- gate;
- stop/redirect condition.

### 6. Context compiler design
Define:
- input contract;
- required slots;
- applicability;
- traversal;
- unstructured evidence retrieval;
- ranking;
- token budget;
- provenance output.

### 7. Architecture intelligence
Define how to compare:
- declared intent;
- observed evidence;
- exceptions;
- transition state.

Use conservative classification.

### 8. Aegis boundary
Define exactly what Aegis does and does not do.

### 9. Workbench
Define the minimum UI needed for the final demonstration.

Do not allow UI to become the project.

### 10. Open questions
Explicitly identify choices that should remain unresolved until eval evidence exists.

### 11. Risk register
Rank the top technical and conceptual risks.

### 12. First 48 hours
End with a precise sequence of tasks for the first two days.

## Planning discipline

Every proposed dependency must answer:

> What hypothesis does this dependency help us test?

Every proposed AI call must answer:

> Why can deterministic logic not do this reliably enough?

Every proposed infrastructure component must answer:

> What benchmark result would justify adding this?

Challenge the context pack where appropriate. Do not simply restate it.

The plan should make it difficult for the implementation agents to accidentally build a polished but scientifically uninformative prototype.
