%% ===================================================================
%% FinCo AI Platform – C4 Diagrams (Mermaid)
%% ===================================================================

%% ======================== 1. Context Diagram ========================
C4Context
title FinCo AI Platform – Context Diagram

Person(customer, "Retail Customer", "Uses mobile & web banking")
Person(regulator, "Regulators (FCA / EBA)", "Require compliance evidence")
Person(partner, "FinTech Partner", "Consumes open APIs / streams")

System_Boundary(finco, "FinCo Group") {
    System(mobileApp, "Digital Banking Channels", "Mobile / Web Apps")
    System(aiPlatform, "AI & Data Platform", "Agentic AI insights & risk engines")
}

Rel(customer, mobileApp, "Uses")
Rel(mobileApp, aiPlatform, "Requests insights & decisions", "REST / GraphQL")
Rel(regulator, aiPlatform, "Receives audit evidence", "Secure API / SFTP")
Rel(partner, aiPlatform, "Subscribes to event streams", "Kafka / REST")

%% ======================== 2. Container Diagram ======================

C4Container
title FinCo AI Platform – Container Diagram

System_Boundary(aiPlatform, "FinCo AI & Data Platform") {
    Container(kafka, "Confluent Kafka", "Streaming Platform", "CDC, telemetry, feature events")
    Container(flink, "Flink Jobs (EKS / KDA)", "Stream Processing", "Low‑latency feature transforms")
    Container(delta, "Delta Lake (S3 + Lake Formation)", "Data Lakehouse", "Raw & curated data")
    Container(vector, "Vector Store", "Feature / Embedding DB", "Similarity search for RAG")
    Container(aiGateway, "AI Gateway (Bedrock)", "Inference & RAG Service", "Serverless LLM endpoints")
    Container(agentOrch, "Agent Orchestrator (ACP)", "Microservice", "Coordinates multi‑agent workflows")
    Container(policy, "Policy Service (OPA / Cerbos)", "Policy Decision Point", "PBAC & guardrails")
    Container(obs, "Observability Stack", "OpenTelemetry + Grafana", "Tracing, metrics, logs")
}

Rel(kafka, flink, "Streams events")
Rel(flink, delta, "Writes streams & batches")
Rel(flink, vector, "Persists embeddings")
Rel(aiGateway, vector, "RAG retrieval")
Rel(agentOrch, aiGateway, "Invokes inferences")
Rel(agentOrch, policy, "Policy checks")
Rel(agentOrch, kafka, "Publishes telemetry")
Rel(policy, kafka, "Logs decisions")
Rel(obs, kafka, "Ingests traces")
Rel(mobileApp, aiGateway, "Requests insights")

%% ======================== 3. Component Diagram ======================

C4Component
title Agentic AI Sub‑system – Component Diagram

Container_Boundary(aiGateway, "AI Gateway (Bedrock)") {
    Component(inferenceSvc, "Inference Service", "Callable Bedrock Models", "Formats prompts & handles responses")
    Component(ragSvc, "RAG Retriever", "Vector Search + Delta", "Fetches relevant context")
    Component(guardrail, "Guardrail Sidecar", "OPA / Cerbos", "Filters & logs prompts & responses")
}

Container_Boundary(agentOrch, "Agent Orchestrator") {
    Component(router, "Task Router", "ACP Router", "Delegates tasks to agents")
    Component(planner, "Task Planner", "LLM Agent", "Creates plans & sub‑tasks")
    Component(worker, "Agent Workers", "LLM Tooling", "Executes sub‑tasks")
}

Rel(router, planner, "Delegates planning")
Rel(planner, worker, "Dispatches tasks")
Rel(worker, inferenceSvc, "Uses inference")
Rel(inferenceSvc, guardrail, "Policy check")
Rel(ragSvc, inferenceSvc, "Adds context")
Rel(worker, kafka, "Publishes results")

%% ======================== 4. Deployment Diagram =====================

C4Deployment
title High‑Level Deployment – Active/Active (EU & UK)

Node(awsEU, "AWS EU‑West‑1 Region") {
    Node(euEks, "EKS Cluster EU") {
        Container(flinkEU, "Flink Jobs")
        Container(agentOrchEU, "Agent Orchestrator")
        Container(aiGatewayEU, "AI Gateway")
        Container(policyEU, "Policy Service")
    }
    Node(mskEU, "Confluent Kafka EU")
    Node(deltaEU, "Delta Lake (S3 EU)")
}

Node(awsUK, "AWS London Region") {
    Node(ukEks, "EKS Cluster UK") {
        Container(flinkUK, "Flink Jobs")
        Container(agentOrchUK, "Agent Orchestrator")
        Container(aiGatewayUK, "AI Gateway")
        Container(policyUK, "Policy Service")
    }
    Node(mskUK, "Confluent Kafka UK")
    Node(deltaUK, "Delta Lake (S3 UK)")
}

Rel(mskEU, mskUK, "MirrorMaker Replication")
Rel(agentOrchEU, agentOrchUK, "Raft / Gossip Sync")
Rel(aiGatewayEU, aiGatewayUK, "Route 53 Failover")
Rel(customer, aiGatewayEU, "Queries (regional)")
Rel(customer, aiGatewayUK, "Fallback")
