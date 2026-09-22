# Lightweight Intent-Driven Development (IDD)
## Context Pack for Enterprise Internal Use

**Purpose:** Portable intent-driven development protocol for teams using Claude Code, Copilot or similar AI-assisted development without requiring Hekton.

**Design goal:** Make AI-assisted software delivery safer, clearer and more repeatable by giving humans and agents a small machine-readable contract describing:
- the intended outcome;
- why it matters;
- constraints that must remain true;
- non-goals;
- relevant architecture intent;
- acceptance criteria;
- required evidence.

IDD is a protocol, not an orchestration platform.

Hekton may later automate IDD, but IDD must remain independently usable.

---

# 1. Core proposition

Before asking an AI system to modify software, give it explicit intent.

A minimal IDD workflow should answer:

1. What outcome are we trying to achieve?
2. Why?
3. What must remain true?
4. What are we deliberately not doing?
5. What architecture, standards or controls apply?
6. How will we know the change succeeded?
7. What evidence proves that?

The simplest expression is:

```text
Intent
  ↓
Context
  ↓
Plan
  ↓
Implement
  ↓
Verify
  ↓
Evidence
```

---

# 2. What IDD is not

IDD is not:

- a new SDLC platform;
- a replacement for engineering judgement;
- a workflow engine;
- a project-management framework;
- an agent framework;
- a new architecture repository;
- a requirements-management system.

It is a thin development contract and protocol that existing tools can consume.

---

# 3. Relationship to Hekton

Use the same IDD contract at different maturity levels.

```text
Tier 0 — Human
Developer reads intent and implements manually.

Tier 1 — AI-assisted
Claude Code / Copilot receives intent + repo context.

Tier 2 — Agentic
Planner → implementer → reviewer.

Tier 3 — Hekton
Orchestrated planning, routing, loops, evidence, evals and recovery.
```

IDD should work identically at every tier.

---

# 4. Relationship to the Enterprise Context Corpus

IDD is a consumer of the context corpus.

The IDD contract contains local/task-specific intent.

The context compiler may enrich it with:

- system context;
- business capability;
- architecture intent;
- ADRs;
- standards;
- dependencies;
- exceptions;
- known debt;
- applicable controls.

Result:

```text
IDD Contract
     +
Compiled Enterprise Context
     +
Repository Context
     ↓
Implementation Agent
```

The IDD contract should not duplicate enterprise context unnecessarily.

---

# 5. Relationship to Aegis

IDD does not own governance.

Aegis evaluates evidence and controls.

```text
Intent
  ↓
Plan
  ↓
Build
  ↓
Verify
  ↓
Evidence
  ↓
Aegis
  ↓
Advisory finding
```

Initially Aegis remains advisory.

Examples:

- architecture intent considered;
- required evidence exists;
- applicable standard satisfied;
- potential architecture divergence;
- exception required;
- review required.

---

# 6. Core repository scaffold

For a lightweight implementation:

```text
/.intent
    current.yaml
    architecture.yaml
    decisions.md

/.idd
    evidence.yaml
    session.md

/evals
    acceptance/

/docs
    relevant project documentation
```

For a shared reusable package/repo:

```text
/idd
  /schemas
  /templates
  /skills
  /agents
  /examples
```

Do not require more structure until a real use case needs it.

---

# 7. The IDD Contract

The IDD contract is the central object.

Recommended structure:

```yaml
id: INTENT-001

title: Add enterprise identity authentication

outcome:
  statement: >
    Adviser Portal authenticates customers through the
    enterprise identity platform.

rationale:
  - remove duplicate authentication capability
  - align with target architecture

scope:
  systems:
    - adviser-portal
  capabilities:
    - customer-authentication

non_goals:
  - redesign customer registration
  - migrate unrelated identity flows

constraints:
  architecture:
    - INTENT-IDENTITY-001
  standards:
    - STD-OIDC-001
  security:
    - no local credential storage
  regulatory: []

acceptance:
  - id: AC-001
    statement: Users authenticate through Enterprise Identity.
    verification: integration-test

  - id: AC-002
    statement: No local credential store is introduced.
    verification: architecture-rule

  - id: AC-003
    statement: Existing login behaviour remains supported.
    verification: behavioural-test

context:
  required:
    - current-system
    - architecture-intent
    - relevant-adrs
    - applicable-standards
    - dependencies
    - known-exceptions

evidence:
  required:
    - tests
    - architecture-checks

risk:
  level: medium

status: READY
```

