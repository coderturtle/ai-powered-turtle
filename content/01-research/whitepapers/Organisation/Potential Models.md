Below are **three practical ways to reorganise today** (short-term) and how each one can **scale gracefully for the next 18-24 months** (long-term). I’ve shown the expected span of control (SoC) for every manager, counting each platform-engineer (“CTO team”) member as 0.5 FTE because of their dual US line-manager.

---

## 1. Two LOB-aligned Leads (pure business-unit model)

|Role|Reports (today → after hires)|SoC notes|
|---|---|---|
|**Head of Architecture (you)**|FAS Lead, UKPI Lead, Data Architect, 2 Specialists, **CTO-Lead**|6 directs (ideal window)|
|**FAS Architecture Lead (L3)**|1 Sol-Consultant, 2 future L3 Architects|1 → 3|
|**UKPI Architecture Lead (L3)**|2 L4 Architects, 1 Sol-Consultant, 1 future L3 Architect|3 → 4|
|**CTO Lead (L3 platform engineer)**|2 L3 Eng, 2 L2 Eng|2 (1 FTE) → 4 (2 FTE)|

### Why it works now

- Clear ownership for FAS vs UKPI backlogs, so product heads know “their” architect.
    
- All first-line managers stay at **level 3**, respecting the request to avoid new level 4 managers.
    
- Your SoC = 6 (comfortably < 7).
    

### Grow-on path

- When Manchester hires arrive, locate the **FAS Lead** there; UKPI stays London.
    
- If a third LOB appears or either book doubles in size, add a **third L3 lead**; your SoC would still be 7.
    
- If CTO engineers grow past 10 (=5 FTE), promote the L3 CTO Lead to L4 or appoint a second L3 lead (DevOps vs SRE, for example).
    

---

## 2. Capability-based Leads (skills matrix)

|Role|Reports (today → after hires)|SoC notes|
|---|---|---|
|**Head of Architecture (you)**|Solutions-Consulting Lead, Delivery-Architecture Lead, Data & Specialists Lead, CTO-Lead|4|
|**Solutions-Consulting Lead (L3)**|2 Sol-Consultants (+ future pre-sales hires)|2|
|**Delivery-Architecture Lead (L3)**|All project architects (3 now, 3 future)|3 → 6|
|**Data & Specialists Lead (L3/L4)**|Data Architect + 2 Specialists|3|
|**CTO Lead (L3)**|4 platform engineers|2 FTE|

### Why it works now

- Keeps like-for-like talent together, making mentoring and craft development easy.
    
- Your direct SoC is only 4, freeing you for strategy and stakeholder work.
    
- Individual contributors experience peer-group career paths (all architects report to an architect manager).
    

### Grow-on path

- Each capability lead’s team can scale to ~8 before you split again (e.g. separate “Application Architecture” and “Integration & API” pods).
    
- New locations simply slot under the same capability lead without re-spanning you.
    
- Risk: business stakeholders must learn the matrix—solution ownership is less obvious than in option 1.
    

---

## 3. Hybrid Location + LOB Model (pre-empt Manchester growth)

|Role|Reports (today → after hires)|SoC notes|
|---|---|---|
|**Head of Architecture (you, London)**|London Architecture Lead, Manchester Architecture Lead, CTO-Lead|3|
|**London Architecture Lead (L3)**|2 UKPI Architects, 1 UKPI Sol-Consultant, Data Architect, 2 Specialists|6|
|**Manchester Architecture Lead (L3)**|1 FAS Sol-Consultant (moves), 2 future FAS Architects, 1 future UKPI Architect|1 → 4|
|**CTO Lead (L3)**|4 platform engineers|2 FTE|

### Why it works now

- Gives Manchester office an identity from day 1, improving retention.
    
- Travel overhead minimised: each lead is co-located with most of their team.
    
- You still have only three directs.
    

### Grow-on path

- As Manchester matures, promote that L3 into full-time **Site Engineering Manager (L4)** overseeing both architecture and platform engineers there.
    
- London lead can later split into “FAS” and “Cross-LOB” as headcount warrants.
    

---

## Decision guide

|Consideration|Option 1|Option 2|Option 3|
|---|---|---|---|
|Business stakeholder clarity|⭐⭐⭐|⭐⭐|⭐⭐|
|Craft/skills mentoring|⭐⭐|⭐⭐⭐|⭐⭐|
|Manchester culture & autonomy|⭐|⭐|⭐⭐⭐|
|Your management bandwidth|Good|**Best**|Best|
|Avoid new level-4 manager|✅|✅|✅ (until scale-up)|

_⭐⭐⭐ = strongest alignment._

---

### Quick recommendation

- **Short term (next 6 months):** adopt **Option 1**. It’s simple, mirrors current LOB funding, and meets the 4-7 span rule immediately.
    
- **At first Manchester hire:** shift the FAS Lead’s base to Manchester, moving her/his team there—this gently morphs you toward **Option 3** without re-org fatigue.
    
- **When any manager’s SoC approaches 8 or platform-engineering doubles:** split the area or elevate a lead to level-4.
    

---

### Additional implementation notes

1. **Formalise dotted lines**
    
    - Platform engineers keep their US functional reporting; solid line to the local CTO Lead keeps their day-to-day priorities aligned with European delivery.
        
2. **Job description tweaks**
    
    - Level-3 managers should retain 25-30 % hands-on time (architecture reviews, code spikes) to stay credible while keeping salary costs down.
        
3. **Career ladder clarity**
    
    - Publish expectations for moving from L3 Manager → L4 Senior Manager early, so new leads see headroom even if you remain the only L4 for now.
        
4. **Manchester onboarding ritual**
    
    - Schedule quarterly on-site architecture reviews alternating between London and Manchester to keep culture unified.
        

By staging the changes you preserve team morale, stay within ideal spans, and avoid a premature level-4 hire while leaving a clear runway for the next growth phase.