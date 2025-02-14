# 🚀 Terraform AWS Infrastructure

## 📌 Overview
This project provides reusable Terraform modules to deploy infrastructure on AWS, including:
- **VPC** with public and private subnets.
- **EC2** instance within the VPC.
- **RDS** database instance in private subnets.
- **Security Groups** dynamically managed using `tfvars`.

---

## 📋 Prerequisites
Before using this project, ensure you have:
1. **Terraform v1.6+** installed → [Download Terraform](https://www.terraform.io/downloads)
2. **AWS CLI** installed and configured (`aws configure`).
3. **AWS IAM permissions** to create VPCs, EC2 instances, RDS databases, and security groups.
4. **Remote State Backend:** Ensure an **S3 bucket** is existing

---

## 🛠️ How to Use the Modules

### Clone the Repository
```bash
git clone https://github.com/your-repo/spinbet.git
cd spinbet
```

### Directory Structure
This project defines an AWS infrastructure using Terraform. It leverages modular design principles to provision a **VPC, EC2 instance, RDS database, and security groups**.

#### 📂 Project Directory Structure
```
spinbet/
├── tfvars/                      # Stores environment-specific tfvars files
│   ├── <project>_dev.tfvars     # Terraform variables for the dev environment
│   ├── <project>_prod.tfvars    # Terraform variables for the prod environment
│   ├── <project>_staging.tfvars # Terraform variables for the staging environment
├── modules/                  # Terraform modules for reusable components
│   ├── foundational/         # VPC, subnets, and security groups
│   │   ├── main.tf           # Defines the VPC and subnets
│   │   ├── variables.tf      # Module-specific variables
│   │   ├── outputs.tf        # Outputs for foundational module
│   ├── services/
│   │   ├── ec2/              # EC2 module
│   │   │   ├── main.tf       # EC2 instance configuration
│   │   │   ├── variables.tf  # EC2 module variables
│   │   │   ├── outputs.tf    # EC2 module outputs
│   │   ├── rds/              # RDS module
│   │   │   ├── main.tf       # RDS instance configuration
│   │   │   ├── variables.tf  # RDS module variables
│   │   │   ├── outputs.tf    # RDS module outputs
├── scripts/                  # Helper scripts for Terraform automation
│   ├── apply.sh              # Automated Terraform apply script
├── main.tf                   # Root Terraform configuration
├── variables.tf              # Root module variables
├── outputs.tf                # Terraform outputs
├── terraform.tfstate         # Terraform state file (remote backend recommended)
├── tags.tf                   # Tags configuration
└── README.md                 # Project documentation
```

### Configure tvars
Modify the environments/project_environment.tfvars file for different environments.
Example (project_dev.tfvars)

### Apply the Configuration (Using apply.sh Script)
```
./scripts/apply.sh <project>_<environment> 
```
# spinbet-task1