Keep the contract small.

---

# 8. Contract lifecycle

Suggested states:

```text
DRAFT
READY
PLANNED
IN_PROGRESS
VERIFYING
COMPLETE
BLOCKED
SUPERSEDED
```

Do not use workflow state as a substitute for project tracking.

The lifecycle exists mainly so humans and agents know whether intent is sufficiently defined to proceed.

---

# 9. Intent readiness gate

Before implementation begins, check:

- Is the outcome clear?
- Is scope bounded?
- Are non-goals explicit?
- Are important constraints present?
- Are acceptance criteria observable?
- Are required enterprise-context types specified?
- Is there a clear way to collect evidence?

If not, the planning agent should stop and surface the missing item.

---

# 10. Acceptance criteria

Acceptance should describe observable outcomes, not implementation steps.

Bad:

```text
Create AuthService class.
```

Better:

```text
Users authenticate through Enterprise Identity.
```

Implementation detail may change.

Intent should remain stable.

---

# 11. Verification types

Start with a small controlled vocabulary:

```text
unit-test
integration-test
behavioural-test
architecture-rule
security-scan
static-analysis
manual-review
runtime-observation
documented-evidence
```

Add types only when required.

---

# 12. Evidence model

Evidence should map directly to acceptance criteria.

Example:

```yaml
intent: INTENT-001

acceptance:
  AC-001:
    status: PASS
    evidence:
      - type: integration-test
        ref: test-enterprise-identity-login
        result: PASS

  AC-002:
    status: PASS
    evidence:
      - type: architecture-rule
        ref: no-local-credential-store
        result: PASS

  AC-003:
    status: FAIL
    evidence:
      - type: behavioural-test
        ref: adviser-login-regression
        result: FAIL
```

Completion should be evidence-backed, not agent-declared.

---

# 13. Decision capture

Do not let architecture or implementation decisions disappear inside an AI conversation.

Use a simple append-only record:

```markdown
## DECISION-004

**Date:** 2026-09-22

**Context**
Enterprise Identity SDK does not support legacy session migration.

**Decision**
Introduce a temporary compatibility adapter.

**Reason**
Allows incremental migration without retaining local credentials.

**Consequences**
Adapter must be removed after migration.

**Revisit**
When Legacy Account Service migration completes.
```

Only create decisions for meaningful trade-offs.

---

# 14. Skills / commands

IDD should initially be usable through simple prompt skills.

Recommended minimum:

```text
/intent-create
/intent-review
/intent-plan
/intent-implement
/intent-verify
/intent-close
```

These may be:
- Claude Code skills;
- prompt files;
- Copilot reusable instructions;
- Hekton tasks later.

Do not build a command runtime before the prompts prove useful.

---

# 15. Skill: intent-create

Purpose:
Turn a business/engineering request into a bounded IDD contract.

Responsibilities:
- clarify outcome;
- define scope/non-goals;
- identify acceptance criteria;
- identify missing constraints;
- identify context required;
- avoid inventing enterprise policy.

Output:
`/.intent/current.yaml`

Important rule:
If required architecture/policy context is unknown, record it as missing rather than guessing.

---

# 16. Skill: intent-review

Purpose:
Challenge an intent contract before work begins.

Check for:
- vague outcomes;
- implementation disguised as intent;
- hidden assumptions;
- missing non-goals;
- untestable acceptance criteria;
- missing architecture context;
- contradictory constraints;
- oversized scope.

Output:
- PASS;
- NEEDS_REVISION;
- BLOCKED.

The reviewer should not expand the task.

---

# 17. Skill: intent-plan

Purpose:
Create an implementation plan that maps every step to intent and acceptance.

Plan format:

```text
Step
→ Intent/constraint served
→ Acceptance criterion
→ Expected evidence
```

The plan must:
- stay within scope;
- respect architecture constraints;
- identify unknowns;
- use the smallest implementation slice;
- separate deterministic work from model reasoning.

The plan should not be a generic software-development checklist.

