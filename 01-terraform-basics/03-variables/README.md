# Documentação Básica: Uso de Variáveis de Ambiente no Terraform

Este exemplo demonstra como utilizar variáveis de ambiente em um projeto Terraform.

## Estrutura dos Arquivos

- `main.tf`: Define os recursos e utiliza variáveis.
- `variables.tf`: Declara as variáveis utilizadas.
- `terraform.tfvars`: Define valores para as variáveis.

## Exemplo de Uso

1. **Defina as variáveis em `variables.tf`:**

```hcl
variable "aws_region" {}
variable "instance_ami" {}
variable "instance_type" {}
variable "instance_tags" {}
```

2. **Atribua valores em `terraform.tfvars` ou via variáveis de ambiente:**

Exemplo em `terraform.tfvars`:

```hcl
aws_region    = "us-east-1"
instance_ami  = "ami-12345678"
instance_type = "t2.micro"
instance_tags = {
  Name = "Exemplo"
}
```

Ou defina via variáveis de ambiente (prefixo `TF_VAR_`):

```sh
export TF_VAR_aws_region="us-east-1"
export TF_VAR_instance_ami="ami-12345678"
export TF_VAR_instance_type="t2.micro"
export TF_VAR_instance_tags='{ "Name": "Exemplo" }'
```

3. **Execute o Terraform normalmente:**

```sh
terraform init
terraform plan
terraform apply
```

Assim, o Terraform irá utilizar os valores definidos nas variáveis de ambiente ou no arquivo `terraform.tfvars`.
