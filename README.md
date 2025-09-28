# RaffleNow Monorepo

Monorepo para la plataforma de sorteos con 3 ambientes (dev/qa/prod).
Estructura base:

- `iac/` Infraestructura (Terraform)
- `config/` Configuración/automatización (Ansible u otros)
- `app/` Código de la aplicación (frontend, api, workers)

## Flujo de ramas (GitFlow)

- `production` (prod)
- `develop` (dev)
- `feature/*`
- `release/*`
- `hotfix/*`

Commits: **Conventional Commits**.

## Cómo empezar

```bash
nvm use
npm i
```