---

# 18. Skill: intent-implement

Purpose:
Implement one bounded slice.

Rules:
- read the intent contract first;
- read compiled context if available;
- implement only the current slice;
- preserve constraints;
- do not silently change intent;
- stop if implementation requires violating a constraint;
- update decisions if a meaningful trade-off appears;
- add tests/evidence with the change.

---

# 19. Skill: intent-verify

Purpose:
Independently check whether evidence supports acceptance.

Verification should prefer deterministic evidence.

It should:
- run relevant tests;
- run architecture checks;
- inspect evidence;
- identify unsupported completion claims;
- classify missing evidence;
- flag potential architecture divergence;
- avoid fixing the implementation itself.

Output:
`/.idd/evidence.yaml`

---

# 20. Skill: intent-close

Purpose:
Close a completed intent.

Checks:
- every acceptance criterion has evidence;
- no unresolved blockers;
- material decisions captured;
- temporary exceptions identified;
- architecture divergence reviewed;
- follow-on debt recorded where appropriate.

Result:
- COMPLETE;
- COMPLETE_WITH_DEBT;
- BLOCKED;
- NEEDS_REWORK.

---

# 21. Suggested agents

Do not create an elaborate multi-agent system.

Use four conceptual roles.

## Planner
Recommended model: Opus for meaningful work.

Purpose:
- understand intent;
- challenge ambiguity;
- plan bounded slices;
- map plan to acceptance/evidence.

## Implementer
Recommended model: Sonnet.

Purpose:
- implement one slice;
- add tests;
- collect evidence.

## Verifier
Recommended model: Sonnet or independent model/session.

Purpose:
- independently validate acceptance;
- inspect architecture compliance;
- avoid self-certification.

## Utility
Recommended model: Haiku.

Purpose:
- fixtures;
- schema updates;
- repetitive conversions;
- deterministic edits;
- documentation;
- small test additions.

Do not add agents unless a failure mode demonstrates value.

---

# 22. Model allocation

Recommended default:

```text
Opus
- intent critique
- planning
- architecture trade-offs
- difficult failure analysis

Sonnet
- implementation
- verification
- code review
- context compilation implementation

Haiku
- low-risk repetitive work
- fixtures
- metadata
- schema examples
- docs
```

Model choice is not part of the protocol.

Teams may substitute equivalents.

---

# 23. Upfront project scaffolding

When IDD is enabled for a repo, scaffold only:

```text
.intent/
  current.yaml
  architecture.yaml
  decisions.md

.idd/
  evidence.yaml
  session.md

evals/
  acceptance/
```

Optionally include:

```text
.claude/
  skills/
```

or the equivalent reusable-prompt location used by the local tool.

Avoid adding a large generated framework.

---

# 24. architecture.yaml

This file holds task-local machine-readable architecture constraints.

Example:

```yaml
system: adviser-portal

capabilities:
  - customer-authentication

must_use:
  - platform: enterprise-identity
    because: INTENT-IDENTITY-001

must_not:
  - local-credential-store

standards:
  - STD-OIDC-001

exceptions: []
```

If a context compiler exists, this file may be generated rather than authored.

---

# 25. Session state

Use `/.idd/session.md` only for short-lived working state.

Example:

```markdown
# IDD Session

Current intent: INTENT-001
Current slice: PLAN-STEP-02
Status: IN_PROGRESS

## Blockers
None.

## Notes
Compatibility adapter required; decision captured as DECISION-004.
```

Do not turn session state into a knowledge base.

---

# 26. Agent context order

When starting a coding session, load context in this order:

1. current intent;
2. acceptance criteria;
3. architecture constraints;
4. relevant decisions;
5. compiled enterprise context;
6. repository/task context.

This gives the agent "what must be true" before it sees implementation detail.

---

# 27. Portable prompt contract

Every implementation prompt should effectively say:

```text
Implement the current bounded slice.

Your source of intent is:
/.intent/current.yaml

Your architecture constraints are:
/.intent/architecture.yaml

Your current decisions are:
/.intent/decisions.md

Do not change the intent.
Do not silently violate constraints.
Unknown information must remain unknown.
Add evidence for acceptance criteria affected by your change.
Stop and report if the requested implementation conflicts with intent.
```

