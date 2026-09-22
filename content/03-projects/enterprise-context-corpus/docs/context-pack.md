# Enterprise Context & Architecture Corpus
## Research and implementation context pack

**Prototype horizon:** 2–3 weeks  
**Initial use case:** Strategy Workbench + machine-readable architecture  
**Environment:** Enterprise AWS / Amazon Bedrock / GitHub / Microsoft 365  
**Status:** Pre-implementation architecture hypothesis

---

## 1. Executive conclusion

The recommended pattern is:

**Authoritative structured corpus → derived indexes/retrieval → context compiler → architecture intelligence and assurance → human/agent experiences**

The authoritative corpus should initially remain:

- text based;
- version controlled;
- schema validated;
- explicitly authored;
- provenance aware;
- independent of any graph database or LLM.

Git-backed YAML/JSON/Markdown is the recommended starting point.

AWS managed services should initially play specialised roles:

- **Amazon Bedrock Managed Knowledge Base**: unstructured evidence retrieval.
- **Bedrock models**: explanation, synthesis, challenge and classification where deterministic approaches are insufficient.
- **AgentCore Gateway**: future MCP/API exposure to agents.
- **AgentCore Policy / Cedar**: agent/tool authorisation rather than general architecture policy.
- **AgentCore Evaluations**: agent-level evaluations once conversational/agentic experiences are introduced.
- **Neptune / GraphRAG**: experimental derived indexes only if benchmarks demonstrate a need.

Do not start by putting all architecture into Neptune or by treating an automatically extracted GraphRAG as authoritative architecture.

---

## 2. What we are actually building

The prototype is the first experiment in an **Enterprise Context Fabric**, not an enterprise knowledge platform.

It should answer four questions.

### Can organisational intent be machine readable?

Represent:

- strategic choices;
- architecture intent;
- standards;
- decisions;
- systems;
- capabilities;
- exceptions.

### Can we compile the right context?

Give an engineering or architecture agent the **minimum authoritative context required for a task**, rather than a large set of semantically similar chunks.

### Can we compare intent with reality?

Compare declared intent with observed evidence from:

- repositories;
- APIs;
- infrastructure;
- manifests;
- CI/CD;
- configuration.

### Can assurance become executable?

Create evidence-based findings that Aegis can evaluate without turning every architecture principle into a hard blocking control.

The Strategy Workbench is the first human-facing experience proving the same substrate.

---

## 3. Conceptual architecture

```text
                       SOURCE SYSTEMS

       DECLARED                         OBSERVED

 Strategy / ADRs / standards       Repos / IaC / AWS
 architecture intent               APIs / CI / runtime
       │                                  │
       ▼                                  ▼

        NORMALISATION + PROVENANCE
        identity / timestamps / ownership
        evidence / confidence / authority
                           │
                           ▼

        ENTERPRISE CONTEXT CORPUS

        Strategy      Capabilities
        Systems       Platforms
        Intent        Decisions
        Standards     Evidence
        Exceptions    Risks
        Debt          Assertions
                           │
              ┌────────────┼─────────────┐
              ▼            ▼             ▼
         Structured     Document      Architecture
          index         retrieval      projection
                           │
                    Bedrock Managed KB
                           │
                           ▼

                    CONTEXT COMPILER

        Task → required context
        Auth → permitted context
        Graph traversal
        Evidence retrieval
        Ranking / trimming
        Provenance validation
                           │
             ┌─────────────┼───────────────┐
             ▼             ▼               ▼
       Strategy       Architecture     Engineering
       Workbench      Explorer         Agent
                           │
                           ▼

                 ARCHITECTURE INTELLIGENCE
                    intent vs evidence
                           │
                           ▼
                        AEGIS
               controls / evaluation
                findings / assurance
```

The corpus precedes the graph technology.

A graph database may later be a useful index. It should not automatically become the source of truth.

---

## 4. Three types of knowledge

### Declared

Intentionally asserted knowledge.

