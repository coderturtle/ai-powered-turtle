# Sonnet Implementation Loop Prompt

Continue the Enterprise Context Corpus prototype for **one bounded implementation phase only**.

Read:
- current plan;
- current test/eval results;
- `docs/context-pack.md`;
- `docs/validation-plan.md`.

## Before coding

State internally:

- the hypothesis this phase tests;
- the evaluation gate;
- the simplest implementation capable of testing it;
- the stop condition.

Then implement.

## Rules

- No speculative platform work.
- No dependency without a testable need.
- Deterministic first.
- Preserve provenance.
- Never upgrade inferred data to authoritative data.
- Unknown/conflict are first-class outcomes.
- Do not optimise UI before core evals pass.
- Add regression tests for every discovered failure.
- Prefer modifying the smallest layer responsible for a failure.
- Do not fix retrieval failures with prompt wording.
- Do not fix schema failures with RAG.
- Do not fix applicability failures with free-form LLM reasoning if a rule can represent them.
- Aegis stays advisory.

## Required completion report

Return:

1. Hypothesis tested
2. Changes made
3. Tests/evals run
4. Before/after results
5. Failure classification for remaining errors
6. Whether the gate passed
7. If failed: recommended redirect
8. If passed: smallest justified next phase
9. Any architecture decision that now has evidence behind it
10. Any previously assumed component that can now be removed

Do not continue into the next phase without an explicit new instruction.
