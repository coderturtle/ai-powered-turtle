
# 🧪 Sample Agentic SDLC Project: **“AI Act Journey Assistant”**


> **Goal**: Build a web-based experience that guides internal teams through EU AI Act classification and documentation—powered by LLM interpretation, automated assessments, and audit-ready reporting.

---

## 🎯 Problem to Solve

- **Today**: Reviewing AI use cases is **manual**, **time-consuming**, and requires cross-team input from risk, legal, architecture, and compliance.
    
- **Future**: Users submit a use case → system walks them through a journey → generates classification, documentation, and audit pack → legal/risk only need to **review & sign**.
    

---

## 💡 Step-by-Step Walkthrough with Agents

### 🧭 Step 1: Ideation

**Agent**: `Product Strategist Agent`  
**Prompt**:

> "I want to build a web app that helps teams determine how their AI use case is classified under the EU AI Act and generate the documentation for audit."

**Output**:

- Problem statement
    
- Vision: “EU AI Compliance in a Click”
    
- Personas: Product managers, engineers, risk teams
    
- Initial KPIs: Time to classify, audit cycle time, reduction in legal review time
    

---

### 📄 Step 2: PRD Generation

**Agent**: `Product Manager Agent`  
**Output**:

- Goals:
    
    - Reduce legal/compliance burden
        
    - Educate users on AI Act
        
    - Automate documentation creation
        
- Core features:
    
    - Use case submission form
        
    - LLM-based classifier
        
    - Journey walkthrough (risk explanation, remediation)
        
    - Summary report export (PDF/Markdown)
        
    - Legal/risk sign-off tracking
        

---

### 📋 Step 3: Task Breakdown

**Agent**: `Task-Master`  
**Output**: Task backlog:

- Build system prompt + retrieval layer for interpreting EU AI Act (→ LLM Architect)
    
- Create multi-step UX flow (→ Designer + Frontend)
    
- Develop classification engine (→ Backend)
    
- Draft risk/legal summary template (→ Doc Writer)
    
- Store responses and documents securely (→ Platform + Security)
    
- Export results and trigger legal sign-off (→ FinOps + Risk Agent if desired)
    

---

### 🧱 Step 4: Architecture

**Agent**: `Architect Agent`  
**Output**:

- 🧠 C4 Context:
    
    - User enters use case
        
    - LLM + RAG engine interprets regulation
        
    - Risk category assigned
        
    - Journey rendered via web frontend
        
    - PDF or Markdown summary produced
        
    - Stored + shared with sign-off workflow
        
- ADRs:
    
    - Choose LangChain + OpenAI / Azure OpenAI
        
    - Use a vector store for chunked EU AI Act text
        
    - Serverless or containerized backend
        

---

### 🛠 Step 5: Infra as Code

**Agent**: `Cloud Engineer Agent`  
**Output**:

- IaC via Terraform for:
    
    - AWS/GCP/Azure (depending on org)
        
    - API Gateway + Lambda / ECS
        
    - S3 / Blob for document storage
        
    - Weaviate or Qdrant vector store
        
- GitHub Actions CI/CD pipeline for deployment
    

---

### 💻 Step 6: Implementation

**Agent(s)**:

- `Frontend Dev Agent`: React/Next.js or Vue-based walkthrough with progress tracker, explanations, and controls
    
- `Backend Dev Agent`: RAG engine, OpenAI integration, report generation
    
- `Designer Agent`: User journey, explainability cues, inline risk tips
    
- `Security Agent`: Consent banner, PII handling, encryption, audit logs
    
- `FinOps Agent`: Cost estimation of LLM calls, storage, and forecast models
    

---

### 🧪 Step 7: Testing

**Agent**: `QA Agent`  
**Output**:

- Unit tests for use case parsing and classification
    
- Integration tests for report export
    
- Accessibility and UX tests for walkthrough
    

---

### 📄 Step 8: Documentation

**Agent**: `Documentation Agent`  
**Output**:

- README + Dev setup guide
    
- Architecture decision log (ADR)
    
- “EU AI Act 101” explanation for users
    
- Audit output format samples
    
- Runbook for risk/legal reviewers
    

---

## 🧾 Output Summary

|Component|Format|
|---|---|
|Product Vision|`docs/vision.md`|
|PRD|`docs/prd.md`|
|Architecture|`docs/architecture.md`, `diagrams/` (Mermaid)|
|Task List|`workflows/task-master-output.json`|
|Code|`src/` folder with modules per agent|
|Docs|`docs/audit-summary-template.md`, `user-guide.md`|
|Output Example|`outputs/sample-use-case-audit.md`|

---

## 🚀 Testing This Flow

To run the whole thing:

```bash
windsurf run --task "idea" --input "Create an AI-powered tool to classify use cases under the EU AI Act and generate documentation."
```

This triggers:

1. Product Strategist (vision)
    
2. Product Manager (PRD)
    
3. Architect (C4 + ADR)
    
4. Task-Master (task split)
    
5. Backend + Frontend + QA
    
6. Doc Writer (readme + templates)
    

---

## 🪄 Optional Extensions

|Extension|Benefit|
|---|---|
|**Anthropic or GPT-4o**|LLM with better reasoning for legal context|
|**LangChain / RAG**|Better document interpretation|
|**Docassemble / PDFKit**|Auto-generate legally structured PDFs|
|**Fine-tuned model**|For org-specific AI risk guidance|
|**Slack Bot / Teams Bot**|Trigger walkthrough from chat|

---

Would you like:

- ✅ A ready-made repo structure and `.zip` for this exact project?
    
- ✅ Starter prompts for the LLM around EU AI Act classification?
    
- ✅ Mermaid C4 model scaffolding to go with this?
    

Let me know which to generate next!