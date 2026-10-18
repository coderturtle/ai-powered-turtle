# Website UX + technical architecture

## Users
- Projected presenter view (16:9, large readable text, high contrast, click and keyboard controls)
- Participant companion view (phone/laptop, concise current mission, instructions, prompt/agent launcher, offline alternative)
- Facilitator control view (run-of-show, skip/back/pause, +5 minutes, random wildcard, notes, reveal QR, safe reset)

## Views
1. Welcome: title + activity setup, current mission, instructions/QR.
2. Mission: timed task, mode, outcomes, team roles, prompt copy and Copilot links (configured; never invent URL).
3. Agents: Duck/Mirror/Quackquisition/Hatchmaster. Human-readable role + exact reusable prompt.
4. Evidence Board: manual facts/assumptions/unknowns with attribution; export data. Local only.
5. Passport: human-editable schema-backed editor, paste JSON import, download JSON + Markdown; clipboard fallback.
6. Duck-Off: manual/team-supplied 1–5 criteria, no live submissions unless approved mechanism available; result export.
7. Debrief: before/after problems, evidence gaps and experiment next steps, reveal manually entered examples only.

## State
- Mission clock with Date.now delta or monotonic UI timing, pause/resume/extend, cleaned up on unmount and visibility changes; do not claim precision beyond browser support.
- Canonical `workshop/event.json` config validated at startup.
- localStorage state for non-sensitive facilitator selections and synthetic passports only; explicit clear/export, warning before reset.
- No network requests after static asset load. No fonts/CDN. Service worker optional, not necessary. Prepackage all assets.
- file:// often breaks JS fetch; test installed static server mode and documented approved offline serve method, or embed config at build time.
- No backend, analytics, webhooks, hidden outbound links, auth, Graph scopes, unattended telemetry.
- QR codes only for verified internal destinations. Render helpful fallback text when unset.

## UI identity
Deep ink #111B28, duck yellow #FACC15, teal #0D9488, white #F8FAFC, slate #475569. Use warm, polished lab/game-show visuals, not childish corporate clip-art. Optional lightweight CSS duck illustration; no external assets required.

## Accessibility
Keyboard, visible focus, screen-reader labels, reduced-motion support, 4.5:1 contrast, large timer, printable summary. Never depend on colour alone to identify facts/assumptions.

## Security
Any participant issue text goes to local browser only by default. Display explicit note to sanitize sensitive information. No server storage and no implicit upload. Use CSP where practical; avoid dangerous HTML injection.

## Non-goals (v1)
Live agent orchestration; multiuser sync; external Strata embedding; cloud infra; live polling; Teams/SharePoint API integration; bespoke process mining; agent sentiment or intelligence scoring.
