# Skill: /intent-review

Independently review `/.intent/current.yaml`.

Check for:
- vague outcome;
- hidden implementation;
- missing scope/non-goals;
- untestable acceptance;
- contradictory constraints;
- missing architecture context;
- oversized task.

Return:
- PASS
- NEEDS_REVISION
- BLOCKED

For each finding identify the exact field affected and the smallest correction.
Do not expand the scope.
