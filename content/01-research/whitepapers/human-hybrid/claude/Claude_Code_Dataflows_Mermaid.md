---
title: "Mermaid Diagrams — Claude Code Data Flows (EU)"
date: "8 November 2025"
---

# Mermaid Diagrams — Claude Code Data Flows (EU)

> Context: Amazon Bedrock in **eu-west-1 (Ireland)**, **walled garden** models. Cross-Region **Inference Profiles** are used for model selection and routing.  
> Access to Bedrock is **gated by SailPoint** approval and enforced via **IAM roles** and scoped policies. Interim policy: **block EU AI Act high‑risk** categories; **detect‑only** elsewhere.

---

## 1) End-to-End Developer Assist Flow (Interim)

```mermaid
flowchart LR
    subgraph Dev["Engineer Workspace"]
      IDE["IDE + Claude Code Plugin"]
    end

    subgraph Auth["Identity & Access"]
      SP["SailPoint Approval"]
      SSO["SSO / IdP"]
      ROLE["IAM Role: bedrock-claudecode-dev-eu"]
    end

    subgraph BedrockEU["AWS eu-west-1 (Ireland) — Bedrock (Walled Garden)"]
      IPF["Inference Profiles<br/>(allowlist of models/regions)"]
      GR["Interim Guardrail<br/>Block: High-Risk • Detect: Other"]
      INV["Invoke Model / Stream"]
      LOG["Invocation Logs<br/>CloudTrail/CloudWatch"]
    end

    subgraph SDLC["SDLC & Environments"]
      PR["Pull Request"]
      REV["Code Review"]
      SCAN["SAST/SCA/Secrets/IaC"]
      TEST["CI Tests"]
      NP["Non-Prod Env"]
      CM["Change Mgmt Gates"]
    end

    IDE -->|Login| SSO
    SSO --> ROLE
    SP -->|Grants on approval| ROLE

    IDE -->|AssumeRole + policy scoped to IPF| BedrockEU
    BedrockEU --> LOG

    IDE --> PR --> REV --> SCAN --> TEST --> NP --> CM

    BedrockEU -->|Outputs| IDE
    GR --> INV
    IPF --> INV
```

**Notes**
- The IDE calls Bedrock only **after** the user has SailPoint approval and assumes the scoped IAM role.  
- **Inference Profiles** restrict which models/regions can be used (e.g., EU-first, specific models).  
- **Interim guardrail** blocks high‑risk EU AI Act categories; all else is detect‑only with logging.

---

## 2) Cross-Region Inference Profiles (Routing & Control)

```mermaid
flowchart TB
    subgraph EUAcct["EU AWS Account (eu-west-1 / Ireland)"]
      CALL["Bedrock Invoke Request"]
      IPF["Inference Profile<br/>(eu-first routing)"]
      POL["Resource Policy<br/>bedrock:InvokeModel*<br/>Condition: bedrock:InferenceProfile=allowed"]
    end

    subgraph Targets["Permitted Model Targets"]
      EU1["Provider Model in eu-west-1 (Ireland)"]
      EU2["Alt EU Region<br/>(eu-central-1)"]
      US1["Provider Model in us-east-1 (Virginia)<br/>(if explicitly allowed)"]
    end

    CALL -->|must include allowed IPF| IPF
    IPF -->|Route| EU1
    IPF -->|Fallback/Allow| EU2
    IPF -. optional .-> US1

    POL -.enforced by.-> CALL
```

**Notes**
- Invocation **must** reference an **allowed Inference Profile**; IAM policy/conditions enforce this.  
- Profiles prefer EU targets; optional fallbacks are **explicitly configured** (or disallowed).

---

## 3) Access Gating: SailPoint → IAM → Bedrock

```mermaid
sequenceDiagram
    participant Dev as Engineer
    participant SP as SailPoint
    participant IAM as IAM (EU Account)
    participant SSO as SSO/IdP
    participant BR as Bedrock (eu-west-1 (Ireland))

    Dev->>SP: Request "Claude Code (EU)" access
    SP-->>Dev: Routed workflow (Mgr + Risk/Privacy policy attestation)
    SP->>IAM: Provision to group/role (bedrock-claudecode-dev-eu)
    Dev->>SSO: Login (MFA)
    SSO->>IAM: AssumeRole (scoped to InferenceProfile + guardrail)
    Dev->>BR: InvokeModel / Stream via IDE
    BR-->>Dev: Completion/stream
    BR-->>IAM: CloudTrail/CloudWatch logs
```

