
---
title: "Building the Agora Decision Engine with GitHub Copilot Agents"
tags: [deep-research, github-copilot, agentic-mode, sdcl-governance, architecture, agora, obsidian, quartz]
publish: true
author: "Head of Architecture"
audience: ["Engineering Teams", "Platform Architects", "AI Developers", "Technical Leadership"]
template: "deep-research"
---

# 🧠 Deep Research Prompt

## 🏛️ Purpose

You are the **Head of Architecture** at a technology company, and you are initiating a project to implement a comprehensive **decision tracking engine**—codename: **Agora**. This solution will operationalize the decision tracking framework defined in a previous deep research artifact. Your implementation strategy centers on using **GitHub Copilot in Agentic Mode** to build, extend, test, and govern this solution.

This research initiative must define the architectural blueprint, agent responsibilities, development workflows, and deployment strategy (local and AWS), and also deliver a business case and governance structure. The outcome should be a **modular, AI-augmented decision intelligence system** that is production-grade, auditable, and beneficial across all teams and lifecycle stages.

---

## 🎯 Key Research Goals

### 1. GitHub Copilot Agentic Mode (Beginner → Expert)

- What is GitHub Copilot Agentic Mode and how does it differ from regular Copilot and Chat?
- Step-by-step setup guide to activate and configure Agentic Mode for:
  - Local development
  - Multi-agent orchestration
  - Secure integrations with GitHub repositories and actions
- Best practices to scale from:
  - **Single-agent** task completion (e.g. generate ADR template)
  - To **multi-agent workflows** (e.g. design → implement → test → deploy)

### 2. Agent Roles for Agora

Define the set of Copilot agents required to build and maintain the Agora solution:

| Agent Name     | Role                                                                 |
|----------------|----------------------------------------------------------------------|
| `architect-agent` | Converts requirements to Mermaid C4 diagrams + defines blueprints |
| `repo-agent`       | Creates and maintains decision templates, ADR/DDL markdown files |
| `confluence-agent` | Syncs decisions to Confluence using API integrations             |
| `copilot-ci-agent` | Manages GitHub Actions for CI/CD pipelines                       |
| `aws-deploy-agent` | Provisions infrastructure on AWS and runs local-to-cloud sync    |
| `governance-agent` | Analyzes PRs, issues, and meeting notes to enforce decision capture |
| `dashboard-agent`  | Generates real-time metrics on decision coverage per team        |

Include:
- Scope and skillset of each agent
- Prompts and action flows used to activate agents for different phases
- How agents hand off or call other agents
- Logging and observability of agent outputs

### 3. Architecture Diagrams (Mermaid C4)

Deliver a full curated **C4 model** in Mermaid that includes:

- **Level 1 – Context**: Agora within the enterprise SDLC tool ecosystem
- **Level 2 – Container**: Components such as web dashboard, Copilot agent layer, sync service, GitHub/Confluence/Jira connectors
- **Level 3 – Component**: Breakdown of modules like ADR Service, Template Engine, Audit Tracker
- **Level 4 – Code** *(optional)*: Interfaces between agents and their controller orchestration, agent memory system, and plugin system

Include all diagrams as `mermaid` blocks for Quartz rendering.

#### 4. **Architecture & Design Decisions**

Create a complete **initial set of decisions** to support Agora’s design and implementation, including:

- **Architecture Decision Records (ADRs):**
    
    - ADR-0001: Use of ADRs to document decisions
        
    - ADR-0002: GitHub Copilot Agentic Mode as the orchestration layer
        
    - ADR-0003: Deployment strategy (local dev + AWS ECS/Lambda)
        
    - ADR-0004: Frontend framework choice
        
    - ADR-0005: Metadata and storage format for decision records
        
- **Design Decision Logs (DDLs):**
    
    - Capture implementation choices such as agent manifest structure, file layout, and CI config decisions
        
    - Should be structured, time-stamped, and linked to the related ADRs where applicable
        

Output these in markdown format, ready to populate `docs/` or `templates/` in the repo.

### 5. Chronological Build Plan

Design a **step-by-step implementation roadmap**:
- Phase 1: Local prototype using Copilot Agent for ADR creation and markdown formatting
- Phase 2: Build agent controller and orchestrator (agent router)
- Phase 3: Add web-based dashboard for decisions and team comparison
- Phase 4: Integrate with GitHub PRs, Jira issues, and Confluence API
- Phase 5: Governance workflows (bot to flag missing decisions in PRs and tickets)
- Phase 6: AWS deployment pipeline using CDK/Terraform + CI/CD

Include GitHub Project and Milestone structure for organizing delivery.

