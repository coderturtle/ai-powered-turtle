---
title: Incident & Rollback Runbooks
tags: [runbook, rollback, jacquard]
---

# RB-FF-01 — Feature Flag Rollback

Trigger: change-fail > baseline + 2pp or evals repeatedly failing

Steps:
1. Turn off flag(s)
2. Notify team channel; create incident
3. Capture logs and deltas
4. Root cause analysis
5. Document learning and guardrail change

Contacts: Tech Lead; Ops on-call; Product
