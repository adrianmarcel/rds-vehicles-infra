# 🚀 Terraform para Criação de RDS na AWS

Este repositório contém um conjunto de scripts **Terraform** responsáveis por provisionar um banco de dados **Amazon RDS** na AWS. O processo de criação é automatizado utilizando **GitHub Actions**, garantindo que toda a infraestrutura seja gerenciada via código.

---

## 🎯 **Objetivo do Repositório**
- Criar uma instância **Amazon RDS (PostgreSQL)** segura e econômica.
- Utilizar **Terraform** para gerenciar a infraestrutura como código.
- Automatizar a implantação do banco de dados via **GitHub Actions**.
- Permitir que aplicações externas (como uma aplicação Java) se conectem ao banco de dados.

---

## 📂 **Estrutura do Projeto**

```
/
├── .github/workflows/
│   ├── terraform-deploy.yml  # Pipeline de automação com GitHub Actions
├── terraform/
│   ├── main.tf               # Definição dos recursos AWS
│   ├── variables.tf          # Definição das variáveis
│   ├── terraform.tfvars      # Valores padrão para as variáveis
│   ├── outputs.tf            # Saídas do Terraform
│   ├── provider.tf           # Configuração do provider AWS
├── README.md                 # Documentação do projeto
```

---

## ⚙️ **Como Funciona**
### 1️⃣ **Configurar Secrets no GitHub**
Para garantir segurança, crie os seguintes **secrets** no GitHub (Configurações ➝ Secrets and variables ➝ Actions):

| Nome                   | Descrição |
|------------------------|------------|
| `AWS_ACCESS_KEY_ID`    | Chave de acesso AWS |
| `AWS_SECRET_ACCESS_KEY`| Chave secreta AWS |
| `AWS_REGION`           | Região AWS (ex: `us-east-2`) |
| `DB_USERNAME`          | Usuário do banco |
| `DB_PASSWORD`          | Senha do banco |

---

### 2️⃣ **Executar o Terraform Manualmente**
Caso precise rodar o Terraform localmente, use:
```sh
terraform init
terraform plan
terraform apply -auto-approve
```
Para destruir a infraestrutura:
```sh
terraform destroy -auto-approve
```

---

### 3️⃣ **Pipeline Automatizado (GitHub Actions)**
Quando um novo código é enviado para a branch `main`, o GitHub Actions executa:
1. **Inicializa o Terraform** (`terraform init`)
2. **Valida a configuração** (`terraform validate`)
3. **Gera um plano de execução** (`terraform plan`)
4. **Aplica as mudanças** (`terraform apply -auto-approve`)

---

## 🎯 **Saídas do Terraform**
Após a execução, o Terraform exibirá o **endpoint do RDS**, que pode ser usado para conectar ao banco de dados:
```sh
Outputs:
rds_endpoint = "vehicles-rds.abcdefg123.us-east-2.rds.amazonaws.com"
```

---

## 🛠 **Personalização**
Caso queira mudar a versão do banco ou a configuração do RDS, edite o arquivo `terraform/main.tf`.

Exemplo para mudar a versão do PostgreSQL:
```hcl
engine_version = "14.5"
```

---

## 📌 **Contato**
Se precisar de ajuda, abra uma issue neste repositório. 🚀