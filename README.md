# GHA API Workflow

A GitHub Actions automation project that:

- Fetches data from a public REST API using `curl`
- Processes JSON using `jq`
- Converts JSON to YAML using `yq`
- Extracts user names from YAML and generates a JSON file
- Packages all generated files into a ZIP archive
- Uploads the ZIP as a GitHub Actions artifact
- Optionally uploads the ZIP to Amazon S3
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

The workflow creates:

```text
output.zip
```

containing all generated files.

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

GitHub Actions uses UTC.

---

## Dependencies

Installed automatically during workflow execution:

- curl
- jq
- yq (Mike Farah v4.x)
- zip

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
3. Download artifact:

```text
output-zip
```

Artifact contains:

```text
output.zip
```

---

## Optional Amazon S3 Upload

The workflow can upload the generated ZIP file to Amazon S3.

Required GitHub Secrets:

| Secret Name           | Description      |
| --------------------- | ---------------- |
| AWS_ACCESS_KEY_ID     | AWS Access Key   |
| AWS_SECRET_ACCESS_KEY | AWS Secret Key   |
| AWS_REGION            | AWS Region       |
| S3_BUCKET_NAME        | Target S3 Bucket |

Example upload result:

```text
s3://my-bucket/output_2026-05-30_02-10-01.zip
```

---

## Tools Used

- GitHub Actions
- Bash
- curl
- jq
- yq
- ZIP
- Amazon S3

---

## Author

Abhinay Kumar Singh
