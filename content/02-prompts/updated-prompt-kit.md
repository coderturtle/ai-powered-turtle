

## title: Deep Research Prompt Kit tags: [deep research, AI architecture, prompt engineering, coderturtle]

# 🧠 Coderturtle Deep Research Prompt Kit

## 🎯 Purpose & Rationale

The **Deep Research Prompt Kit** is designed to help software architects, technical leaders, and AI strategists leverage AI to conduct **structured, high-impact research**. Rather than shallow web searches or ad-hoc prompting, this kit provides:

- A reusable prompt architecture
    
- Guidance on how to ask better research questions
    
- A strategy to evolve AI outputs into decision-ready documents and artifacts
    

This approach is informed by the principles of **retrieval-augmented generation**, **cognitive scaffolding** (Clark & Chalmers, 1998), and **iterative prompting**—all of which help externalize and extend human thinking via AI.

This methodology is also grounded in research on human-AI co-creation (Amershi et al., 2019) and patterns from advanced prompt engineering research by OpenAI, Anthropic, and Microsoft Research.

---

## 📘 How to Work with Deep Research

### 🪜 Step-by-Step Workflow

1. **Define Your Intent**
    
    > What is the real question or decision you’re trying to explore?
    
2. **Select a Prompt from the Kit**
    
    > Choose a base prompt or use the Super Prompt template.
    
3. **Use Iterative Prompting** Break the white paper into deep-dive prompt rounds:
    
    - **Scout Prompt**: Quick landscape or comparison
        
    - **Deep Dive Prompt**: Full structural analysis
        
    - **Synthesis Prompt**: Summarize as blog post, white paper, or deck
        
4. **White Paper Prompt Rounds**  
    For major research efforts, follow this phased approach:
    
    |Phase|Prompt Focus|Output|
    |---|---|---|
    |1. Discovery|Trends, tools, challenges|Executive Summary, Section 1|
    |2. Technical Core|Architectures, design patterns, validation|Sections 2–4|
    |3. Strategic Core|Skills, roadmaps, ROI|Sections 5–7|
    |4. Fictional / Creative|Prototypes, org models, walkthroughs|Sections 8–9|
    |5. Wrap-Up|Synthesis, diagrams, pitch decks, artifact bundling|Final white paper export|
    
5. **Validate & Expand**
    
    - Cross-check facts and tools
        
    - Prompt for opposing views or tradeoffs
        
6. **Store & Refine in Obsidian** Organize your vault for clarity and modular reuse.
    

### 💡 Best Practices

- Be specific in the **persona** and **output format**
    
- Always include **structure** in your prompt (lists, headings, diagrams)
    
- Use modifiers (tone, depth, perspective) to refine results
    
- Prompt recursively: use outputs as new inputs
    
- Use **AI-assisted editing** to stitch outputs into final documents
    

---

## 🧰 Prompt Architecture

All prompts follow this structure:

```txt
Act as [role/persona]. Research [topic]. Output [format] using [structure]. Include [modifiers or extras].
```

### Common Modifiers

- **Tone**: executive, academic, blog-style, storytelling
    
- **Audience**: senior architect, founder, regulator, beginner
    
- **Perspective**: enterprise, startup, open-source, futurist
    
- **Format**: Markdown, slide deck, architecture diagram, roadmap
    

---

## 🧠 Super Prompt Template (White Paper-Ready)

````txt
Act as a hybrid AI research analyst, senior software architect, and strategic advisor with deep expertise in AI, enterprise systems, and software engineering leadership.

Your task is to conduct a comprehensive, multi-dimensional exploration of the following research topic:
**{Insert Topic}**

Your deliverable is a structured, high-value research artifact designed for senior engineers, architects, CTOs, and technical executives. The format should follow Obsidian-compatible Markdown and support modular reuse (e.g., slide decks, blog posts, white papers, diagrams).

---

🔍 Research Scope:  
Explore relevant subtopics across:
- Architecture transformation
- AI paradigms and tooling
- Validation and risk
- Skill shifts and upskilling
- Strategy and ROI
- Regulatory compliance
- Fictional futures and walkthroughs

📦 Structure your response using:
1. Executive Summary  
2. Current Trends & Landscape  
3. Tool Ecosystem & AI Paradigms  
4. Architectural Shifts  
5. Technical Design Patterns & Tradeoffs  
6. Validation & Governance Strategies  
7. Skill Evolution & Role Reframing  
8. Strategic Roadmap & Resource Planning  
9. Business Case & ROI  
10. Regulatory Considerations  
11. Future State Scenario (Optional)  
12. Artifacts (Diagrams, Prompts, Scripts, Roadmaps)

Optional: Add modifiers such as:
- **Tone**: blog-style, white paper, academic, satirical
- **Perspective**: startup CTO, enterprise architect, AI ethics lead, futurist
- **Format**: slide deck, blog post, diagram-rich doc
- **Length**: summary, 2-pager, long-form report

🛠️ For long-form research, break prompts into iterative sections and later combine them using an editing prompt like:
```txt
Act as a technical editor. Merge the following sections into a cohesive white paper. Ensure consistency in tone, formatting, and flow.
````

```

---

## 🧩 Prompt Kit – Ready-to-Use Prompts

(...remaining prompts unchanged...)

---

## 📁 Recommended Vault Organization

(...unchanged...)

---

## 🔚 Final Thoughts

The Deep Research Prompt Kit is more than just a set of instructions—it’s a thinking tool. It helps you structure complexity, accelerate insight, and generate rich deliverables with AI as a partner. Used well, it can become the backbone of your learning, writing, and architectural ideation workflows.

> “AI won’t replace your creativity—but it can *scaffold* it.” — Coderturtle

```