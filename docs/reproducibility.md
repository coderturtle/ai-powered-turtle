# Reproducibility

## Target

The project should be reproducible on a blank Hekton machine with Node.js 20+ and npm 9.3.1+.

## Scripts

- `scripts/check-prereqs.sh`: verifies local tool availability.
- `scripts/bootstrap-project.sh`: installs npm dependencies.
- `scripts/verify-project.sh`: performs lightweight structural checks and runs npm validation when dependencies are present.

## Rebuild Flow

```bash
scripts/check-prereqs.sh
scripts/bootstrap-project.sh
scripts/verify-project.sh
```

## Notes

The adoption session did not install dependencies or run project-specific checks. That should happen in a later session after content/publication posture is reviewed.
