# Tenant and corporate deployment spike

## First 30-minute reconnaissance (no changing policy)
1. Confirm Node/npm availability, approved local dev paths, corporate browser, ability to run localhost and build Vite.
2. In Copilot, create a temporary test personal agent with *one* native skill. Note exact authoring/import mechanism, file requirements, permitted knowledge, limits.
3. Invoke skill with a known synthetic test; verify skill followed, output schema, and skill discoverability.
4. Test whether a colleague can access the same personal agent **without sharing sensitive sample content**; record outcome, no assumption.
5. Check whether a single participant with a standalone prompt in Copilot Chat can complete mission even without agent access.
6. Check internal static hosting and approved collection channel independently; don't make these prerequisites.

## Installation paths
A. Personal agents + native skills available to attendees: create and validate each agent and skill in approved tenant authoring interface; share only using tenant-approved mechanisms.
B. Skills exist only for author: run instructor demonstrations using native skills; participants use standalone prompts, or have them create their own personal agents if practical and permitted.
C. Skills intermittently inaccessible: launch standalone prompt from website. Avoid live troubleshooting with group watching.

## Native skill packaging caveat
Files in `skills/*/SKILL.md` are content-oriented draft skill instructions. Claude Code must inspect what the **actual** Copilot personal-agent skill importer requires before claiming direct deployability. Modify metadata/layout to tenant format while preserving behaviour, examples and safety contract. No guessed API automation or publish endpoint.

## Site release
- Build and test static output; print/check manifests and package lockfile, review dependencies and vulnerabilities per corporate policy.
- Serve locally using approved means or deploy to approved internal static hosting. Do not open arbitrary local ports if prohibited.
- Test access from a second participant device. If no access, use static printed instructions/QR to approved Copilot and facilitator projected site.
- Record known limitations and offline plan before event.
