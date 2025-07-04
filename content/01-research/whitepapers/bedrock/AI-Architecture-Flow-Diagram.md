flowchart LR
  %% --- Data Foundation ---
  subgraph "Data Foundation & Ingestion"
    A[Core Banking & Trading Systems] --> CDC(("CDC Connectors"))
    CDC --> Kafka["Confluent Kafka<br>(Managed on AWS)"]
    Kafka --> Flink["Flink Streaming<br>(AWS KDA / Flink on EKS)"]
    Flink --> Delta["Delta Lake<br>(S3 + Lake Formation)"]
    Flink --> Vector["Vector Store / Feature DB"]
  end

  %% --- Policy at Ingestion ---
  subgraph "Policy‑as‑Code Layer" 
    style Policy fill:#eaf8ff,stroke:#007acc,stroke-width:2
    Policy["PBAC Sidecar<br>(OPA/Cerbos)"]
  end
  CDC -. enforces .-> Policy
  Policy -->|logs| Ledger["Immutable<br>Audit Ledger"]

  %% --- AI Platform ---
  subgraph "AI Inference & Gateway"
    Gateway["AI Gateway<br>(MCP Bridge)"]
    Gateway --> Bedrock["Amazon Bedrock<br>(LLM/FMs)"]
  end

  %% --- Agentic Layer ---
  subgraph "Agentic Fabric"
    Orchestrator["ACP Orchestrator"]
    Bedrock --> Orchestrator
    Orchestrator --> AgentRisk["Risk Analysis Agent"]
    Orchestrator --> AgentESG["ESG Insights Agent"]
    Orchestrator --> AgentTrade["Trade Assistant Agent"]
  end
  Orchestrator -. logs .-> Ledger

  %% --- Control & Resilience ---
  subgraph "Control Plane (UK & EU Regions)"
    style Control fill:#fff5e6,stroke:#ff8c00,stroke-width:2
    RaftUK["Raft Cluster UK"]
    RaftEU["Raft Cluster EU"]
  end
  RaftUK <--> RaftEU
  Orchestrator --> RaftUK
  Policy --> RaftUK

  %% --- Observability ---
  subgraph "Observability & Monitoring"
    Tracing["OpenTelemetry Traces"]
    Metrics["Prometheus / Grafana"]
  end
  AgentRisk --> Tracing
  Flink --> Tracing
  Gateway --> Tracing
  Tracing --> Metrics

  %% --- Compliance Automation ---
  subgraph "Compliance & Reporting"
    Evidence["Auto Evidence Generator<br>(Annex VIII, SMCR, DORA)"]
  end
  Ledger --> Evidence
  Metrics --> Evidence

  %% --- Cross‑Functional Workflow (Swim Lane) ---
  subgraph "Workflow"
    Intake["Use‑Case Intake"] --> Privacy["Data & Privacy Scoping"] --> Design["Model Design & Bias Scan"] --> Check["Reg/Controls Gate"] --> RedTeam["CSOC Red‑Team"] --> Deploy["Automated Deployment Gate"] --> Monitor["Live Monitoring / Incident Resp."]
  end

  %% --- Final edges ---
  Delta --> Gateway
  Vector --> Gateway
  Kafka --> Gateway
