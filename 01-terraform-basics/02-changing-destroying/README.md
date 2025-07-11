# Terraform Tutorial - Changing and Destroying Resources

This tutorial demonstrates how to modify existing resources and destroy them using Terraform with LocalStack.

> **⚠️ Important Note**: LocalStack is intended for **development and testing purposes only**. Never use these configurations in production environments. For production deployments, use real AWS credentials and endpoints.

## Prerequisites

1. Docker and Docker Compose installed
2. Terraform installed (version 1.12.2)
3. LocalStack running

## 1. Initial Setup

### Start LocalStack

```bash
# In the project root
docker-compose up -d localstack

# Check if it's running
docker ps
```

### Verify connectivity

```bash
curl http://127.0.0.1:4566
```

## 2. Initial Resource Creation

### main.tf file structure

```terraform
terraform {
  required_version = "1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://127.0.0.1:4566"
  }
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bucket-by-terraform"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
```

### Initial commands

```bash
# Initialize Terraform
terraform init

# View execution plan
terraform plan

# Apply changes
terraform apply
```

## 3. Modifying Resources (Update)

### Example 1: Changing Tags

Edit the `main.tf` file to modify tags:

```terraform
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bucket-by-terraform"

  tags = {
    Name        = "My Updated Bucket"
    Environment = "Production"  # Changed from "Dev" to "Production"
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team" # New tag added
  }
}
```

### Example 2: Adding Versioning

```terraform
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bucket-by-terraform"

  tags = {
    Name        = "My Updated Bucket"
    Environment = "Production"
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team"
  }
}

# New resource for versioning
resource "aws_s3_bucket_versioning" "my-test-bucket-versioning" {
  bucket = aws_s3_bucket.my-test-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
```

### Applying changes

```bash
# See what will be modified
terraform plan

# Apply modifications
terraform apply

# Check current state
terraform show
```

## 4. Verifying Changes

### See differences before applying

```bash
terraform plan -detailed-exitcode
```

### View current resource state

```bash
terraform show
terraform state list
```

### View specific resource information

```bash
terraform state show aws_s3_bucket.my-test-bucket
```

## 5. Destroying Resources

### Option 1: Destroy everything

```bash
# See what will be destroyed
terraform plan -destroy

# Destroy all resources
terraform destroy
```

### Option 2: Destroy a specific resource

```bash
# Destroy only one resource
terraform destroy -target=aws_s3_bucket.my-test-bucket
```

### Option 3: Remove from state without destroying

```bash
# Remove from Terraform state but keep the resource
terraform state rm aws_s3_bucket.my-test-bucket
```

## 6. Complete Example Workflow

### Step 1: Create initial resource

```bash
terraform init
terraform apply
```

### Step 2: Modify properties

```bash
# Edit main.tf (change tags, add resources, etc.)
terraform plan
terraform apply
```

### Step 3: Verify changes

```bash
terraform show
```

### Step 4: Destroy when no longer needed

```bash
terraform destroy
```

## 7. Best Practices

### Always use plan before apply

```bash
terraform plan -out=tfplan.out
terraform apply tfplan.out
```

### Backup state

```bash
cp terraform.tfstate terraform.tfstate.backup
```

### Check for orphaned resources

```bash
terraform refresh
terraform state list
```

## 8. Useful Commands

| Command                | Description                                  |
| ---------------------- | -------------------------------------------- |
| `terraform init`       | Initialize Terraform directory               |
| `terraform plan`       | Show what will be created/modified/destroyed |
| `terraform apply`      | Apply changes                                |
| `terraform destroy`    | Destroy all resources                        |
| `terraform show`       | Show current state                           |
| `terraform state list` | List all resources in state                  |
| `terraform refresh`    | Update state with real infrastructure        |
| `terraform validate`   | Validate syntax of files                     |

## 9. Checking in LocalStack

### List created buckets

```bash
# If you have awscli-local installed
awslocal s3 ls

# Or via curl
curl http://127.0.0.1:4566/
```

### LocalStack logs

```bash
docker-compose logs -f localstack
```

## Troubleshooting

### Issue: Terraform hangs when creating resources

- Check if LocalStack is running: `docker ps`
- Check logs: `docker-compose logs localstack`
- Test connectivity: `curl http://127.0.0.1:4566`

### Issue: Inconsistent state

```bash
terraform refresh
terraform plan
```

### Issue: Orphaned resources

```bash
terraform import aws_s3_bucket.my-test-bucket bucket-name
```
