# QA CI/CD Pipeline

Pipeline de integración continua y despliegue continuo para todos los proyectos de testing QA.

## Características

- **Multi-test**: Ejecuta todos los tipos de testing
- **Automático**: Se ejecuta en cada push/PR
- **Nightly**: Ejecución completa nocturna
- **Reports**: Generación automática de reportes
- **Notifications**: Notificaciones en Slack

## Pipelines disponibles

### 1. QA Pipeline ( Principal)
Se ejecuta en cada push y PR:
- Unit Tests (Karate)
- API Tests (Karate + Rest Assured)
- UI Tests (Playwright + Cypress)
- Performance Tests (k6)
- Generación de reporte consolidado

### 2. Nightly Tests
Ejecución completa de regresión:
- Todos los tests de API
- Todos los tests de UI
- Reporte Allure
- Deploy a GitHub Pages

## Configuración

### Secrets necesarios

| Secret | Descripción |
|--------|-------------|
| `SLACK_WEBHOOK_URL` | Webhook de Slack para notificaciones |

### Variables de entorno

| Variable | Valor |
|----------|-------|
| `JAVA_VERSION` | 21 |
| `NODE_VERSION` | 20 |

## Ejecución local

```bash
# Ejecutar todos los tests
./scripts/run-all-tests.sh

# Ejecutar pipeline específico
./scripts/run-api-tests.sh
./scripts/run-ui-tests.sh
./scripts/run-performance-tests.sh
```

## Estructura

```
qa-ci-cd-pipeline/
├── .github/workflows/
│   ├── qa-pipeline.yml
│   └── nightly-tests.yml
├── scripts/
│   └── run-all-tests.sh
└── README.md
```

## Badges

Agrega estos badges a tu README principal:

```markdown
![QA Pipeline](https://github.com/usuario/repo/actions/workflows/qa-pipeline.yml/badge.svg)
![Nightly Tests](https://github.com/usuario/repo/actions/workflows/nightly-tests.yml/badge.svg)
```
