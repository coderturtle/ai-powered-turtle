# Skill: /intent-create

Create a bounded IDD contract from the user's task.

## Read
- project README/context;
- existing architecture constraints if available;
- current enterprise-context bundle if supplied.

## Produce
`/.intent/current.yaml`

## Requirements
- outcome, not implementation;
- bounded scope;
- explicit non-goals;
- observable acceptance criteria;
- relevant known constraints;
- required context types;
- required evidence.

## Rules
- do not invent architecture or policy;
- represent missing information explicitly;
- avoid turning the contract into a long requirements document;
- use the smallest contract that safely enables planning.

End with unresolved questions/blockers only if they prevent READY status.
