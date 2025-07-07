# Combined Project Outline: Azure Infrastructure with CI/CD Automation

## 1. Project Goal
- Deploy a multi-tier Azure infrastructure (web app, database, storage, networking) using Terraform.
- Automate deployment with a GitHub Actions CI/CD pipeline, with optional Azure DevOps pipeline.
- Demonstrate Git proficiency through branching and PR workflows.
- Showcase skills in Terraform, Azure, networking, CI/CD, and Git for the Cloud Engineer II/III role.

## 2. Key Components
- **Infrastructure**: Azure vNet with subnets, NSGs, load balancer, App Service (web tier), Azure SQL Database (data tier), and storage account (Terraform state).
- **Automation**: GitHub Actions workflow to lint, validate, plan, and apply Terraform code, secured with GitHub Secrets.
- **Git Workflow**: Use main/dev/feature branches and PRs to manage code.
- **Optional**: Azure DevOps pipeline to replicate GitHub Actions functionality.
- **Showcase**: Public GitHub repo with README, network diagram, and pipeline screenshots.

## 3. High-Level Steps
### Step 1: Set Up GitHub Repository
- Create a public repo (`azure-infra-cicd`).
- Initialize with `main` branch and `.gitignore` for Terraform.
- Set up branches: `main` (production), `dev` (integration), `feature/*` (development).
- Create a README with project overview and placeholders for documentation.

### Step 2: Design Multi-Tier Infrastructure with Terraform
- **Structure**: Organize code into modules (`networking`, `webapp`, `database`, `storage`).
- **Components**:
  - Networking: vNet, subnets, NSGs, load balancer.
  - Web App: App Service with free-tier plan.
  - Database: Azure SQL Database with server.
  - Storage: Storage account for Terraform state.
- **Tasks**:
  - Write modular Terraform code.
  - Test locally using Azure free trial or Microsoft Learn Sandbox.
  - Store state in Azure storage account.
  - Commit to a feature branch (`feature/infra`) and submit PR to `dev`.

### Step 3: Automate with GitHub Actions
- Create a workflow (`.github/workflows/terraform.yml`) to:
  - Trigger on push to `main`/`dev` or PRs to `dev`.
  - Run Terraform linting (`tflint`), format, validate, plan, and apply (on `main` push).
- Secure credentials using GitHub Secrets (Azure service principal).
- Test pipeline with PRs and verify deployment on `main`.
- Document pipeline in README with screenshot of successful run.

### Step 4: (Optional) Add Azure DevOps Pipeline
- Create an Azure DevOps project and connect to GitHub repo.
- Write `azure-pipelines.yml` to replicate GitHub Actions (lint, validate, plan, apply).
- Store credentials in pipeline variables or Azure Key Vault.
- Document with screenshot in README.

### Step 5: Document and Showcase
- Update README with:
  - Project overview and architecture diagram (vNet, App Service, SQL, storage).
  - Setup instructions (Azure setup, Terraform, secrets).
  - Pipeline details (triggers, steps, security).
  - Screenshots of GitHub Actions (and Azure DevOps) runs.
- Practice explaining the project for the interview, focusing on:
  - Infrastructure design (networking, modularity).
  - CI/CD automation (linting, PR triggers).
  - Git workflow (branching, PRs).
  - Alignment with job requirements (network automation, CI/CD, team fit).

## 4. Skills Covered
- **Terraform**: Modular code, state management.
- **Azure**: IaaS/PaaS (App Service, SQL), networking (vNet, NSGs, load balancer).
- **CI/CD**: GitHub Actions, Azure DevOps (optional).
- **Git**: Branching, PRs, conflict resolution.
- **Documentation**: README, network diagram, communication skills.

## 5. Timeline
- **Day 1**: Set up repo, write/test networking and storage Terraform modules (4–6 hours).
- **Day 2**: Complete web app and database modules, test infrastructure, commit/PR (4–6 hours).
- **Day 3**: Set up and test GitHub Actions workflow, document pipeline (3–4 hours).
- **Day 4**: Finalize README, create network diagram, add screenshots (1–2 hours).
- **Day 5 (Optional)**: Implement/test Azure DevOps pipeline, update documentation (2–3 hours).

## 6. Deliverables
- GitHub repo with:
  - Modular Terraform code for multi-tier infrastructure.
  - GitHub Actions workflow for CI/CD.
  - README with architecture diagram, setup instructions, and pipeline screenshots.
- (Optional) Azure DevOps pipeline YAML and screenshot.
- Talking points for interview (infrastructure design, automation, Git workflow).

## 7. Interview Alignment
- **Technical Skills**: Demonstrates Terraform, Azure, networking, CI/CD, and Git proficiency.
- **Networking Role**: vNet, NSGs, and load balancer align with network automation needs.
- **Soft Skills**: Clear documentation and presentation show collaboration and communication.
- **Portfolio**: Single, polished repo to showcase end-to-end solution.