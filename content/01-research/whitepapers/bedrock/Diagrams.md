# AWS Bedrock Control-Plane Architecture — Consolidated Diagrams

Below is a single Markdown file containing every diagram (Mermaid 10-compatible) from the previous two responses. Copy-paste the whole file into any Markdown viewer or docs repo that supports Mermaid.

---

## 1 C4 Level 1 — Context

```mermaid
%%{ init: { "theme": "base" } }%%
flowchart TD
    subgraph External_Actors [ ]
        EngineeringTeam(["Engineering Teams"])
        BusinessUsers(["Business Users"])
        Regulators(["EU / UK Regulators"])
    end

    subgraph AWS_LandingZone["AWS Landing Zone (EU Region)"]
        BedrockCP(["AWS Bedrock<br>Control Plane"])
    end

    EngineeringTeam -->|"Model API calls\n(e.g. from IDEs, CI/CD)"| BedrockCP
    BusinessUsers -->|"Chat & Analytics"| BedrockCP
    Regulators <-->|"Audit evidence,\nModel cards, logs"| BedrockCP
```

---

## 2 C4 Level 2 — Container

```mermaid
%%{ init: { "theme": "neutral" } }%%
flowchart LR
    subgraph Bedrock_Control_Plane["Bedrock Control Plane"]
        A[Pre-Prompt<br/>Classifier]
        B[Policy Engine<br/>EU AI Act, GDPR, MAR]
        C[Guardrails<br/>AWS Guardrails]
        D[Model Invoker<br/>Bedrock API]
        E[Post-Gen Filters<br/>PII redact, toxicity]
        F[(Audit&nbsp;Log&nbsp;Store)]
        G[(Monitoring&nbsp;Dashboards)]
    end
    subgraph Foundational_Layer["Managed Models (Bedrock)"]
        H[Foundation & Fine-tuned Models]
        I[RAG&nbsp;Service<br/>Vector DB]
    end

    %% control flow
    A --> B --> C --> D --> H --> E
    C --> I
    A --"trace"--> F
    B --"decision logs"--> F
    E --"output logs"--> F
    F --> G

    %% external
    Dev[Developer IDE / Agents] --> A
    SaaS["Bedrock-enabled SaaS - Cursor, Windsurf, etc."] --> A
```

---

## 3 Sequence — Single Model Invocation

```mermaid
sequenceDiagram
    participant DevAgent as Windsurf IDE (dev)
    participant Pre as Pre-Prompt Classifier
    participant Policy as Policy Engine
    participant Guard as Guardrails
    participant Model as Bedrock Model
    participant Post as Post-Gen Filter
    participant Log as Audit Log

    DevAgent->>Pre: Source-code refactor prompt
    Pre->>Policy: Attach user-role & purpose
    Policy->>Guard: Allow | Deny | Transform
    alt allowed
        Guard->>Model: Invoke LLM
        Model-->>Guard: Candidate response
        Guard->>Post: Risk scores
        Post-->>DevAgent: Clean response
    else blocked
        Guard-->>DevAgent: Error / policy message
    end
    Note over Pre,Post: All steps stream<br/>decision + content hashes to **Audit Log**
    Policy-->>Log: Decision artefacts
    Guard-->>Log: Prompt & completion hashes
```

---

## 4 Technical Flow — RAG Pipeline

```mermaid
%%{ init: { "theme": "forest" } }%%
flowchart TD
    subgraph 1_Request
        UserQ(["Product Owner<br/>asks a question"])
    end
    subgraph 2_Inference_Pipeline["Bedrock RAG Pipeline"]
        classDef gray fill:#f5f5f5,stroke:#bbb,color:#333;
        A1[[Prompt<br/>Classifier]]
        A2[[Vector Lookup<br/>OpenSearch/Kendra]]
        A3[[Prompt&nbsp;Assembler]]
        A4[[LLM<br/>Bedrock Claude 3]]
        A5[[Post-Filter]]
    end
    subgraph 3_Sources
        DocRepo(["Confluence & PRDs"])
        S3Data(["Versioned PDFs<br/>S3 EU-West-2"])
    end

    UserQ --> A1
    A1 --> A2
    DocRepo -.-> A2
    S3Data -.-> A2
    A2 -->|top-k docs| A3
    A3 -->|augmented prompt| A4
    A4 --> A5 -->|citations + answer| UserQ
```

---

## 5 Plug-and-Play Pattern Catalogue

```mermaid
%%{ init: { "theme": "base" } }%%
flowchart LR
    subgraph Dev_Workstation["Developer Workspace"]
        IDE(IDE / Agentic IDE)
    end
    subgraph Bedrock_Services["Bedrock Control Plane"]
        Guardrails
        Invoker(Model Invoker)
        FM(Foundation Models)
    end
    subgraph Shared_Compliance["Shared Compliance\nArtifacts"]
        Logs(Audit Logs)
        Cards(Model Cards)
    end

    IDE -->|Prompt - code refactor| Guardrails
    Guardrails --> Invoker --> FM --> Invoker --> Guardrails
    Guardrails -->|Response| IDE
    Guardrails --> Logs
    FM --> Cards
```

---

## 6 C4 Level 3 — Policy-Engine Internals

