# GHA API Workflow

A GitHub Actions automation project that:

- Fetches data from a public REST API using `curl`
- Processes JSON using `jq`
- Converts JSON to YAML using `yq`
- Extracts user names from YAML and generates a JSON file
- Installs and verifies required dependencies automatically
- Includes `moreutils` (`sponge`) for future enhancements
- Captures detailed workflow execution logs
- Uploads generated outputs and logs as a GitHub Actions artifact
- Supports both manual and scheduled execution

---

# Project Structure

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

# Workflow Overview

## Script 1: api_fetch.sh

This script:

1. Calls the public REST API:

```text
https://jsonplaceholder.typicode.com/users
```

2. Generates the following files:

```text
output/
├── users.json
├── users_pretty.json
├── users_summary.json
└── users.yaml
```

---

## Script 2: extract_names.sh

This script:

1. Reads:

```text
output/users.yaml
```

2. Extracts all user names

3. Generates:

```text
output/user_names.json
```

---

# Generated Output

After successful execution:

```text
output/
├── users.json
├── users_pretty.json
├── users_summary.json
├── users.yaml
└── user_names.json
```

---

# Workflow Logging

The workflow automatically captures detailed logs for troubleshooting and auditing.

Generated log files:

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
└── full_execution.log
```

---

## Log File Details

| Log File               | Description                             |
| ---------------------- | --------------------------------------- |
| workflow_info.log      | Workflow metadata and execution details |
| apt_update.log         | apt package update output               |
| dependency_install.log | Dependency installation logs            |
| yq_install.log         | yq installation logs                    |
| tool_verification.log  | Installed tool versions                 |
| api_fetch.log          | API fetch script output                 |
| extract_names.log      | User name extraction script output      |
| output_listing.log     | Generated file listing                  |
| full_execution.log     | Consolidated workflow execution log     |

---

# GitHub Actions Triggers

## Manual Execution

Run manually from:

```text
Repository
→ Actions
→ API Automation Workflow
→ Run Workflow
```

---

## Scheduled Execution

Automatically runs every month:

```text
30th Day
02:10 AM IST
```

GitHub Actions cron schedule:

```yaml
cron: "40 20 29 * *"
```

### Time Conversion

| Timezone | Execution Time |
| -------- | -------------- |
| UTC      | 20:40 on 29th  |
| IST      | 02:10 on 30th  |

> Note: GitHub Actions scheduled workflows may occasionally start a few minutes later than the scheduled time.

---

# Dependencies

Installed automatically during workflow execution:

| Package   | Purpose                     |
| --------- | --------------------------- |
| curl      | API calls                   |
| jq        | JSON processing             |
| yq        | YAML processing             |
| zip       | Compression utilities       |
| moreutils | Additional Unix utilities   |
| sponge    | Safe file overwrite utility |

No manual installation is required when running through GitHub Actions.

---

# Running Locally

## Make Scripts Executable

```bash
chmod +x scripts/api_fetch.sh
chmod +x scripts/extract_names.sh
```

## Execute Scripts

```bash
./scripts/api_fetch.sh
./scripts/extract_names.sh
```

Generated files will be created in:

```text
output/
```

---

# GitHub Actions Artifact

After workflow completion:

1. Open GitHub Actions
2. Select the workflow run
3. Download artifact:

```text
api-workflow-output
```

---

# Artifact Contents

After downloading and extracting the artifact:

```text
api-workflow-output/
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
    └── full_execution.log
```

---

# Viewing Workflow Logs

Logs can be viewed directly in GitHub:

```text
Repository
→ Actions
→ Workflow Run
→ Job Details
```

The same information is also available in the downloaded log files.

---

# Tool Verification

The workflow verifies installed tools during execution:

```bash
jq --version
yq --version
which sponge
zip -v
```

Verification results are stored in:

```text
logs/tool_verification.log
```

---

# Future Enhancements

Potential improvements:

- Amazon S3 Upload
- Email Notifications
- Slack Notifications
- Microsoft Teams Notifications
- Release Packaging
- Artifact Retention Policies
- Multi-Environment Deployments
- API Health Monitoring
- Automated Reporting

---

# Tools Used

- GitHub Actions
- Bash
- curl
- jq
- yq
- moreutils
- sponge
- ZIP

---

# Author

**Abhinay Kumar Singh**
