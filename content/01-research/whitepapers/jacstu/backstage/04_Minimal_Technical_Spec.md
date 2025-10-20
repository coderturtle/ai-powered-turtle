---
title: Minimal Technical Spec
---

# Minimal technical spec

## Backstage
- New plugin `@yourorg/plugin-jacquard`
  - Hub page: catalogue table (filters: Category, Framework, Lifecycle, Owner).
  - Detail page: PRFAQ preview; Baseline card; Results card; Policy list.
- Custom kind `Experiment` (apiVersion `jacquard.backstage.io/v1alpha1`).
- Scaffolder template `jacquard-new-experiment` (repo seed + PRFAQ + labels).
- TechDocs for playbooks and hub index.
- Tech Insights checks:
  - `baseline_present` (true/false)
  - `three_measures_only`
  - `comparison_recorded`
  - `controls_referenced`

## GitHub
- Repo: `experiments-hub`
  - `hybrid-experiments/{baselines.csv,dashboard.csv}`
  - `ai-tool-experiments/{baselines.csv,dashboard.csv}`
  - `.github/workflows/build-dashboards.yml`
  - PR/Issue templates for PRFAQ and Evidence Pack.

## Data schema
- `baselines.csv`: experiment_id, category, metric, baseline_value, date_collected, data_source, team_size, domain
- `dashboard.csv`: experiment_id, owner, framework, category, metric, delta_pct, composite_score, tags, last_updated

## Controls
- Policy codes referenced on each experiment (e.g., SEC-012, POL-AI-004, GOV-EXP-002).
