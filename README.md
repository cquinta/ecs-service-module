# ECS Service Module

Este módulo Terraform permite a criação e gerenciamento de serviços no Amazon ECS (Elastic Container Service) de forma padronizada e reutilizável.

## Descrição

Este módulo facilita a criação de serviços ECS com configurações padronizadas, permitindo a implantação consistente de containers em clusters ECS.

## Requisitos

- Terraform >= 1.0
- AWS Provider
- Um cluster ECS existente
- Task Definition registrada no ECS

## Uso

```hcl
module "ecs_service" {
  source = "./ecs-service-module"

  # Variáveis obrigatórias
  service_name        = "nome-do-servico"
  cluster_id         = "arn:aws:ecs:region:account:cluster/nome-do-cluster"
  task_definition    = "arn:aws:ecs:region:account:task-definition/nome:1"
  desired_count      = 2

  # Variáveis opcionais
  # Adicione conforme necessário
}

