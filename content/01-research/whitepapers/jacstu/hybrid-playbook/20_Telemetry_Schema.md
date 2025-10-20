---
title: Telemetry & Observability Schema
tags: [telemetry, schema, jacquard]
---

# Telemetry Schema (minimal)

```
experiment_id, timestamp, pillar, metric, value, method(manual|instrumented), confidence(low|medium|high), source_url
```

## Logging checklist
- [ ] Logs redacted; hashed IDs
- [ ] Source URLs captured
- [ ] Confidence noted for manual measures
- [ ] Dashboards pull from the same schema