```yaml
basis: DECLARED
subject: SYSTEM-007
predicate: should-use
object: PLATFORM-IDENTITY
```

Examples:

- target architecture;
- strategy;
- approved ownership;
- standards;
- ADRs;
- architecture intent.

### Observed

Discovered from evidence.

```yaml
basis: OBSERVED
subject: SYSTEM-007
predicate: uses
object: LOCAL-AUTH-LIBRARY

evidence:
  - REPO-SCAN-2026-09-20

observed_at: 2026-09-20
```

### Derived

Machine-produced conclusions.

```yaml
basis: DERIVED
subject: SYSTEM-007
predicate: may-diverge-from
object: INTENT-014

derived_from:
  - OBSERVATION-118
  - INTENT-014

rule:
  ARCH-RULE-004
```

A machine-generated relationship must never silently become equivalent to an architect-approved relationship.

---

## 5. Assertions as first-class objects

The assertion connecting entities is often more important than the entity itself.

```yaml
id: ASSERTION-0081

subject: SYSTEM-X
predicate: uses
object: PLATFORM-Y

basis: OBSERVED

evidence:
  - AWS-CONFIG-220
  - REPO-SCAN-104

confidence: HIGH
observed_at: 2026-09-18
owner: TEAM-A
```

This enables:

- provenance;
- conflicting observations;
- temporality;
- confidence;
- inferred relationships;
- human approval.

---

## 6. Initial canonical objects

Keep v0.1 deliberately small.

```text
Strategy
StrategyChoice
BusinessCapability
System
Component
Platform
Interface
ArchitectureIntent
ArchitectureDecision
Standard
Evidence
Observation
Exception
ArchitectureDebt
AssuranceFinding
Team
Experiment
Metric
```

Do not attempt an enterprise ontology during the prototype.

---

## 7. Architecture intent

Architecture intent is a first-class object.

```yaml
id: INTENT-IDENTITY-001
type: ArchitectureIntent

statement: >
  Customer-facing systems requiring authentication
  should consume the enterprise identity platform.

applies_to:
  capability:
    - CUSTOMER-AUTHENTICATION

expected:
  relationship:
    predicate: uses
    object: PLATFORM-IDENTITY

rationale:
  - consistent security controls
  - reduced duplicated capability
  - regulatory consistency

origin:
  strategy_choice:
    - STRATEGY-CHOICE-004

exceptions:
  permitted: true
  approval_required: ARCHITECTURE

owner:
  ENTERPRISE-ARCHITECTURE

status:
  CURRENT
```

---

## 8. Temporal architecture

Support:

```text
CURRENT
NEXT
LATER
CONDITIONAL
RETIRED
```

And:

```yaml
valid_from: optional-date
valid_until: optional-date
observed_at: optional-timestamp
```

This prevents future-state intent being treated as a current violation.

---

## 9. Architecture-as-code and external models

Useful patterns include:

### Structurizr
Use as a projection/rendering model where disciplined C4 modelling is valuable.

### LikeC4
Useful where interactive architecture visualisation and embedding are more important.

### Backstage
Useful as an existing source for components, systems, APIs, resources and ownership if already present internally.

Recommended approach:

```text
Context Corpus
      │
      ├──→ LikeC4 / Structurizr
      ├──→ Backstage adapter
      └──→ future EA tooling
```

Do not bind the canonical corpus to a rendering language.

---

## 10. Unstructured knowledge

Use Bedrock Managed Knowledge Bases as the first baseline for unstructured evidence retrieval.

Do not rely on unstructured retrieval as the sole representation of:

- canonical system identity;
- approved standards;
- architecture intent;
- ownership;
- exceptions.

Those require explicit structure.

---

## 11. GraphRAG

Treat GraphRAG as an experiment, not a starting assumption.

Use it only if benchmark questions demonstrate that simpler approaches fail materially on multi-hop retrieval.

Potential eventual pattern:

```text
Authoritative architecture graph
              +
LLM-derived document graph
              +
Observed-state graph
```

Each edge must preserve provenance.

---

## 12. Neptune

Do not introduce Neptune initially.

Use in-memory traversal, indexed JSON or another lightweight representation for the small fixture.

Neptune should earn its place if:

- query depth becomes complex;
- the corpus becomes large;
- graph analytics add measurable value;
- multiple consumers require shared graph querying;
- dynamic observed-state relationships become substantial.

---

## 13. Context compilation

The Context Compiler is likely the most reusable capability.

Input:

```yaml
purpose: MODIFY_SYSTEM

subject:
  SYSTEM-X

audience:
  ENGINEERING_AGENT

token_budget:
  20000
```

Output should include only applicable context:

```text
Task context
System definition
Business capability
Current architecture
Target architecture
Applicable architecture intent
ADRs
Required standards
Relevant interfaces
Known dependencies
Approved exceptions
Known architecture debt
Applicable Aegis controls
Evidence / provenance
```

Semantic similarity alone must not decide context.

---

## 14. Context compiler pipeline

```text
1. Authenticate caller
2. Resolve task + subject
3. Load mandatory context classes
4. Traverse explicit relationships
5. Apply applicability rules
6. Retrieve unstructured supporting evidence
7. Resolve conflicts
8. Rank optional evidence
9. Apply token budget
10. Validate required context slots
11. Return structured bundle + provenance map
12. Let LLM explain/summarise if required
```

Steps 1–10 should be as deterministic as practical.

---

## 15. Testable context bundles

```yaml
bundle:
  purpose: MODIFY_SYSTEM
  subject: SYSTEM-X

required:
  architecture_intent:
    status: SATISFIED

  decisions:
    status: SATISFIED

  dependencies:
    status: SATISFIED

  standards:
    status: SATISFIED

optional:
  historical_evidence:
    status: TRIMMED

provenance_coverage:
  1.0

missing:
  []

tokens:
  12430
```

---

## 16. Architecture Intelligence

Architecture Intelligence interprets observed evidence relative to declared intent.

Possible outputs:

```text
CONFORMANT
UNKNOWN
POTENTIAL_DIVERGENCE
APPROVED_EXCEPTION
EXPECTED_TRANSITION
POTENTIAL_ARCHITECTURE_DEBT
```

It should not silently rewrite intent.

---

## 17. Observed-state discovery

Future adapters may include:

```text
AWS Config
GitHub
CloudFormation
Terraform
Kubernetes
OpenAPI
dependency manifests
CI/CD metadata
Backstage
runtime telemetry
```

Prototype approach:

- deterministic fixture evidence;
- one real adapter, likely a repository adapter.

---

## 18. Architecture debt

Architecture debt should emerge from:

```text
Intent
+
Observation
+
Applicability
↓
Potential Divergence
↓
Human / policy classification
```

Do not let an LLM declare something to be architecture debt by itself.

---

## 19. Aegis boundary

### Context Corpus
What do we know and intend?

### Architecture Intelligence
What appears to exist and how does it compare with intent?

### Aegis
What assurance conclusion follows?

```text
Architecture Intent
        │
        ▼
Expected condition
        │
        ▼
Architecture Intelligence
        ▲
        │
Observed evidence
        │
        ▼
      Aegis
        │
        ▼
Finding / control outcome
```

Aegis should remain advisory during the prototype.

---

## 20. Policy boundaries

Keep policy concerns separate.

```text
Agent authorisation      → AgentCore Policy / Cedar
Architecture conformity  → Aegis architecture rules
Code rules               → Semgrep / ArchUnit / dependency tools
Security policy          → security-specific engines
```

Do not use Cedar for all architecture policy.

---

## 21. AgentCore

AgentCore is relevant later for:

- Runtime;
- Gateway;
- Identity;
- Observability;
- Evaluations;
- Policy;
- Registry.

Potential future use:

