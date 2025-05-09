You are an expert AWS solutions architect tasked with enhancing the resilience of a B2C personal investor platform in the UK. Currently, trades (buy/sell requests) are directly routed to a single third-party provider managing end-to-end order management. Due to a recent outage, customers were unable to trade, highlighting the urgent need for improved resilience.

You need to architect a solution to achieve resilience in three clearly defined phases, with a foundational trade queuing system applicable across all phases. The detailed architecture should be output in markdown format suitable for use in Obsidian, including professional architecture solution designs with clear C4 architecture diagrams in Mermaid format, RACI matrices, and structured descriptions.

### Foundational: Trade Queuing System

- **Queue Mechanism**: Propose a technology-agnostic and AWS-based solution for queuing trades independently from third-party systems.
    
- **C4 Diagram**: Include a detailed Mermaid diagram illustrating the queuing system architecture.
    
- **RACI Matrix**: Clearly outline roles and responsibilities.
    

### Phase 1: Liability Management

- **Price Tracking and Exposure Management**: Provide technology-agnostic and AWS-specific approaches to track and manage price exposure during outages.
    
- **Liability Calculation and Alerts**: Detail solutions to calculate financial liability and trigger alerts when thresholds are breached.
    
- **Reimbursement Logic**: Outline robust reimbursement logic addressing price fluctuations.
    
- **C4 Diagram**: Include Mermaid diagrams.
    
- **RACI Matrix**: Clearly outline roles and responsibilities.
    

### Phase 2: Manual Failover to Secondary Provider

- **Secondary Provider Integration**: Detail technology-agnostic and AWS-specific architectures for integrating a secondary trade provider.
    
- **Manual Failover Procedure**: Define manual failover procedures clearly and explicitly.
    
- **Risk Assessment**: Identify risks and mitigation strategies.
    
- **C4 Diagram**: Include Mermaid diagrams.
    
- **RACI Matrix**: Clearly outline roles and responsibilities.
    

### Phase 3: Automated Active-Active Failover

- **Active-Active Architecture**: Design a robust active-active failover architecture with both technology-agnostic and AWS-specific solutions.
    
- **Decision Algorithm**: Develop decision logic for dynamic trade routing.
    
- **Continuous Testing and Validation**: Recommend testing and validation approaches and technologies.
    
- **C4 Diagram**: Include Mermaid diagrams.
    
- **RACI Matrix**: Clearly outline roles and responsibilities.
    

Each section must contain:

- Clear descriptions
    
- Recommended solutions (technology-agnostic and AWS)
    
- Mermaid diagrams (C4 architecture)
    
- RACI matrices
    
- Structured implementation strategy