### 6. Local Dev + AWS Hosting

- Local development:
  - Use Docker Compose and Vite/NodeJS/Python microservices
  - Simulate agent behavior locally with test prompts and mock data
- AWS Hosting:
  - Use ECS + Lambda for services
  - S3 for markdown-based ADR/DDL storage
  - DynamoDB or RDS for metadata
  - API Gateway for frontend/backend communication
  - Copilot GitHub workflows to deploy staging → prod

CI/CD:
- Automated tests (unit, integration)
- Decision coverage lint checks in PRs
- Preview environments per branch

### 7. Business Plan for Agora

Provide a strategic plan articulating **why Agora matters**, and how it delivers value:

- Quantifiable pain points it addresses:
  - "We forgot why we made X decision."
  - "We duplicated the same tech evaluation in 3 teams."
  - "We can’t trace architectural choices in PRs."
- Benefits:
  - Transparent, distributed decision memory
  - Governance and SDLC visibility
  - Accelerated onboarding and reuse
  - Foundation for AI copilots to answer "why"
- Metrics:
  - Decisions per epic/story
  - Average time to decide
  - Decision aging and review frequency
- Monetizable value:
  - Reduced rework
  - Improved regulatory traceability (DORA/AI Act)
- Problems Agora solves:
    
    - Decision loss, tech redundancy, lack of traceability
        
- Strategic benefits:
    
    - Organizational memory, auditability, architecture reuse
        
- Metrics to measure impact:
    
    - Decisions per epic/story, decision latency, aging, rework avoided
        
- Use cases:
    
    - Engineering onboarding, risk/audit reviews, architecture reviews

### 8. Governance & Enforcement

Create workflows and mechanisms to **ensure teams are consistently capturing decisions**:

- Required decision metadata in Jira Epics and PR templates
	-  Missing decision alerts in PRs, Jira tickets
- Periodic agent-driven reports: % stories with decisions, orphaned changes, reviews of aging decisions, etc.
- flags for unlinked architecture changes
- Confluence decision radar – shows stale or unreviewed decisions
- Escalation bot: if implementation starts without approved design
        
- Provide a governance workflow with RACI roles and AI-based nudges/reminders.

### 9. Dashboard for Org-Wide Visibility

Build a **real-time dashboard** to show:

| Metric                        | Description                                          |
|------------------------------|------------------------------------------------------|
| % PRs linked to decisions    | Indicates traceability of code to rationale          |
| ADR coverage by team         | How many decisions were documented in a given period |
| Aging decisions               | How many decisions haven't been reviewed in 6+ months |
| Top decision types           | E.g. framework choice, service interface, etc.       |

Allow filtering by team, time range, tag, component. Store data in a central `decision-metrics-db`.

#### 10. **Dogfooding Plan: Agora on Agora**

- Once the initial version of Agora is deployed:
    
    - Use Agora itself to **recreate and capture all major decisions** that led to its development
        
    - Re-ingest decisions from `docs/adr/*.md` and `docs/ddl/*.md`
        
    - Tag decisions with “dogfood” or “bootstrap” for clear separation
        
    - Use `governance-agent` and `dashboard-agent` to measure:
        
        - Coverage of tracked decisions from the project history
            
        - Gaps between original design and actual implemented choices
            
    - Hold an **architecture retrospective** to evaluate decision effectiveness and track adjustments
        

This process will validate Agora’s value and inform future enhancements via real usage.
---

## 👥 Personas

- **Engineering Team Lead** – Uses Agora to propose and validate decisions
- **Architect** – Governs architectural integrity and formal ADR structure
- **Platform SRE** – Ensures decision engine CI/CD and observability
- **Head of Engineering** – Uses dashboard to assess team maturity
- **AI Engineer** – Designs and configures GitHub Copilot agents

---

## 📦 Deliverables

- Modular decision engine powered by GitHub Copilot agents
- Modular GitHub repo (CI-ready) with agent manifests and orchestration flows
- Mermaid-based architecture diagrams (C4 levels 1–3/4)
- CI/CD pipelines and agent test harness
- GitHub Actions workflows for CI/CD
- AWS + local deploy setup (IaC templates included)
- Web dashboard for metrics and team comparison  to track SDLC decision hygiene
- Business plan & architecture value brief for executive stakeholders
- Governance policies and compliance integration guides
- Initial ADR/DDL set documenting all key project decisions
- Dogfooding log showing Agora tracking its own inception

---

## 🧩 Format
All content should be:
- **Markdown + Mermaid** (Obsidian & Quartz compatible)
- Integrated with GitHub repository for versioning and publishing
- Structured for modular reuse in documentation, presentations, and governance packs
