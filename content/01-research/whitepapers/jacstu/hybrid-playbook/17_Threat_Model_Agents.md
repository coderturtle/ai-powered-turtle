---
title: Agent Security — Threat Model
tags: [security, agents, jacquard]
---

# Threat Model (Agentic)

Threat | Vector | Mitigation | Test / Eval | Owner
---|---|---|---|---
Prompt injection | Untrusted HTML/markdown | Sanitiser; only allowlisted tools | Eval PI-01 | Security
Data exfiltration | Tool misuse | Tool scopes; audit trail | Eval EX-02 | Security
Model spoofing | Wrong/rogue model | Gateway pin & checksum | Gate MG-03 | Architecture
PII leakage | Logs & traces | Redaction; log policy | SEC-012 checks | Ops
Overreach | Agent autonomy | Human-in-loop gates; RAG limits | Scenario tests | Product

## Kill-switches
- [ ] Disable tool group:
- [ ] Cut model access:
- [ ] Block egress to:
