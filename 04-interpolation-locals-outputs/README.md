# Documentação Básica: Interpolação, Locals e Outputs no Terraform

Este projeto demonstra conceitos fundamentais do Terraform, incluindo interpolação de variáveis, uso de `locals` e definição de `outputs`. Os exemplos abaixo utilizam arquivos reais do diretório `04-interpolation-locals-outputs/` deste repositório.

## 1. Interpolação

A interpolação permite inserir valores de variáveis, outputs ou recursos diretamente em strings. No Terraform, isso é feito usando a sintaxe `${}`.

**Exemplo:**
No arquivo [`main.tf`](04-interpolation-locals-outputs/main.tf):

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "Instance-${var.env}"
  }
}
```

Neste exemplo, o nome da instância utiliza interpolação para incluir o valor da variável `env`.

## 2. Locals

O bloco `locals` permite criar variáveis locais para reutilização de valores ou expressões.

**Exemplo:**
No arquivo [`locals.tf`](04-interpolation-locals-outputs/locals.tf):

```hcl
locals {
  common_tags = {
    Project = "TerraformBasics"
    Owner   = "alexandre-junior"
  }
}
```

Essas tags podem ser reutilizadas em recursos:

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-${var.env}"
  tags   = local.common_tags
}
```

## 3. Outputs

Outputs são usados para expor valores após a aplicação do plano Terraform, facilitando o acesso a informações importantes.

**Exemplo:**
No arquivo [`outputs.tf`](04-interpolation-locals-outputs/outputs.tf):

```hcl
output "instance_ip" {
  description = "O IP público da instância EC2"
  value       = aws_instance.example.public_ip
}
```

Após aplicar o Terraform, o IP público da instância será exibido como output.

---

## Resumo

- **Interpolação:** Insere valores dinâmicos em strings.
- **Locals:** Define variáveis locais reutilizáveis.
- **Outputs:** Expõe valores importantes após o provisionamento.

Consulte os arquivos do diretório `04-interpolation-locals-outputs/` para exemplos completos e adaptáveis ao seu uso.
