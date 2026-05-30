# GHA API Workflow

A GitHub Actions automation project that:

- Fetches data from a public REST API using `curl`
- Processes JSON using `jq`
- Converts JSON to YAML using `yq`
- Extracts user names from YAML and generates a JSON file
- Uses `moreutils` (`sponge`) for future extensibility
- Captures detailed execution logs
- Packages generated files and logs into a ZIP archive
- Uploads the ZIP as a GitHub Actions artifact
- Uploads workflow logs as a separate artifact
- Supports both manual and scheduled execution

---

## Project Structure

```text
project/
├── .github/
│   └── workflows/
│       └── api-workflow.yml
├── scripts/
│   ├── api_fetch.sh
│   └── extract_names.sh
└── README.md
```

---

## Workflow Overview

### Script 1: api_fetch.sh

Performs the following tasks:

1. Calls the public API:

```text
https://jsonplaceholder.typicode.com/users
```

2. Generates:

```text
output/
├── users.json
├── users_pretty.json
├── users_summary.json
└── users.yaml
```

---

### Script 2: extract_names.sh

Reads:

```text
output/users.yaml
```

Extracts all user names and generates:

```text
output/user_names.json
```

---

## Generated Output

Final output directory:

```text
output/
├── users.json
├── users_pretty.json
├── users_summary.json
├── users.yaml
└── user_names.json
```

---

## Workflow Logging

The workflow captures detailed execution logs during runtime.

Generated logs:

```text
logs/
├── workflow_info.log
├── apt_update.log
├── dependency_install.log
├── yq_install.log
├── tool_verification.log
├── api_fetch.log
├── extract_names.log
├── output_listing.log
├── zip_creation.log
└── full_execution.log
```

### Log Contents

| Log File               | Description                   |
| ---------------------- | ----------------------------- |
| workflow_info.log      | Workflow metadata             |
| apt_update.log         | apt update output             |
| dependency_install.log | Package installation logs     |
| yq_install.log         | yq installation logs          |
| tool_verification.log  | Installed tool versions       |
| api_fetch.log          | API fetch script output       |
| extract_names.log      | Name extraction script output |
| output_listing.log     | Output directory details      |
| zip_creation.log       | ZIP creation logs             |
| full_execution.log     | Consolidated execution log    |

---

## ZIP Package Contents

The workflow creates:

```text
output.zip
```

Containing:

```text
output.zip
├── output/
│   ├── users.json
│   ├── users_pretty.json
│   ├── users_summary.json
│   ├── users.yaml
│   └── user_names.json
└── logs/
    ├── workflow_info.log
    ├── apt_update.log
    ├── dependency_install.log
    ├── yq_install.log
    ├── tool_verification.log
    ├── api_fetch.log
    ├── extract_names.log
    ├── output_listing.log
    ├── zip_creation.log
    └── full_execution.log
```

---

## GitHub Actions Triggers

### Manual Execution

Run manually from:

```text
GitHub Repository
→ Actions
→ API Automation Workflow
→ Run Workflow
```

---

### Scheduled Execution

Runs automatically every month:

```text
30th Day
02:10 AM IST
```

Cron expression:

```yaml
cron: "40 20 29 * *"
```

GitHub Actions schedules are executed in UTC.

---

## Dependencies

Installed automatically during workflow execution:

- curl
- jq
- yq (Mike Farah v4.x)
- zip
- moreutils
  - sponge

No local installation is required for GitHub Actions execution.

---

## Running Locally

Make scripts executable:

```bash
chmod +x scripts/api_fetch.sh
chmod +x scripts/extract_names.sh
```

Run:

```bash
./scripts/api_fetch.sh
./scripts/extract_names.sh
```

Generated files will be created inside:

```text
output/
```

---

## GitHub Actions Artifacts

After workflow completion:

1. Open GitHub Actions
2. Select workflow run

Artifacts available:

### Output Package

```text
output-zip
```

Contains:

```text
output.zip
```

---

### Workflow Logs

```text
workflow-logs
```

Contains:

```text
logs/
```

with all execution logs.

---

## Viewing Execution Logs

GitHub Actions logs can be viewed directly in:

```text
Repository
→ Actions
→ Workflow Run
→ Job Details
```

The workflow also stores the same information in downloadable log files.

---

## Future Enhancements

Potential additions:

- Amazon S3 Upload
- Email Notifications
- Slack Notifications
- Microsoft Teams Notifications
- Versioned Releases
- Automated Cleanup of Old Artifacts
- Multi-Environment Support
- API Health Monitoring

---

## Tools Used

- GitHub Actions
- Bash
- curl
- jq
- yq
- moreutils
- sponge
- ZIP

---

## Author

Abhinay Kumar Singh