This is enough for an MVP.

---

# 28. Three-arm evaluation

IDD should be validated against simpler baselines.

Run the same bounded task in three arms.

## A — Normal AI coding

```text
task + repository
```

## B — Lightweight IDD

```text
intent contract + repository
```

## C — IDD + Enterprise Context

```text
intent contract
+ compiled architecture context
+ repository
```

Potential later arm:

## D — Hekton

```text
IDD
+ compiled context
+ orchestrated agent loop
```

---

# 29. Evaluation metrics

Measure:

- task correctness;
- acceptance coverage;
- architecture compliance;
- constraint violations;
- unintended changes;
- hallucinated assumptions;
- missing requirements;
- human intervention count;
- iteration count;
- token/context usage;
- evidence completeness.

Do not focus only on code-generation quality.

---

# 30. IDD-specific validation gates

## Gate 1 — Does intent improve planning?

Compare normal task prompt vs IDD contract.

Pass if:
- plans reference constraints;
- acceptance coverage improves;
- unsupported assumptions decrease.

## Gate 2 — Does intent improve implementation?

Compare code outcomes.

Pass if:
- architecture violations decrease;
- acceptance coverage improves;
- unintended scope decreases.

## Gate 3 — Does compiled enterprise context add value beyond IDD?

Compare B vs C.

If there is little difference, the lightweight IDD contract may deliver most of the value.

That is a useful outcome.

## Gate 4 — Can verification remain independent?

The verifier must be able to reject the implementer's claim of completion.

Seed at least one implementation with:
- passing unit tests;
- failing acceptance criterion.

The verifier should reject completion.

## Gate 5 — Does the process stay lightweight?

Measure human overhead.

If developers spend more time maintaining IDD metadata than the protocol saves, simplify it.

---

# 31. Stop conditions

Redirect the pattern if:

- intent contracts become long requirements documents;
- developers duplicate large enterprise architecture documents locally;
- agents frequently ignore the contract;
- acceptance remains subjective;
- evidence cannot be captured cheaply;
- verification simply repeats implementation-agent claims;
- contract maintenance overhead exceeds observed benefit.

---

# 32. Anti-patterns

Avoid:

### Prompt-as-process
A giant prompt containing the whole SDLC.

### Agent self-certification
The implementation agent saying "done" is not evidence.

### Intent drift
Changing requirements silently to match the implementation.

### Architecture duplication
Copying entire enterprise architecture packs into every repo.

### Everything-is-policy
Turning every architectural preference into an enforced rule.

### Everything-is-an-agent
Use deterministic tests for deterministic questions.

### Framework-first
Do not create an IDD engine before the simple files and skills work.

---

# 33. Recommended initial adoption

Start with internal projects that are:

- bounded;
- meaningful;
- architecture-sensitive;
- safe to experiment on;
- already using Claude Code or Copilot.

Do not mandate IDD enterprise-wide.

Use it as an opt-in experiment.

---

# 34. Success criteria

A successful lightweight IDD pattern should demonstrate:

1. Developers can understand the contract quickly.
2. Agents plan with fewer hidden assumptions.
3. Architecture constraints survive implementation.
4. Acceptance becomes evidence-backed.
5. Verification can reject incorrect completion.
6. Enterprise context can be added without changing the protocol.
7. Hekton can consume the same contract later.
8. The overhead remains low enough for routine use.

---

# 35. Minimal implementation roadmap

## Phase 0
Create:
- schemas;
- example contract;
- evidence model;
- skills/prompts.

No runtime.

## Phase 1
Dogfood on one internal task.

Compare normal AI coding vs IDD.

## Phase 2
Add compiled enterprise context.

Run three-arm evaluation.

## Phase 3
Add simple deterministic validation command:

```text
idd validate
```

Potential checks:
- schema valid;
- acceptance IDs unique;
- evidence references valid;
- all required evidence present before closure.

## Phase 4
Only if justified:
- CI integration;
- Aegis advisory checks;
- Hekton orchestration;
- reusable MCP/context integration.

---

# 36. Initial design decision

The first implementation should remain:

> files + schemas + prompts + tests.

That is intentional.

If that simple pattern does not improve outcomes, a larger platform will not rescue it.
