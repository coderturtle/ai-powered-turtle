# Skill: /intent-implement

Implement one approved bounded plan slice.

Read, in order:
1. `/.intent/current.yaml`
2. `/.intent/architecture.yaml`
3. `/.intent/decisions.md`
4. compiled enterprise context if supplied
5. relevant repository context

Rules:
- implement only the current slice;
- do not modify intent;
- preserve constraints;
- unknown stays unknown;
- capture material decisions;
- add tests/evidence for affected acceptance criteria;
- stop and report a conflict rather than working around intent.

End with changed files, tests, evidence produced and blockers.
