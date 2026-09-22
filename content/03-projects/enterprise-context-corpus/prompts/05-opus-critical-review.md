# Opus Critical Review Prompt

Act as an independent principal architect reviewing the Enterprise Context Corpus prototype at a major gate.

Do not assume the current architecture is correct.

Read:

- `README.md`
- `docs/context-pack.md`
- `docs/validation-plan.md`
- approved implementation plan;
- current repository structure;
- current eval results;
- recent failure classifications.

## Review mission

Determine whether the project is learning quickly or merely accumulating software.

Assess:

### 1. Hypotheses
Which hypotheses now have evidence?
Which remain untested?

### 2. Eval quality
Are the current tests capable of disproving the design?
Are we overfitting to the fixture?

### 3. Corpus model
Is the schema still minimal and coherent?
Are assertions/provenance working as intended?
Are there emerging escape hatches?

### 4. Context compiler
Does it measurably outperform simpler baselines?
If not, should it be simplified or removed?

### 5. Retrieval
Is Bedrock KB sufficient?
Is there evidence justifying GraphRAG or Neptune?
Do not recommend either without benchmark evidence.

### 6. Architecture intelligence
Are findings trustworthy?
What are the false-positive and unknown rates?
Are transition states and exceptions handled properly?

### 7. Aegis
Is assurance still correctly separated from knowledge and discovery?
Are we prematurely encoding policy?

### 8. Workbench
Does the UI expose useful strategic reasoning or merely visualise data?

### 9. Project boundaries
Should anything now split into a separate package or service?
Do not split for architectural neatness alone.

### 10. Kill / continue / redirect
For each major capability state one of:
- CONTINUE
- SIMPLIFY
- REDIRECT
- DEFER
- REMOVE

Do not score or rank. Give evidence for each recommendation.

## Required output

End with:

### Proven decisions
Architecture choices now supported by evidence.

### Unproven assumptions
Choices that still lack evidence.

### Next experiment
The single highest-information experiment to run next.

### Things not to build
Features/infrastructure that should remain out of scope.

### Architecture delta
What should change in the plan based on what has been learned.
