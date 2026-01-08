---
title: "ManagerOS with M365 Copilot (Loop + OneNote + Planner)"
owner: "Derm Duncan"
created: "2026-01-04"
version: "v1.0"
tags: [manageros, m365, copilot, loop, onenote, planner, teams, outlook, workflows]
---

# ManagerOS: end-to-end setup + workflows (for tomorrow)

This guide scaffolds a lightweight **ManagerOS** using tools you already have: **Loop**, **OneNote**, **Planner**, **Teams**, **Outlook**, and **M365 Copilot**.  
It includes: a step-by-step setup, reusable templates, **prompt packs**, tips/tricks, and an extensible automation roadmap.

---

## The 30-second idea

- **Loop = your live “front-of-house” operating system** (current state, plans, updates, dashboards, link hub).
- **Planner = your commitments system** (every follow-up becomes a task or is intentionally dropped).
- **OneNote = your private archive** (sensitive notes, longer reflections, anything you don’t want shared).
- **Teams/Outlook = your input streams**
- **Copilot = your extractor and drafter** (turn noise into: decisions, actions, summaries, plans, updates).

The “golden loop” you’ll repeat all day:
1) **Capture** (Teams meetings + email threads)  
2) **Extract** (Copilot: decisions + actions + owners + deadlines)  
3) **Commit** (Planner tasks)  
4) **Publish** (Loop stakeholder updates)  
5) **Learn** (journal + decision log)

---

# Part 1 — Setup (90 minutes total)

## 1. Create your Loop workspace (15 mins)
Create a Loop Workspace called:

- **ManagerOS – Derm**

Add these pages (names matter; you’ll reference them in prompts and reuse templates):
1. **00 – Daily Command**
2. **10 – People & 1:1 Hub**
3. **20 – Org Evolution (Hiring + Onboarding)**
4. **30 – Architecture (EU) – Now / Next / Risks**
5. **40 – CTO / Platform – Now / Next / Risks**
6. **50 – AI Enablement – Now / Next / Risks**
7. **60 – Stakeholder Updates**
8. **90 – Decision Log**
9. **99 – Open Loops (Waiting On)**

> If your tenant has “Copilot Pages” or “Notebooks”, treat them as *optional accelerators*. Everything in this guide works with Loop pages + OneNote.

---

## 2. Create your Planner plan (15 mins)
Create a Planner plan called:

- **ManagerOS – Commitments**

Buckets:
- **People**
- **Hiring/Onboarding**
- **Architecture**
- **CTO/Platform**
- **AI Enablement**
- **Stakeholders**
- **Ops/Admin**
- **Waiting On**

Rules:
- If it’s a **commitment** (you owe / they owe / deadline exists) → it lives in Planner.
- If it’s **context** (why/what/risks/decisions) → it lives in Loop.
- If it’s **private/sensitive** → it lives in OneNote.

---

## 3. Create your OneNote “archive” (10 mins)
Create a notebook:

- **ManagerOS Archive**

Suggested sections:
- **Private Journal**
- **Performance Notes (factual)**
- **Sensitive People Notes**
- **Deep Work Logs**
- **Personal Learnings / Patterns**

---

## 4. Pin your launch points (5 mins)
In Teams, pin:
- Loop (or the Loop workspace)
- Planner (the ManagerOS plan)

Optional:
- A chat with yourself (“Derm – Notes”) for quick capture.

---

## 5. Enable meeting capture habits (5 mins)
In meetings you run:
- Turn on **transcription** when appropriate/allowed (helps Copilot recap quality later).
- After the meeting, use **Recap** + Copilot to extract decisions and actions.

---

## 6. Create your four stakeholder channels/spaces (optional but useful)
If you can, create (or identify) where you’ll publish updates:
1) **Your teams** (internal updates) — e.g., Teams channel + Loop link
2) **EU Technology Leadership** — e.g., Teams channel or email distro + Loop link
3) **European Business** — e.g., Teams channel + short update style + “so what”
4) **International Leadership Team (ILT)** — e.g., crisp exec summary + asks/decisions

You’ll draft in Loop, then post to the right place.

---

# Part 2 — Templates (copy/paste)

## Page: 00 – Daily Command
Paste this at the top of the page and reuse daily.

### Today (date)
**Top 3 outcomes (ship/decide/resolve)**
1.
2.
3.

**Hands-on block (protected)**
- Time block:
- Output:
- “Definition of done”:

**Today’s schedule (key meetings)**
- …

**Actions captured (from inbox + meetings)**
- [ ] …

**Risks / snags**
- …

**End-of-day close**
- Decisions made:
- Open loops moved to Planner:
- Parked for later:

---

## Page: 10 – People & 1:1 Hub (repeat per person)
Create one section per person (H2 heading) and paste:

### [Name] — running notes
**Snapshot**
- Role / level:
- Current focus:
- Motivation / growth theme:

**Wins / impact**
- …

**Blockers / risks**
- …

**Growth**
- Skills to build:
- Opportunities:
- Coaching notes:

