---
title: Agent Gateway — Minimal Spec
tags: [gateway, spec, jacquard]
---

# Agent Gateway (Minimal)

Auth: OIDC service principals  
Tools: allowlist with scopes; JSON I/O schema  
Logging: prompts/responses redacted + hashed; sampled payloads  
Retry/backoff: standard policy (exponential; cap)  
Model pinning: provider + version checksum

## Tool interface (IDL)
```json
{
  "name": "generate_brd",
  "input": { "epicId": "string", "acceptanceCriteria": "string[]" },
  "output": { "brdUrl": "string" },
  "scopes": ["docs.write"]
}
```

## Policy checks
- [ ] PII redaction
- [ ] Tool scope enforcement
- [ ] Model/version allowlist