```mermaid
%%{init: { "theme": "neutral" } }%%
flowchart LR
    subgraph Policy_Engine["Policy Engine (Bedrock CP)"]
        RE[Rules Repo<br/>Git + OPA]
        C1[Context Enricher]
        PE[OPA Decision<br/>Service]
        VH[Violation Handler]
        DC[Decision Cache<br/>DynamoDB + TTL]
        QM[Queue / Metrics<br/>Kinesis]
    end

    subgraph Inputs
        Req[Classified Prompt<br/>JSON]
        UserRole[User Roles - SAML]
        Meta[App Metadata]
    end

    Req --> C1
    UserRole --> C1
    Meta --> C1
    C1 --> PE
    RE --> PE
    PE -->|allow| DC
    PE -->|deny<br/>explain| VH
    PE --> QM
    VH --> QM
```

---

## 7 C4 Level 3 — Guardrails & Model Invoker

```mermaid
%%{init: { "theme": "base" } }%%
flowchart TD
    APIGW[AWS API Gateway]
    Lambda1[Lambda <br/>Guardrails Orchestrator]
    SFN[Step Functions <br/>policy → invoke → filter]
    LambdaPolicy[Lambda <br/>Policy Callout]
    LambdaInvoke[Lambda <br/>Bedrock Invoker]
    LambdaFilter[Lambda <br/>Post-Gen Filters]
    Bedrock[(AWS Bedrock<br/>Foundation + Custom Models)]
    DLQ[SQS DLQ]
    CW[CloudWatch Logs]
    Firehose[Kinesis Firehose<br/>→ S3 / Athena]

    APIGW --> Lambda1 --> SFN
    SFN --> LambdaPolicy --> SFN
    SFN --> LambdaInvoke --> Bedrock --> LambdaInvoke --> SFN
    SFN --> LambdaFilter --> APIGW
    LambdaPolicy --> DLQ
    LambdaInvoke --> DLQ
    LambdaFilter --> DLQ
    Lambda1 --> CW
    DLQ --> Firehose
```

---

## 8 RAG — Ingestion & Query Paths

```mermaid
%%{init:{ "theme":"forest" } }%%
flowchart TB
    subgraph Offline_Ingest
        SRC1[(Confluence Export)]
        SRC2[(PDF Policies)]
        Loader[Doc Loader <br/>Lambda]
        Chunker[Chunker + Metadata Tagger]
        Encoder[Embeddings Encoder <br/>Embed v2]
        VDB[(Vector DB <br/>OpenSearch/Kendra)]
        INDEX["Lucene / Faiss Index"]
        Loader --> Chunker --> Encoder --> VDB
        VDB --> INDEX
    end

    subgraph Online_Query
        PromptCLS[Prompt Classifier]
        Retriever[Top-k Retriever]
        Assembler[Prompt Assembler]
        BedrockLM[(Claude 3 Sonnet)]
    end

    UserQ["Product-Owner<br/>Query"] --> PromptCLS --> Retriever
    INDEX -.-> Retriever
    Retriever -->|Docs + scores| Assembler --> BedrockLM --> Answer & citations --> UserQ
```

---

## 9 Sequence — End-to-End Audit & MRM

```mermaid
sequenceDiagram
    participant ClientApp
    participant APIGW
    participant Guard as Guardrails Orchestrator
    participant Policy
    participant Model as Bedrock
    participant Post as Post-Filters
    participant KFH as Kinesis Firehose
    participant OS as OpenSearch Dashboards
    participant MRM as Model-Risk Monitor

    ClientApp->>APIGW: Prompt
    APIGW->>Guard: Invoke
    Guard->>Policy: Evaluate
    Policy-->>Guard: allow/deny + reason
    alt allow
        Guard->>Model: Prompt
        Model-->>Guard: Completion
        Guard->>Post: Output
        Post-->>ClientApp: Final text
    else deny
        Guard-->>ClientApp: Error msg
    end
    Note over Guard,Post: Hashes + evaluation<br/>streamed to Firehose
    Guard-->>KFH: Logs
    Policy-->>KFH: Decision logs
    Post-->>KFH: Output hashes
    KFH-->>OS: Load to index
    OS-->>MRM: Dashboard widgets / alerts
```

---

## 10 Detailed Flow — PII Scrub & Privacy Filter

```mermaid
%%{init:{ "theme":"neutral" } }%%
flowchart LR
    GenOut[Raw LLM<br/>Completion]
    Det[Amazon Comprehend PII Detect]
    Rdct[Redaction Lambda]
    Class[Token-Classify<br/>Regex + HeapRegex]
    Merge[Merge / Mask &lt;*&gt;]
    Hash[SHA-256 Hash<br/>Store]
    GenOut --> Det --> Rdct
    GenOut --> Class --> Merge
    Rdct --> Merge --> Hash --> "Safe Completion →\nUser / Downstream"
```

---

## 11 Swim-lane — Tester Persona with testRigor

```mermaid
%%{init:{ "theme":"base" } }%%
flowchart TD
    subgraph Tester_Workflow
        tester[QA Engineer<br/>testRigor SaaS]
        testSuite[Test script\nplain English]
    end
    subgraph Bedrock_Guardrails
        preQA[Prompt Classifier]
        policyQA[Policy Engine]
        guardQA[Guardrails]
        invokeQA[Bedrock Model]
        postQA[Post-Filters]
    end
    subgraph SDLC_Pipeline
        CI[CI/CD Runner]
        Results[Test Results + Logs]
    end

    tester --> testSuite --> preQA
    preQA --> policyQA --> guardQA --> invokeQA --> guardQA --> postQA --> CI --> Results --> tester
    guardQA -->|Logs| Results
```

---

**End of file**