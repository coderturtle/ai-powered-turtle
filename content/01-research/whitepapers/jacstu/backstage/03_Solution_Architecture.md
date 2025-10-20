---
title: Solution Architecture
---

# Solution architecture

```mermaid
flowchart TB
  subgraph GH[GitHub]
    R[(Experiments Repo)]
    CSV1[baselines.csv]
    CSV2[dashboard.csv]
    ACT[Actions: update dashboards]
    PRFAQ[docs/prfaq.md]
  end

  subgraph BS[Backstage]
    CAT[Catalog: Experiment kind]
    PLG[Jacquard plugin: Hub & Detail pages]
    DOC[TechDocs: Playbooks]
    SCAF[Scaffolder: new experiment]
    INS[Tech Insights: scorecards]
  end

  R -->|raw file URLs| PLG
  CSV1 --> PLG
  CSV2 --> PLG
  PRFAQ --> PLG
  ACT --> CSV2

  SCAF --> R
  CAT --> PLG
  DOC --> PLG
  INS --> PLG

  subgraph SEC[Controls]
    POL[Policy refs: SEC-012, POL-AI-004, GOV-EXP-002]
  end

  PLG -. displays .-> Users[(Teams & Leaders)]
  POL -. governs .-> PLG
```

**Data flows**
- File‑based for MVP: CSVs and PRFAQ in GitHub; Backstage reads raw URLs.
- Actions update `dashboard.csv` on push.
- Optional phase 2: small ingestion API for posting results to Backstage.

**Boundaries**
- No PII leaves systems of record.
- GitHub remains source of truth for artefacts and evidence.

Related decisions: [[05_ADRs/ADR-002_File_Based_Telemetry_MVP]].
