# 🌱 Terraform — Infrastructure as Code

[![GitHub Repo stars](https://img.shields.io/github/stars/Sheersh123/Terraform?style=for-the-badge)](https://github.com/Sheersh123/Terraform/stargazers)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.3-blue?style=for-the-badge)](https://www.terraform.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](./LICENSE)
[![Open Issues](https://img.shields.io/github/issues/Sheersh123/Terraform?style=for-the-badge)](https://github.com/Sheersh123/Terraform/issues)

A clean, modular, and reusable collection of Terraform code and examples to help you provision cloud infrastructure consistently. Designed for clarity, best practices, and easy extension.

---

Table of Contents
- About
- Features
- Repository Layout
- Quick Start
- Usage Examples
- Variables & Outputs
- Recommended Workflows & Best Practices
- Testing & CI
- Contributing
- License
- Contact

---

About
-----
This repository provides modular Terraform components, example stacks, and conventions for provisioning cloud infrastructure (AWS / Azure / GCP — provider-specific modules should live under the modules/ directory). It's ideal as a starting point for experiments, demos, or production-ready templates after customization.

Features
--------
- Clear, opinionated layout for modules, root configs, and examples
- Example environments (dev/test/prod) with best-practice state/backends
- Reusable modules with documented inputs and outputs
- Recommended linting, formatting, and CI checks
- Guidance for secret management and remote state locking

Repository Layout
-----------------
Example directory structure (this repo may vary):
- modules/                — Reusable Terraform modules (networking, compute, db, etc.)
- examples/               — Complete example stacks showing how to use modules
- envs/                   — Environment-specific root configs (dev, prod, staging)
- scripts/                — Helpful tooling scripts (bootstrap, helpers)
- .github/workflows/      — CI workflows (lint, fmt, plan checks)
- README.md               — You are here
- LICENSE

Quick Start
-----------
Prerequisites
- Terraform >= 1.0 (pin exact version in your CI)
- Optional: AWS CLI / Azure CLI / Google Cloud SDK configured
- Recommended: git, jq

Clone the repo
```bash
git clone https://github.com/Sheersh123/Terraform.git
cd Terraform
```

Initialize and plan (from a chosen example or env)
```bash
cd examples/simple-webapp
terraform init
terraform fmt -check
terraform validate
terraform plan -out=tfplan
# Review the plan
terraform show -json tfplan | jq .
```

If you want to apply (careful — this will create resources)
```bash
terraform apply "tfplan"
```

Usage Examples
--------------
Minimal example (examples/simple-webapp/main.tf):
```hcl
module "vpc" {
  source = "../../modules/vpc"
  name   = "example-vpc"
  cidr   = "10.0.0.0/16"
}

module "web" {
  source = "../../modules/webserver"
  vpc_id = module.vpc.id
  count  = 2
}
```

Module pattern (modules/webserver/README.md should document inputs/outputs):
- Inputs: instance_type, ami, vpc_id, subnet_ids, ssh_key
- Outputs: instance_ids, lb_dns_name

Variables & Outputs
-------------------
Keep a variables.tf for each root/module documenting defaults and descriptions. Example snippet:

```hcl
variable "region" {
  description = "Cloud region to create resources in"
  type        = string
  default     = "us-east-1"
}

output "lb_dns" {
  description = "The load balancer DNS name"
  value       = aws_lb.main.dns_name
}
```

Recommended Workflows & Best Practices
-------------------------------------
- Use remote state (S3/GCS/AzureBlob) with state locking (DynamoDB/Cloud Storage locks)
- Pin provider and Terraform versions in required_providers / required_version
- Keep secrets out of Terraform files — use secret managers (AWS Secrets Manager, Vault) or encrypted variable stores
- Use workspaces or separate state files for environments (dev/staging/prod)
- Format and lint: `terraform fmt`, `tflint`, `checkov` or `terrascan` for policy checks
- Review plans in PRs using `terraform plan -out=plan` and `terraform show -json plan` for CI integration

CI / Testing
------------
Suggested checks to run in CI:
- terraform fmt -check
- terraform validate
- tflint
- terraform init & plan (on PRs)
- Optional: unit/integration tests via Terratest (Go) or kitchen-terraform

Example GitHub Actions snippet (for PR plan):
```yaml
name: Terraform PR
on: [pull_request]
jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2
      - run: terraform fmt -check
      - run: terraform init -backend=false
      - run: terraform validate
      - run: terraform plan -out=tfplan
```

Contributing
------------
Contributions are welcome! Please:
1. Open an issue to discuss major changes.
2. Fork the repository and create a feature branch.
3. Keep changes small and focused; add tests/examples where applicable.
4. Follow the existing module patterns and update module README files.
5. Submit a pull request with a clear description of intent and testing performed.

Code of Conduct
---------------
This project follows a Code of Conduct. Be kind and respectful in all interactions.

License
-------
This repository is available under the MIT License. See the LICENSE file for details.

Credits & Contact
-----------------
Maintainer: Sheersh123  
If you want this README adjusted (custom badges, provider-specific examples, or a repo push), tell me which environment or modules you want emphasized and I’ll update it.

Appendix — Useful Commands
--------------------------
- Format: terraform fmt -recursive
- Validate: terraform validate
- Lint: tflint
- Check: checkov -d .
- Plan: terraform plan -out=tfplan
- Apply: terraform apply tfplan