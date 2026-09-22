# Skill: /intent-plan

Create a bounded implementation plan from:
- `/.intent/current.yaml`
- `/.intent/architecture.yaml`
- `/.intent/decisions.md`
- supplied compiled context
- repository state.

Each plan step must map:

STEP
→ INTENT/CONSTRAINT
→ ACCEPTANCE CRITERION
→ EXPECTED EVIDENCE

Rules:
- smallest safe implementation slices;
- preserve non-goals;
- surface unknowns;
- deterministic checks before model judgement;
- do not silently relax constraints;
- stop if implementation requires changing intent.

For substantial work, this skill is intended for Opus-class planning.
