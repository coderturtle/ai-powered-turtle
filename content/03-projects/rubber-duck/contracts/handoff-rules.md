# Human-owned handoffs

Input: latest human-reviewed Passport (JSON or human-readable Markdown, never raw confidential data in unapproved locations).
1. Agent accepts supplied claims as **participant reports**, not established facts.
2. Agent may add candidate interpretations only to assumptions/unknowns, not to facts.
3. All additions and suggested edits must be reviewable; agent cannot delete counterevidence silently.
4. Team can accept/reject each change and records rationale in decisions.
5. Next agent reads only the human-approved copy. No automatic cross-agent memory assumptions.
6. On malformed JSON, preserve original and request clarification rather than inventing fields.
7. If claims conflict, retain both with evidence provenance and ask which source is authoritative.
8. Maintain separate source and validation_status for each fact claim.
9. Do not generate precise ROI/cost/time from absent evidence; describe measurement plan instead.
10. At every step, offer a fully readable Markdown summary and machine-readable JSON when requested.

## Canonical transitions
Silent Pond → Duck: raw candidate problem and human selection rationale.
Duck → Mirror: human-approved problem statement + facts/assumptions/unknowns.
Mirror → Quackquisition: human-reviewed process sketch + uncertainty markers.
Quackquisition → Hatchmaster: strongest counterargument, revised interpretation, open questions.
Hatchmaster → Duck-Off: three contrasting options, cheapest useful experiment and explicit owner.
