# ADR-001: Use Backstage as the Experiment Hub

Date: 18 Oct 2025  
Status: Accepted

## Context
We need a light way to coordinate experiments across regions without a new platform.

## Decision
Use Backstage for the registry, templates, docs and scorecards. Keep GitHub as source of truth for artefacts.

## Consequences
- Low effort to onboard teams (Backstage already in place).
- Simple permission model tied to groups.
- Avoids building a separate portal.
