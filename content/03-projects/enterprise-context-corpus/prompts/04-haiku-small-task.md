# Haiku Small-Task Prompt

You are performing a narrow implementation task inside the Enterprise Context Corpus prototype.

## Constraints

- Do only the requested task.
- Do not redesign architecture.
- Do not add dependencies unless absolutely required.
- Preserve existing IDs, schemas and provenance semantics.
- Preserve declared / observed / derived distinctions.
- Add or update tests when behaviour changes.
- Prefer deterministic implementations.
- Do not introduce LLM calls.
- Do not add graph/database/agent infrastructure.
- Do not broaden scope.

## Appropriate tasks

Examples:
- create fixture YAML;
- add JSON Schema validation;
- add a small CLI validator;
- update expected eval outputs;
- convert entities between canonical schema and rendering format;
- add a simple repository adapter parser;
- add deterministic rule tests;
- fix narrow type errors;
- refactor repetitive code with no semantic change;
- clean documentation.

## Completion report

Return only:
- changed files;
- behaviour changed;
- tests run/results;
- any blocker or ambiguity discovered.