```text
AgentCore Gateway
      ↓
Context Corpus MCP service

AgentCore Gateway
      ↓
Architecture query MCP service

AgentCore Policy
      ↓
Tool-level controls

AgentCore Evaluations
      ↓
Agent behaviour evaluation
```

Do not use AgentCore Memory as the authoritative architecture corpus.

---

## 22. Security

Important production concern:

What happens when a derived assertion combines sources with different access permissions?

Example:

```text
Document A — broad access
        +
Document B — restricted
        ↓
Derived architecture fact
```

The prototype should avoid trying to solve this globally.

Use:

- one homogeneous access cohort; or
- sanitised/approved fixture data.

But ensure assertions can eventually carry source security lineage.

---

## 23. Prompt injection

Evidence content is data, not instructions.

Future objects may include:

```yaml
trust:
  authority: APPROVED
  content_type: EVIDENCE
  executable_instruction: false
```

Tool permissions must remain outside document content.

---

## 24. Recommended repository shape

```text
/context-lab

  /packages

    /schema
      canonical entities
      JSON schemas

    /corpus
      parsing
      validation
      relationship traversal

    /context-compiler
      bundles
      applicability
      budgeting

    /architecture-intelligence
      intent comparison
      observations
      drift classification

    /assurance
      Aegis rule evaluation
      findings

    /adapters
      repository
      bedrock
      architecture rendering

  /apps

    /workbench

  /fixtures

    /platform-operating-model

  /evals

    /golden-questions
    /architecture-cases
    /context-bundles

  /docs
```

One monorepo. Logical boundaries only.

---

## 25. Project split strategy

### Prototype
One repo, one team, preferably one backend.

### First likely split: Aegis
Split when it starts:

- enforcing controls;
- protecting production tools;
- intercepting workflows;
- serving consumers unrelated to the Workbench.

### Second likely split: Context Platform
Split when it has multiple independent consumers such as:

- Strategy Workbench;
- engineering agents;
- architecture tools;
- risk tooling.

### Architecture Intelligence
Keep attached until continuous discovery has independent scaling and lifecycle needs.

### Strategy Workbench
Always remain an application/experience. It should never own the platform.

---

## 26. Recommended MVP choices

Decide now:

- Git-backed structured source.
- First-class provenance-bearing assertions.
- DECLARED / OBSERVED / DERIVED separation.
- Architecture rendering as a projection.
- Bedrock Managed KB as the unstructured retrieval baseline.
- No Neptune initially.
- No GraphRAG initially.
- No large agent framework initially.
- Aegis advisory only.
- Evals before UI.
- One monorepo with bounded modules.

Postpone:

- Neptune vs another graph backend.
- Structurizr vs LikeC4 long-term.
- OPA vs custom Aegis rules.
- AgentCore Runtime adoption.
- full MCP architecture.
- enterprise ontology.
- continuous architecture discovery stack.
- fine-grained ACL propagation.
- microservice boundaries.

---

## 27. Hero demonstration

Use two systems.

### System A: Customer Portal

Strategic choice:
International should consume reusable enterprise platform capabilities.

Architecture intent:
Systems requiring customer authentication use Enterprise Identity.

Observed:
Customer Portal uses Enterprise Identity.

Aegis result:

```text
CONFORMANT
```

### System B: Adviser Portal

Same intent.

Observed:
Local authentication implementation.

No known exception.

Aegis result:

```text
POTENTIAL_DIVERGENCE

Expected:
Enterprise Identity

Observed:
Local authentication

Evidence:
repo scan

Known exception:
none
```

The Workbench should allow the user to traverse:

```text
Finding
→ architecture intent
→ decision
→ strategic choice
→ evidence
```

---

## 28. Core architecture hypothesis

```text
Organisational intent
        ↓
Machine-readable context
        ↓
Task-specific compilation
        ↓
Execution
        ↓
Observed evidence
        ↓
Assurance
        ↓
Updated organisational understanding
```

The project should be designed to disprove this hypothesis through small experiments rather than assume it is correct.
