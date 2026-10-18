# Acceptance and adversarial test checklist

## Functional
- [ ] `npm ci`, tests and production build succeed on approved work machine.
- [ ] Static dist is self-contained; no CDN/fonts/telemetry/model API.
- [ ] Mission data sums to 105 minutes, current mission/role/exit-gate correct.
- [ ] Timer pause, resume, extend, skip, back, reset and browser hidden/resume behave predictably.
- [ ] Presenter interface readable from projected room; participant view works narrow screen, keyboard and reduced motion.
- [ ] Content can be operated offline (runtime without web network). Document local serving approach.
- [ ] Prompt copy is complete and fails visibly when clipboard denied.
- [ ] Passport import/export passes JSON Schema and Markdown is readable. Invalid data cannot overwrite previous good data.
- [ ] No data is silently sent externally. Clear local data control works.
- [ ] Surprise cards can be accessed without relying on animation or sound.
- [ ] Agent/skill links do not assume publish or share access.

## Agent and skill trials
- [ ] Agent/skill availability and exact invocation proven in actual tenant.
- [ ] Personal agent shareability tested or explicitly marked unavailable.
- [ ] Each of 4 agents follows its limited role; general Copilot standalone prompt alternative works.
- [ ] Agent differentiates source-backed, reported and speculative claims.
- [ ] Case first pass does not see `reveal.md`; after reveal agent corrects earlier diagnosis.
- [ ] Prompt injection in supplied artefact cannot falsely assert 'verified' or skip human gate.
- [ ] No invented metrics, regulatory rules, approvals or ROI.
- [ ] 'summarise now' works despite unfinished discovery.

## Workshop rehearsal
- [ ] Unfamiliar participant completes first three missions unaided.
- [ ] Independent observations captured before initial AI influence.
- [ ] At least one real alternative explanation produced per team.
- [ ] Three distinct interventions, including non-AI simplification.
- [ ] One cheap experiment with measurement and owner.
- [ ] Time budget works for actual team count or pitch compression plan exists.

## Safety
- [ ] Demo files labelled fictional, no real PII/client details.
- [ ] No external Strata request or connector setup in critical path.
- [ ] Team data stays within approved corporate boundaries.
