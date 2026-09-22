# Validation Plan

## Principle

Build the evaluation fixture before building the application.

Every major technical addition should need to prove measurable value over a simpler baseline.

---

## 1. Evaluation fixture

Create one tiny but adversarial domain.

Example:

```text
CAPABILITY
Customer Authentication

SYSTEMS
Customer Portal
Adviser Portal
Legacy Account Service

PLATFORM
Enterprise Identity Platform

STRATEGY
Consume enterprise platform capabilities

INTENT
Customer auth uses Enterprise Identity

ADR
Adopt Enterprise Identity

STANDARD
OIDC integration standard

OBSERVATION
Customer Portal uses Enterprise Identity

OBSERVATION
Adviser Portal uses local authentication

EXCEPTION
Legacy Account Service has migration waiver

DEBT
None initially classified
```

Seed contradictions, missing information and stale evidence deliberately.

---

## 2. Golden questions

Create ~24 questions before implementation.

### Direct factual
- Who owns System X?
- Which capability does System X implement?

### Relationship
- What systems depend on Platform Y?

### Why / rationale
- Why is System X expected to use Platform Y?

### Multi-hop
- Which strategic choice resulted in the identity standard applying to System X?

### Intent vs reality
- Does System X currently appear consistent with architecture intent?

### Exception
- Why isn't Legacy System Z being flagged?

### Unknown
- Which database does System X use?

Correct answer: **Unknown**

### Contradiction
Provide two disagreeing evidence sources.

Correct answer: **Evidence conflicts**

### Context compilation
- Produce the minimum context needed for an agent modifying authentication in System X.

### Challenge
- What evidence would weaken the recommendation to use Platform Y?

---

## 3. Eval contract

Each eval should define expected entities and prohibited claims.

```yaml
id: EVAL-017

question: >
  Why should Customer Portal use Enterprise Identity?

required_entities:
  - SYSTEM-CUSTOMER-PORTAL
  - CAPABILITY-AUTH
  - INTENT-IDENTITY

required_evidence:
  - ADR-004
  - STRATEGY-CHOICE-002

expected_path:
  - CustomerPortal
  - CustomerAuthentication
  - IdentityIntent
  - StrategyChoice

must_not_claim:
  - migration-complete
```

---

## 4. Validation pyramid

### Layer 0 — Schema

Checks:
- every object validates;
- IDs are unique;
- relation targets exist;
- required owners exist.

Target: **100% deterministic pass**

### Layer 1 — Provenance

Checks:
- every observed assertion has evidence;
- every derived finding links to inputs;
- every finding can explain its origin.

Target: **100% provenance for findings**

### Layer 2 — Retrieval

Metrics:
- context precision;
- context coverage.

### Layer 3 — Context compilation

Checks:
- mandatory slots are populated;
- irrelevant content is excluded;
- token use is measured.

### Layer 4 — Architecture reasoning

Checks:
- intent matched correctly;
- transition states recognised;
- exceptions applied.

### Layer 5 — Assurance

Checks:
- seeded divergences detected;
- valid exceptions not flagged;
- unknown cases not overclassified.

### Layer 6 — Generation

Only after the above:
- correctness;
- faithfulness;
- citations;
- clarity.

### Layer 7 — Human experience

Can a stakeholder use it without the author guiding every step?

---

## 5. Baselines

Always compare against simpler alternatives.

### Baseline A
Plain authoritative Markdown.

### Baseline B
Bedrock Managed Knowledge Base over documents.

### Candidate C
Structured corpus + context compiler + Managed KB evidence.

### Candidate D
Structured corpus + graph-assisted retrieval.

If C does not outperform B, question why C exists.

If D does not materially improve the multi-hop subset, do not add a graph database.

---

## 6. Gates

### Gate 0 — Domain model

When: Day 1–2

Pass if:
- fixture fits naturally;
- relationships are expressive;
- declared/observed/derived stay distinct;
- very few schema escape hatches are needed.

If not: fix the model before infrastructure.

### Gate 1 — Structure alone

When: Day 2–4

Answer at least 10 golden questions with deterministic code only.

Pass if most factual, relationship, provenance and applicability questions work without an LLM.

If not: do not hide the modelling problem with RAG.

### Gate 2 — Compiled context vs naive context

Compare:
- whole docs / conventional retrieval;
- compiled structured context.

Measure:
- fact coverage;
- irrelevant context;
- tokens;
- answer correctness;
- citation correctness.

Pass if compiled context materially improves coverage or achieves equivalent quality with materially fewer tokens.

### Gate 3 — Need for GraphRAG

Compare:
1. Managed KB
2. Agentic Retrieval
3. structured traversal
4. GraphRAG only if required

Add GraphRAG only if simpler approaches repeatedly fail on multi-hop questions.

### Gate 4 — Drift detection trust

Seed approximately:
- 5 conformant implementations;
- 5 real divergences;
- 3 approved exceptions;
- 2 transition states;
- 3 unknown cases.

Focus heavily on false positives.

Initial output remains **potential divergence**, not violation.

### Gate 5 — Engineering agent benefit

Give the same task to:
- repo/task only;
- normal RAG context;
- compiled architecture context.

Score:
- preservation of intent;
- platform choice;
- constraints followed;
- prohibited pattern avoided;
- unknowns surfaced instead of invented.

This is the key proof that context compilation has value beyond documentation.

### Gate 6 — Aegis shadow mode

No enforcement.

```text
Finding generated
       ↓
Human review
       ↓
Correct / incorrect
       ↓
Regression dataset
```

Every false positive becomes a test.

### Gate 7 — Human Workbench

Give 3–5 stakeholders tasks, not opinion questions.

Examples:
- What are the three strategic choices?
- Which assumption is least supported?
- Why was the federated model selected?
- What would cause the recommendation to change?
- Which system currently diverges from intent?

Measure:
- time to answer;
- accuracy;
- failed navigation;
- unanswered questions.

---

## 7. Failure taxonomy

Every failure should be classified:

```text
SCHEMA
SOURCE
INGESTION
IDENTITY
RETRIEVAL
APPLICABILITY
CONTEXT
REASONING
GENERATION
POLICY
STALE
AUTH
```

Do not treat every failure as “the model got it wrong”.

---

## 8. Three-week rhythm

### Days 1–2
- fixture;
- schema;
- golden questions;
- expected paths;
- drift cases;
- expected context bundles.

Run Gate 0.

### Days 3–4
- entity loader;
- validation;
- ID resolution;
- traversal;
- provenance;
- basic bundles.

Run Gate 1.

### Day 5
- one architecture projection;
- Structurizr or LikeC4;
- no more than one day of effort.

### Days 6–7
- Bedrock KB baseline;
- retrieval evals.

### Days 8–9
- structured corpus + evidence;
- context compiler v0.1.

Run Gate 2.

### Day 10
- hard multi-hop cases.

Run Gate 3.

### Days 11–12
- one observed-state adapter;
- intent-vs-observation comparison.

Run Gate 4.

### Day 13
- Aegis advisory rules.

Run Gate 6.

### Days 14–15
- build the Workbench only around capabilities that already passed;
- run human evaluation.

Run Gate 7.