**Commitments**
- You owe:
- They owe:
- Next check-in date:

**Links**
- 1:1 doc / career plan / key work:

---

## Page: 20 – Org Evolution (Hiring + Onboarding)

### Hiring dashboard (table)
Create a Loop table with these columns:

| Role | Status | Target date | Panel / Owner | Next action | Risks | Links |
|---|---|---:|---|---|---|---|

Status values (keep consistent): `Open`, `Screening`, `Interviewing`, `Offer`, `Accepted`, `Onboarded`.

### Onboarding template (copy per new hire)
**[New hire name] — 30/60/90**
- Start date:
- Buddy:
- First-week mission:
- Success measures (30/60/90):
- Key systems access checklist:
- Stakeholder intros (top 10 people):
- First meaningful delivery milestone:
- Shadowing plan:
- Feedback cadence:

---

## Pages: 30/40/50 — Area pages (Architecture / CTO / AI Enablement)
Use the same template in all 3 pages. Consistency is what makes automation possible.

### Now (this week)
- …

### Next (2–4 weeks)
- …

### Risks / decisions needed
- …

### Dependencies / asks
- …

### Metrics (pick 3 that matter)
- …

### Links (artefacts)
- …

---

## Page: 90 – Decision Log
Create a table:

| Date | Decision | Context (1–2 lines) | Options | Owner | Follow-ups (Planner link) |
|---:|---|---|---|---|---|

---

## Page: 99 – Open Loops (Waiting On)
Simple list. Every item must be either:
- a Planner task, or
- intentionally ignored (explicitly marked “dropped”).

---

# Part 3 — Stakeholder Updates (4 templates)

All updates are generated from the same sources:
- Architecture page (30)
- CTO/Platform page (40)
- AI Enablement page (50)
- Decision log (90)
- Open loops (99)

## A) Stakeholder Set 1 — Your Teams (internal updates)
**Tone:** human, transparent, specific, motivating.  
**Length:** ~200–400 words.  
**Goal:** alignment + clarity + unblock.

Template:
- **Wins shipped (this week)**
- **What we’re doing next**
- **What’s blocked / needs help**
- **Shout-outs**
- **How to engage** (office hours, docs, where to ask questions)

Example skeleton:
- **Wins:** …
- **Next:** …
- **Risks/Blockers:** …
- **Asks:** …
- **Shout-outs:** …

## B) Stakeholder Set 2 — EU Technology Leadership
**Tone:** crisp, delivery + risk oriented.  
**Length:** ~150–300 words.  
**Goal:** visibility, decisions, risk surfacing.

Template:
- **Highlights**
- **Progress vs plan**
- **Risks + mitigations**
- **Decisions needed**
- **Asks / support required**

## C) Stakeholder Set 3 — European Business
**Tone:** plain language, “so what” and outcomes.  
**Length:** ~120–250 words.  
**Goal:** confidence, value, impact, what’s changing.

Template:
- **What changed / improved (customer / advisor / ops impact)**
- **What’s next (and why it matters)**
- **Any impacts / asks (time, approvals, business input needed)**
- **Risks in business terms**

## D) Stakeholder Set 4 — International Leadership Team (ILT)
**Tone:** executive, very concise, decisions + dependencies.  
**Length:** ~80–180 words.  
**Goal:** alignment across regions + remove blockers.

Template:
- **1–2 headline outcomes**
- **Top 2 risks**
- **Top 1–2 decisions / asks**
- **Dependencies (other regions / central teams)**

---

# Part 4 — Prompt Packs (copy/paste)

## Prompt pack rules (so Copilot behaves)
- Provide **sources**: “Use pages 30/40/50 + decision log + open loops”
- Specify **format**: bullets / table / headings
- Specify **tone**: team-friendly / exec / business-friendly
- Specify **constraints**: word count, include owners and dates

---

## 1) Outlook prompts (email triage + drafting)

### Triage summary (thread)
```text
Summarize this email thread into:
1) Context (2 bullets)
2) Decisions made (bullets)
3) Open questions (bullets)
4) Actions with owner + due date (table)
Keep it factual and specific.
```

### Draft reply (firm but friendly)
```text
Draft a reply that:
- Confirms the decision / next step
- Assigns ownership clearly
- Sets a deadline
- Asks 1 specific question if needed
Tone: friendly, direct, not corporate.
```

### Convert email into Planner tasks (manual or Copilot-in-Planner)
```text
Extract the action items from this email and rewrite them as Planner tasks.
Include: task title, owner, due date, bucket suggestion.
```

---

## 2) Teams prompts (meeting → recap → actions)

### During or right after meeting
```text
From this meeting, list:
- Decisions made (bullets)
- Actions (table: action / owner / due date / dependency)
- Risks or unresolved items (bullets)
Be strict about naming owners.
```

### “What did I miss?” (late joiner)
```text
I joined late. Summarize the conversation so far and tell me:
- The current decision point
- Any actions already assigned
- What input is needed from me now
```

