# Terraform Basics Project

Este repositório contém exemplos básicos de uso do Terraform para provisionamento de infraestrutura como código (IaC). Cada diretório representa um conceito ou funcionalidade fundamental do Terraform, facilitando o aprendizado e a experimentação.

## Estrutura do Projeto

- **01-first-provider/**: Exemplo de configuração do primeiro provider e recursos básicos.
- **02-changing-destroying/**: Demonstra como alterar e destruir recursos gerenciados pelo Terraform.
- **03-variables/**: Uso de variáveis para tornar a infraestrutura mais flexível e reutilizável.
- **04-interpolation-locals-outputs/**: Exemplos de interpolação, uso de locals, outputs e recursos avançados como arquivos auxiliares.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Python 3](https://www.python.org/downloads/) (para uso do ambiente virtual e ferramentas auxiliares)
- [Docker](https://www.docker.com/) (opcional, para testes locais)

## Ambiente Virtual Python

O projeto inclui um `Makefile` para facilitar a criação de um ambiente virtual Python e instalação de dependências auxiliares (como o `awscli-local`).

### Criar o ambiente virtual

```sh
make venv/create
```

### Ativar o ambiente virtual

```sh
source .venv/bin/activate
```

### Remover o ambiente virtual

```sh
make venv/clean
```

## Como Usar Cada Exemplo

Entre no diretório desejado e execute os comandos Terraform:

```sh
cd 01-first-provider # ou outro diretório de exemplo
terraform init
terraform plan
terraform apply
```

Para destruir os recursos criados:

```sh
terraform destroy
```

## Observações

- Os arquivos `terraform.tfstate` e `terraform.tfvars` podem conter informações sensíveis. Não compartilhe esses arquivos publicamente.
- Consulte os arquivos `README.md` dentro de cada subdiretório para instruções específicas de cada exemplo.

## Licença

Este projeto é livre para fins educacionais.