**Notes**  
- No access without **SailPoint** approval.  
- Role/session is **least‑privilege** and **profile‑bound**.

---

## 4) Interim Policy Decision Flow (Data & Use Classification)

```mermaid
flowchart LR
    START(["Invocation Request"])
    D1{"Is data production personal data?"}
    D2{"Does use fall under<br/>EU AI Act High-Risk / Prohibited?"}
    D3{"Is data classified as secret / credential?"}

    ALLOW["Proceed in Detect-Only<br/>(Log + Review)"]
    BLOCK1["BLOCK: Out of scope<br/>(No prod personal data)"]
    BLOCK2["BLOCK: High-Risk / Prohibited"]
    BLOCK3["BLOCK: Secrets / Creds"]

    START --> D1
    D1 -->|Yes| BLOCK1
    D1 -->|No| D2
    D2 -->|Yes| BLOCK2
    D2 -->|No| D3
    D3 -->|Yes| BLOCK3
    D3 -->|No| ALLOW
```

**Notes**  
- Interim policy: **block** production personal data, **block** high‑risk/prohibited, **block** secrets/credentials; **detect‑only** otherwise.

---

## 5) Guardrail in the Invocation Path

```mermaid
sequenceDiagram
    participant IDE as IDE
    participant GW as Bedrock API
    participant GR as Guardrail (Interim)
    participant MP as Model Provider
    participant LOG as Logs/Telemetry

    IDE->>GW: InvokeModel (with InferenceProfile)
    GW->>GR: Policy evaluation (block/detect)
    alt Blocked category
        GR-->>IDE: Error (blocked by policy)
        GR->>LOG: Block event
    else Detect-only
        GR->>MP: Forward prompt
        MP-->>GR: Completion
        GR-->>IDE: Completion (annotated)
        GR->>LOG: Detect event (for review)
    end
```

**Notes**  
- Guardrail sits **inline** with invocation.  
- **Blocked** yields error + log; **detect‑only** passes through and logs for later review.

---

## 6) Telemetry, Review & Feedback Loop

```mermaid
flowchart TB
    INV[Invocations] --> CTrail[CloudTrail]
    INV --> CWatch[CloudWatch Metrics/Logs]
    CTrail --> Lake[Security Lake / SIEM]
    CWatch --> Lake
    Lake --> Alerts[Alerts & Cases]
    Alerts --> Review[30/60/90d Review Board]
    Review --> Tuning[Guardrail & IPF Tuning]
    Tuning --> INV
```

**Notes**  
- Logs feed a central lake/SIEM; alerts are triaged; quarterly-ish tuning refines rules and profiles.

---

## 7) SDLC Flow for Generated Code (Non‑Prod Only)

```mermaid
flowchart LR
    GEN[Generated Code in IDE] --> PR[Pull Request]
    PR --> REV[Human Code Review]
    REV --> SCAN[SAST/SCA/Secrets/IaC]
    SCAN --> TEST[Unit/Integration Tests]
    TEST --> NP[Deploy to Non-Prod]
    NP --> CM[Change Mgmt Gates]
    CM -. Out of scope .-> PROD[Production]
```

**Notes**  
- **Human-in-the-loop** and **security scans** remain mandatory.  
- Production deployment is **explicitly out of scope** for the interim.

---

## 8) Future State: "Vibe Coding" Guardrail Layers (Preview)

```mermaid
graph TB
    A["Account & Network Isolation (EU)"] --> B["Access Gating (SailPoint + IAM)"]
    B --> C["PII / Secret Filters (Stronger)"]
    C --> D["Context Controls (Repo / Team / Tag-based)"]
    D --> E["Policy Packs (Allow / Deny per Capability)"]
    E --> F["Model Router via Inference Profiles"]
    F --> G["Inline Guardrail (High-fidelity)"]
    G --> H["Telemetry & Review Loop"]
```

**Notes**  
- Adds **context-aware** controls and **stronger PII filters** for any future production-data scenarios.

---

## 9) Legend

```mermaid
flowchart LR
    A[Process/Service]:::proc --> B{Decision}:::dec --> C[Action]:::action
    classDef proc fill:#eef,stroke:#447,stroke-width:1px;
    classDef dec fill:#fee,stroke:#944,stroke-width:1px,stroke-dasharray: 3 2;
    classDef action fill:#efe,stroke:#484,stroke-width:1px;
```

