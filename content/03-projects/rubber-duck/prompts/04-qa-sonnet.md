# Session 4 — Sonnet 5 — End-to-end testing, offline and accessibility

Read `tests/acceptance-checklist.md` plus current code and previous commit logs. Focus on defects, not feature expansion.

1. Execute clean install (if corporate-approved), typecheck, lint, unit tests and production build.
2. Write/run browser-level tests for mission controls, timer resume after tab background, responsive participant UI, keyboard flow, reduced motion, clipboard denied, Passport validation/import/export and local clear/reset.
3. Inspect production build for remote network calls, accidental credentials, surprise storage or analytics.
4. Simulate offline at runtime. Check that instructions, prompts and synthetic scenario are bundled, no fetch failures.
5. Check semantics and contrast manually where automated checks cannot establish usability.
6. Walk scripted fictional scenario first WITHOUT reveal, then WITH reveal, verifying the site never relabels speculative content as verified.
7. Update `docs/test-report.md` with command, actual result, failed test identifiers and reproducible instructions. Do not report passing unless observed.
8. Fix only defects required for acceptance; record unresolved limitations.

No deployment or live agent assumptions.
