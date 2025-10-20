# ADR-002: File-based telemetry for MVP

Date: 18 Oct 2025 • Status: Accepted

## Context
We need to show progress quickly. A service/API is heavier and slower to agree.

## Decision
Store baselines and results as CSVs in the repo. Use Actions to refresh `dashboard.csv`. Consider an ingestion API later if needed.

## Consequences
- Fast to start; auditable via Git.
- Some manual work for outliers; acceptable in MVP.
