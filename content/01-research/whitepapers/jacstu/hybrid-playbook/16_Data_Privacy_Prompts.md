---
title: Data & Privacy — Prompts, Redaction, Retention
tags: [privacy, prompts, data, jacquard]
---

# Data & Privacy Rules for Prompts

Class | Allowed in prompts? | Redaction | Retention | Notes
---|---|---|---|---
Public | Yes | None | 90 days | 
Internal (non-PII) | Yes | Mask names/emails | 60 days | 
Client PII | No | — | — | Use synthetic/test data
Sensitive (legal, HR) | No | — | — | Escalate to Risk

## Prompt hygiene checklist
- [ ] Inputs are classified
- [ ] Redaction applied (if needed)
- [ ] Output logs redacted & hashed
- [ ] Retention window respected

## Prompt examples (safe patterns)
- System prompt with policy summary:
```
You are writing internal docs. Never include PII. If user content includes names/emails, mask them.
```
