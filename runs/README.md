# Run Ledger — AI Powered Turtle

A published article, prompt kit, blog post, tool guide, or documentation page in the AI-powered Turtle knowledge lab

Each run is a YAML file: `runs/run-YYYYMMDD-APT-NNN.yaml`

## ID Prefix: `APT`

Auto-increment from 001. Scan `runs/run-*-APT-*.yaml` for the next available number.

## Task Types

- `research-post`
- `prompt-kit`
- `blog-post`
- `tool-guide`
- `documentation`

## Schema

| Field | Type | Description |
|---|---|---|
| `run_id` | string | `run-YYYYMMDD-APT-NNN` |
| `project` | string | `ai-powered-turtle` |
| `task_id` | string | `APT-NNN` |
| `task_type` | string | See task types above |
| `engine` | string | Who/what did the work (`claude-code`, `local-harness`, `human`, `script`, …) |
| `status` | string | `done`, `pending-response`, `in-progress`, `failed`, `abandoned` |
| `created` | date | ISO 8601 date |
| `human_confirmed` | bool | `false` until a human reviews and approves the output |
| `human_notes` | string | Optional review notes |
| `output_artifact` | string | Path to output file or artefact |
| `failure_reason` | string | Populated when status is `failed` |

## Example Entry

```yaml
run_id: run-2026-07-01-APT-001
project: ai-powered-turtle
task_id: APT-001
task_type: research-post
engine: claude-code
status: done
created: "2026-07-01"
human_confirmed: false
human_notes: ""
output_artifact: ""
failure_reason: ""
```

## Notes

- `human_confirmed: true` must be set by a human after reviewing the output — never by automation.
- This ledger is read by `hekton-status.sh` for cross-project dashboard aggregation.
- Re-generate: `just standardise-ledger -- --project ai-powered-turtle --force`
