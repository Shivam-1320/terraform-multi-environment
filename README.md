<img src="https://avatars.githubusercontent.com/u/101424800?v=4" width="80" align="left" />

**Terraform Multi-Environment Infrastructure**

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazonaws&logoColor=white)
![Environment](https://img.shields.io/badge/Environment-Dev%20%7C%20Stage%20%7C%20Prod-success)
![Remote State](https://img.shields.io/badge/State-Remote-blue)
![S3 Backend](https://img.shields.io/badge/Backend-S3-569A31?logo=amazons3&logoColor=white)
![DynamoDB](https://img.shields.io/badge/Locking-DynamoDB-4053D6?logo=amazondynamodb&logoColor=white)
![EC2](https://img.shields.io/badge/Compute-EC2-FF9900?logo=amazonaws&logoColor=white)
![VPC](https://img.shields.io/badge/Networking-VPC-orange)
![Modules](https://img.shields.io/badge/Terraform-Modules-purple)
![Makefile](https://img.shields.io/badge/Automation-Makefile-brightgreen)
![GitHub](https://img.shields.io/badge/GitHub-shivam--1320-blue?logo=github)

#

> **Author:**  Pankaj Baghel

> **GitHub:**  shivam-1320

A Terraform project demonstrating infrastructure provisioning across multiple environments using reusable modules, remote state management, and environment separation.

This project was built to practice real-world Terraform concepts such as:

* Infrastructure as Code (IaC)
* Terraform Modules
* Environment Separation (Dev, Stage, Prod)
* Remote State Management
* State Locking with DynamoDB
* AWS Networking and Compute Resources
* Terraform Project Structure Best Practices

---

## Project Structure

```text
terraform-multi-environment/
├── Makefile
├── README.md
│
├── bootstrap/
│   ├── backend_bucket.tf
│   ├── dynamodb_locking.tf
│   └── terraform.tfstate
│
├── environments/
│   ├── dev/
│   ├── stage/
│   └── prod/
│
├── modules/
│   ├── ec2/
│   └── vpc/
│
└── .gitignore
```

---

## Architecture

```text
Bootstrap
│
├── S3 Backend Bucket
└── DynamoDB Lock Table

        │
        ▼

Environments
│
├── Dev
├── Stage
└── Prod

        │
        ▼

Reusable Modules
│
├── VPC Module
└── EC2 Module
```

---

## Features

### Bootstrap Infrastructure

The bootstrap configuration creates shared backend resources:

* S3 Bucket for Terraform State Storage
* DynamoDB Table for State Locking

These resources are created once and reused across all environments.

---

### Multi-Environment Design

The project separates infrastructure into:

| Environment | Purpose                   |
| ----------- | ------------------------- |
| Dev         | Development and testing   |
| Stage       | Pre-production validation |
| Prod        | Production workloads      |

Each environment maintains its own:

* Backend Configuration
* Variables
* State File
* Resource Configuration

---

### Reusable Terraform Modules

#### VPC Module

Responsible for:

* VPC Creation
* Networking Components
* Reusable Network Configuration

#### EC2 Module

Responsible for:

* EC2 Instance Creation
* Compute Configuration
* Instance Outputs

---

## Remote State Configuration

Terraform state is stored remotely using:

### S3 Bucket

Used for:

* State Storage
* Versioning
* Centralized Management

### DynamoDB

Used for:

* State Locking
* Preventing Concurrent Modifications
* Safe Team Collaboration

---

## Backend Layout

```text
terraform-state-bucket/

├── dev/terraform.tfstate
├── stage/terraform.tfstate
└── prod/terraform.tfstate
```

All environments share:

```text
terraform-locks
```

DynamoDB lock table.

---

## Environment Deployment

### Development

```bash
cd environments/dev

terraform init
terraform plan
terraform apply
```

### Stage

```bash
cd environments/stage

terraform init
terraform plan
terraform apply
```

### Production

```bash
cd environments/prod

terraform init
terraform plan
terraform apply
```

---


## Makefile

The project includes a Makefile to simplify Terraform operations across environments.

### Examples

```bash
make init ENV=dev
make plan ENV=dev
make apply ENV=dev
make destroy ENV=dev
```

Replace `dev` with `stage` or `prod` as needed.

### Benefits

* Run Terraform commands from the project root
* Consistent workflow across environments
* Simplifies day-to-day infrastructure management

## Modules

### EC2 Module

Inputs:

* AMI ID
* Instance Type
* Instance Name

Outputs:

* Instance ID
* Public IP
* Public DNS

---

### VPC Module

Inputs:

* CIDR Block
* Environment Name

Outputs:

* VPC ID
* Subnet IDs

---

## Learning Objectives

This project was created to gain hands-on experience with:

* Terraform Fundamentals
* Terraform Modules
* Remote State Management
* State Locking
* AWS EC2
* AWS VPC
* Infrastructure Design
* Multi-Environment Deployments

---

## Future Improvements

Planned enhancements:

* Security Group Module
* Application Load Balancer (ALB)
* Auto Scaling Groups
* Route53 Integration
* GitHub Actions CI/CD
* Terraform Workspaces Comparison
* Monitoring and Alerting
* SSL/TLS Automation

---

## Security Notes

Do not commit:

```text
*.pem
*.ppk
terraform.tfstate
terraform.tfstate.backup
.terraform/
```

Sensitive files should always be excluded using `.gitignore`.

---

## Author

Pankaj Baghel

GitHub: Shivam-1320

Learning Cloud, DevOps, Linux, AWS, and Terraform through hands-on projects and practical labs.
