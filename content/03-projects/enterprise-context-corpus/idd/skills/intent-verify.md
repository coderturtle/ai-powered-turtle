# Skill: /intent-verify

Independently verify the current implementation against the IDD contract.

Prefer deterministic evidence.

Check:
- every affected acceptance criterion;
- architecture constraints;
- required standards;
- required evidence;
- known exceptions;
- potential architecture divergence.

Do not fix implementation.

Write/update `/.idd/evidence.yaml`.

Completion cannot be based only on the implementer's claim.
Return PASS/FAIL/UNKNOWN for each acceptance criterion with evidence references.
