Below are three self-contained Mermaid definitions—one per re-org option.  
Paste each block into any Mermaid-enabled viewer (e.g. Markdown preview, mermaid.live) to see the chart.

---

### 1 · Two LOB-Aligned Leads (present → post-hire)

```mermaid
graph TD
  %% Top level
  A[Head of Architecture<br/>L4]:::mgr

  %% Direct reports
  A --> B[FAS Architecture Lead<br/>L3]:::mgr
  A --> C[UKPI Architecture Lead<br/>L3]:::mgr
  A --> D[Data Architect<br/>L4]
  A --> E[Specialist 1<br/>L4]
  A --> F[Specialist 2<br/>L4]
  A --> G[CTO Lead<br/>L3]:::mgr

  %% FAS branch
  B --> B1[Solution Consultant<br/>L3]
  B --> B2[Architect&nbsp;—&nbsp;FAS *future*<br/>L3]
  B --> B3[Architect&nbsp;—&nbsp;FAS *future*<br/>L3]

  %% UKPI branch
  C --> C1[Architect&nbsp;—&nbsp;UKPI<br/>L4]
  C --> C2[Architect&nbsp;—&nbsp;UKPI<br/>L4]
  C --> C3[Solution Consultant<br/>L3]
  C --> C4[Architect&nbsp;—&nbsp;UKPI *future*<br/>L3]

  %% CTO branch (0.5 FTE weight each)
  G --> G1[Platform Engineer A<br/>L3]
  G --> G2[Platform Engineer B<br/>L3]
  G --> G3[Platform Engineer C<br/>L2]
  G --> G4[Platform Engineer D<br/>L2]

  classDef mgr fill:#f8f8f8,stroke:#333,stroke-width:2;
```

---

### 2 · Capability-Based Leads (matrix model)

```mermaid
graph TD
  A[Head of Architecture<br/>L4]:::mgr

  %% Direct reports
  A --> S[Solutions-Consulting Lead<br/>L3]:::mgr
  A --> D[Delivery-Architecture Lead<br/>L3]:::mgr
  A --> X[Data & Specialists Lead<br/>L3]:::mgr
  A --> C[CTO Lead<br/>L3]:::mgr

  %% Solutions-Consulting team
  S --> S1[Solution Consultant 1<br/>L3]
  S --> S2[Solution Consultant 2<br/>L3]

  %% Delivery-Architecture team
  D --> DA1[Architect A<br/>L4]
  D --> DA2[Architect B<br/>L4]
  D --> DA3[Architect C<br/>L4]
  %% future
  D --> DA4[Architect D *future*<br/>L3]
  D --> DA5[Architect E *future*<br/>L3]
  D --> DA6[Architect F *future*<br/>L3]

  %% Data & Specialists
  X --> X1[Data Architect<br/>L4]
  X --> X2[Specialist 1<br/>L4]
  X --> X3[Specialist 2<br/>L4]

  %% CTO engineers
  C --> CE1[Platform Engineer A<br/>L3]
  C --> CE2[Platform Engineer B<br/>L3]
  C --> CE3[Platform Engineer C<br/>L2]
  C --> CE4[Platform Engineer D<br/>L2]

  classDef mgr fill:#f8f8f8,stroke:#333,stroke-width:2;
```

---

### 3 · Hybrid Location / LOB Leads (London + Manchester)

```mermaid
graph TD
  A[Head of Architecture<br/>L4 – London]:::mgr

  %% Direct reports
  A --> L[London Architecture Lead<br/>L3]:::mgr
  A --> M[Manchester Architecture Lead<br/>L3]:::mgr
  A --> C[CTO Lead<br/>L3 – London]:::mgr

  %% London team
  L --> LU1[Architect — UKPI 1<br/>L4]
  L --> LU2[Architect — UKPI 2<br/>L4]
  L --> LS1[Solution Consultant — UKPI<br/>L3]
  L --> LD[Data Architect<br/>L4]
  L --> LS2[Specialist 1<br/>L4]
  L --> LS3[Specialist 2<br/>L4]

  %% Manchester team (initial + growth)
  M --> MF1[Solution Consultant — FAS<br/>L3]
  M --> MF2[Architect — FAS *future*<br/>L3]
  M --> MF3[Architect — FAS *future*<br/>L3]
  M --> MU1[Architect — UKPI *future*<br/>L3]

  %% CTO engineers (50 % line-manager load)
  C --> CE1[Platform Engineer A<br/>L3]
  C --> CE2[Platform Engineer B<br/>L3]
  C --> CE3[Platform Engineer C<br/>L2]
  C --> CE4[Platform Engineer D<br/>L2]

  classDef mgr fill:#f8f8f8,stroke:#333,stroke-width:2;
```

_Legend_

- **Gray boxes** = first-line managers (Level 3)
    
- “_(future)_” nodes represent approved yet-to-hire roles
    
- Each platform engineer counts as 0.5 FTE for managerial span, though shown individually for clarity.