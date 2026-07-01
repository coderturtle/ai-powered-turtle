# Risks

## RISK-0001 - Large Authored Content Tree Needs Publication Review

Status: open

The repository contains many Markdown notes under `content/`, including research, prompts, whitepapers, project writeups, dashboards, and scratch material. Review this content before further publication or automated deployment changes.

## RISK-0002 - Deployment Workflows Were Adopted Without Execution

Status: open

The repository includes GitHub Actions workflows. Adoption did not execute or alter them. Review workflow behavior before pushing adoption changes upstream.

## RISK-0003 - Mixed Upstream Licensing Context

Status: open

Both `LICENSE` and `LICENSE.txt` are present. The project should clarify whether Apache-2.0 applies to authored content, whether MIT applies to Quartz-derived code, and how public reuse should be described.
