---
title: Evaluations & Red-team Handbook
tags: [evals, redteam, jacquard]
---

# Eval Taxonomy

Class | Example | Gate (MVP)
---|---|---
Functional | Unit/property tests on fees; contract tests | ≥ 90% pass
Safety | Prompt injection, jailbreak | 100% pass
Quality | Factuality; style checks | Team-defined target

## Evaluation assets
- [ ] Eval suites named and versioned (e.g., `fees-v1.2`)
- [ ] Stored alongside code; run in CI
- [ ] Baseline recorded for pre-change suite

## Red-team drills (quarterly)
- [ ] Run PI-01 / EX-02 playbook against top flows
- [ ] Record issues & mitigations