---

## 3) Loop prompts (turn notes into structured updates)

### Update an area page (30/40/50)
```text
Using the notes below, update the section headings:
Now / Next / Risks / Dependencies / Metrics.
Keep it concise and action-oriented. Highlight anything that needs a decision.
NOTES:
[PASTE NOTES]
```

### Generate a stakeholder update (choose audience)
```text
Using:
- 30 Architecture (EU)
- 40 CTO/Platform
- 50 AI Enablement
- 90 Decision Log
- 99 Open Loops

Draft an update for: [AUDIENCE]
Format: [TEMPLATE NAME]
Max length: [WORD COUNT]
Tone: [TEAM / EU TECH LT / EU BUSINESS / ILT]
Include: 2–3 highlights, risks, and explicit asks if any.
```

---

## 4) Planner prompts (if Copilot is available in your Planner)

### Turn action list into tasks
```text
Create Planner tasks from the list below.
Buckets: People, Hiring/Onboarding, Architecture, CTO/Platform, AI Enablement, Stakeholders, Ops/Admin, Waiting On.
Add due dates where implied. Ask clarifying questions only if absolutely required.
LIST:
[PASTE ACTIONS]
```

### Create an onboarding plan
```text
Create a 30/60/90 onboarding task plan for:
Role: [ROLE]
Start date: [DATE]
Include access, intros, first delivery milestone, and weekly check-ins.
Return as tasks grouped by bucket (Week 1, Weeks 2–4, 30/60/90).
```

---

# Part 5 — Your “Tomorrow” script (operating rhythm)

## 09:00–09:25 — Inbox → Daily Command → Planner
1) Open Outlook. Pick top 5–10 threads.
2) Use the **triage summary** prompt.
3) Paste action table into **00 – Daily Command**.
4) Create Planner tasks (manual or Copilot).
5) Choose your **Top 3 outcomes** for the day.

## Before each meeting (2 minutes)
- Write the “decision we need” in your head (or as a private note).
- If you’re running it: turn on transcription when possible.

## After each meeting (3–5 minutes)
1) Teams → recap prompt → get decisions + actions.
2) Paste decisions into **90 – Decision Log**.
3) Paste actions into **00 – Daily Command**.
4) Convert actions into Planner tasks.

## 12:30–12:40 — Midday reset
- Planner: re-check top 3 outcomes.
- Move low-value tasks to “Waiting On” or defer.
- Protect a hands-on block.

## 16:30–16:45 — Close the loop
- Update Decision Log.
- Ensure Open Loops are either tasks or dropped.
- Write 3 bullets in OneNote: what worked, what didn’t, what to try tomorrow.

---

# Part 6 — Tips & tricks (stuff that makes this stick)

## 1) Keep your language consistent (automation loves consistency)
Use the same headings everywhere:
- Now / Next / Risks / Dependencies / Metrics

Use the same status values in tables:
- Open, Screening, Interviewing, Offer, Accepted, Onboarded

## 2) “Owner + due date” or it’s not real
If you can’t name an owner or date, rewrite the action until you can.

## 3) Separate “context” from “commitment”
- Context lives in Loop pages.
- Commitments live in Planner.
- Private notes live in OneNote.

## 4) Create a protected hands-on block every day
Put it in Daily Command and treat it like a meeting.

## 5) Use Copilot as a first drafter, not a final decider
You provide the judgement; Copilot provides speed.

## 6) Avoid leaking sensitive info
Don’t paste sensitive HR/performance details into shared Loop spaces. Use OneNote.

---

# Part 7 — Extensibility: automation roadmap (start simple)

## Phase 1 (this week): standardize + repeat
- Use the templates daily
- Keep Planner current
- Publish one weekly update using the stakeholder prompts

## Phase 2 (next): add Power Automate (if allowed)
High ROI flows:
1) **Flag email → Planner task**
2) **New calendar invite accepted → prep checklist task**
3) **Weekly scheduled digest → pull your Loop updates into a message**
4) **New hire start date → generate onboarding tasks**

## Phase 3: advanced
- “Decision log” becomes your lightweight governance.
- Stakeholder updates become auto-generated drafts with minimal edits.
- You build a rhythm that protects hands-on time.

---

# Appendix — Quick-start: What to do if Copilot features differ in your tenant

## If you don’t see Copilot in Planner
- Use manual task creation from your action tables.
- Keep the same buckets and naming conventions (future-proof).

## If you don’t see Loop in Teams
- Use browser Loop pages + copy link into a pinned Teams message or tab.

## If Teams recap isn’t available
- Use a 60-second “end of meeting recap” where you ask for: decisions + actions
- Paste into Loop + Planner.

---

## Your first win to aim for tomorrow
By end of day, you want:
- A Loop workspace with the pages above
- A Planner plan with at least 10 tasks created from real work
- One stakeholder update draft created from pages 30/40/50
- A Decision Log with at least 3 decisions recorded

You’ll feel the load come off quickly once tasks stop living in your head.
