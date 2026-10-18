# Session 3 — Opus 5 — Operationalise corporate Copilot personal agents and native skills

Read `docs/04-corporate-installation-and-rollout.md`, `agents/`, `skills/`, `contracts/`, and scenario docs. Work tenant has **native skills inside personal agents**, confirmed by owner. We do **not** yet know import syntax, sharing constraints or agent/skill distribution to attendees. No Copilot Studio.

1. Inspect tenant-facing authoring documentation/interfaces only if the user supplies it or you have authorized corporate access. Never fabricate successful setup.
2. Map four agents to four or more native skills: The Duck → problem-discovery; Mirror → process-archaeology; Quackquisition → adversarial-review; Hatchmaster → experiment-design.
3. Produce exactly what the user's personal-agent skill UI accepts: instructions, SKILL content, short descriptions, conversation starters, supporting examples and manual setup steps. If UI expects different structure, adapt transparently and record why.
4. Define which skills are automatically selected, how to invoke deliberately, and how to test selection in tenant. Do not assume cross-agent orchestration or shareability.
5. Produce a test matrix: each agent's first turn, adversarial case, unsupported metrics, role boundary, human approval, JSON handoff, 'summarise now' and fallback.
6. Design attendee rollout for a) shared agent permitted; b) only author has native agents; c) individual attendees create their own; d) general Copilot prompt fallback. Keep the event runnable regardless.
7. Use fictional case only; do not paste real account data. Add standalone prompts to participant companion that are complete without native skills.
8. Report exactly what was tested versus documented/assumed. Do not claim tenant setup done without direct proof.

Deliver a one-page setup guide per agent and an instructor rehearsable run of a full handoff. No install/publish/share without human approval.
