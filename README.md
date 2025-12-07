
---

# 🚀 To-Do List Web Application

![.NET 8](https://img.shields.io/badge/.NET-8.0-blueviolet)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)
![Kubernetes EKS](https://img.shields.io/badge/Kubernetes-EKS-326ce5)
![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-orange)
![Azure Pipelines](https://img.shields.io/badge/CI%2FCD-Azure%20Pipelines-blue)
![SQL Server](https://img.shields.io/badge/SQL-Server-critical)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-orange)
![Grafana](https://img.shields.io/badge/Dashboards-Grafana-yellow)
![Loki](https://img.shields.io/badge/Logging-Loki-green)
![Tempo](https://img.shields.io/badge/Tracing-Tempo-blue)
![SonarQube](https://img.shields.io/badge/Code%20Quality-SonarQube-brightgreen)
![Trivy](https://img.shields.io/badge/Trivy-Vulnerability%20Scanner-critical?logo=aqua-security&logoColor=white)
![MIT](https://img.shields.io/badge/License-MIT-green)

A **cloud-ready, containerized, GitOps-driven**, and **fully observable** To-Do List Web Application built using:

* **ASP.NET Core MVC (.NET 8)**
* **SQL Server** with EF Core
* **Docker & Docker Compose**
* **Kubernetes (AWS EKS)**
* **ArgoCD GitOps pipeline**
* **Azure Pipelines CI/CD**
* **Prometheus + Grafana + Loki + Tempo** for monitoring, logging & tracing
* **SonarQube** for static code analysis and maintainability scoring
* **Trivy** for docker image analysis and enforce image security gates before pushing images to a registry.
This application is built for **enterprise DevOps workflows**, **production-ready observability**, and **cloud-native operational excellence**.

---

## 📑 Table of Contents

* [Overview](#overview)
* [Key Features](#key-features)
* [Preview / Logo](#preview--logo)
* [Tech Stack](#tech-stack)
* [Architecture](#architecture)
* [Development Workflow](#development-workflow)
* [Quick Start (Local)](#quick-start-local)
* [Database & EF Core Migrations](#database--ef-core-migrations)
* [Docker & Compose](#docker--compose)
* [Build & Push Docker Image](#build--push-docker-image)
* [Kubernetes & ArgoCD Deployment](#kubernetes--argocd-deployment)
* [CI/CD (Azure Pipelines)](#cicd-azure-pipelines)
* [Configuration & Secrets](#configuration--secrets)
* [Security — Rotating & Scrubbing Secrets](#security--rotating--scrubbing-secrets)
* [Monitoring & Logging](#monitoring--logging)
* [Production Hardening Guide](#production-hardening-guide)
* [Repository Layout](#repository-layout)
* [Troubleshooting](#troubleshooting)
* [Contributing](#contributing)
* [License & Contact](#license--contact)

---

# 🌐 Overview

This repository contains a **full-stack enterprise reference implementation** of a To-Do List Web Application built using:

✔ ASP.NET Core MVC (.NET 8)
✔ SQL Server backed by EF Core
✔ Full containerization using Docker
✔ Scalable cloud-native deployment on Kubernetes (AWS EKS)
✔ GitOps continuous deployment using ArgoCD
✔ Automated development → build → release cycle through Azure Pipelines

The project demonstrates real-world enterprise patterns:

* Microservice-ready architecture
* Configurable environments (Dev, QA, Prod)
* Versioned API-ready structure
* DevOps automation
* Secure secrets handling
* Cloud-native observability

---

# ⭐ Key Features

### Application Features

* MVC-based clean architecture
* CRUD for To-Do tasks with EF Core persistence
* Validation, error handling, and logging
* Dependency Injection throughout
* Ready for extension into microservice architecture

### DevOps & Cloud Features

* Complete containerization using `Dockerfile` and `docker-compose.yml`
* Kubernetes manifests designed for multiple environments
* ArgoCD GitOps automation (self-healing + auto-sync)
* CI/CD pipeline:

  * Build .NET solution
  * Run tests
  * Build Docker images
  * Push to registry
  * Auto-update Kubernetes manifests
  * Commit changes → triggers ArgoCD

### Enterprise Enhancements

* Centralized secret handling
* Support for external secret stores (Vault/ASM/Secrets Manager)
* Production-ready security hardening guidelines
* Application observability hooks
* Load balancing + auto-scaling using Kubernetes HPA

---

# 🖼️ Preview / Logo

```
To-Do List Web Application — Enterprise Edition
ASP.NET Core MVC • Docker • SQL Server • Kubernetes • GitOps • CI/CD
```

  <h2>🖼️ Screenshot</h2>
  <p>Here's a preview of the application running locally:</p>
  <img src="image.png" alt="To-Do List Application Screenshot" />
---

# 🛠️ Tech Stack

| Layer             | Technology                                          |
| ----------------- | --------------------------------------------------- |
| **Frontend**      | MVC + Razor Views                                   |
| **Backend**       | ASP.NET Core MVC (.NET 8), C#                       |
| **ORM**           | Entity Framework Core (Code First)                  |
| **Database**      | SQL Server 2019+                                    |
| **Containers**    | Docker, Docker Compose                              |
| **Orchestration** | Kubernetes (AWS EKS)                                |
| **GitOps**        | ArgoCD                                              |
| **CI/CD**         | Azure Pipelines                                     |
| **Secrets**       | `.env`, user-secrets, K8s Secrets, Vault (optional) |
| **Observability** | Serilog, Prometheus, Grafana                        |

---

# 🏗️ Architecture

### High-Level System Flow

```mermaid
flowchart TD
  A[User / Browser] --> B[ASP.NET Core MVC (.NET 8)]
  B --> C[Entity Framework Core]
  C --> D[(SQL Server DB)]

  subgraph Docker Environment
    B
    D
  end

  subgraph Container Images
    B --> E[Web App Image]
    D --> F[SQL Server Image]
  end

  subgraph Kubernetes (AWS EKS)
    E --> G[Deployment]
    G --> H[Service / LoadBalancer]
    G --> I[HPA - Auto Scaling]
    F --> J[PersistentVolume]
  end

  subgraph GitOps via ArgoCD
    Repo[Git Repo] --> Argo[ArgoCD]
    Argo --> G
  end
```

---

# 🔄 Development Workflow

```
Developer → Commit → Azure Pipeline → Docker Registry → GitOps Repo → ArgoCD → EKS Deployment
```

---

# ⚡ Quick Start (Local)

### 1. Clone the repository

```bash
git clone https://github.com/<your-org>/<repo>.git
cd <repo>/ToDo
```

### 2. Run the application (No Docker)

```bash
dotnet restore
dotnet run
```

### 3. Or start using Docker Compose

```bash
docker-compose up --build
```

App becomes available at:

```
http://localhost:8080
```

---

# 🗄️ Database & EF Core Migrations

### Create a migration:

```bash
dotnet ef migrations add InitialCreate
```

### Apply migration:

```bash
dotnet ef database update
```

### Local development secret:

```bash
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "<your-connection>"
```

---

# 🐳 Docker & Compose

`docker-compose.yml` includes:

* SQL Server container (`db`)
* App container (`web`)

### Launch:

```bash
docker-compose up --build
```

### Tear down:

```bash
docker-compose down
```

### `.env` file example:

```
SA_PASSWORD=StrongPassword@123
ACCEPT_EULA=Y
```

---

# 📦 Build & Push Docker Image

```bash
docker build -t yourrepo/todo-app:latest .
docker tag yourrepo/todo-app:latest yourrepo/todo-app:v1
docker push yourrepo/todo-app:v1
```

---

# ☸ Kubernetes & ArgoCD Deployment

### Add SQL password as K8s secret:

```bash
kubectl create secret generic todolist-mssql-secret \
  --from-literal=SA_PASSWORD='StrongPassword@123' \
  --namespace dev
```

### Deploy application:

```bash
kubectl apply -f k8s/Dev
```

### ArgoCD Sync

ArgoCD automatically detects new Git commits:

* Validates manifests
* Shows drift
* Syncs automatically (if auto-sync enabled)

---

# 🔧 CI/CD (Azure Pipelines)

Pipeline tasks usually include:

### **Stage 1 — Build**

* Restore NuGet packages
* Build .NET solution
* Run unit tests

### **Stage 2 — Docker Build & Push**

* Build Docker image
* Push to registry (ACR/Docker Hub/ECR)

### **Stage 3 — GitOps Update**

* Update Kubernetes Deployment YAML `image:` tag
* Commit changes back to Git repository
* ArgoCD automatically deploys new version

Pipeline secret examples:

* REGISTRY_USERNAME
* REGISTRY_PASSWORD
* GIT_TOKEN

---

# 🔐 Configuration & Secrets

### Local

* `dotnet user-secrets`
* `appsettings.Local.json`

### Docker

* `.env` file
* Docker secrets (Swarm / Compose v3+)

### Kubernetes

* `kubectl create secret`
* Or use **External Secrets Operator**, Vault, AWS Secrets Manager

---

# 🔑 Security — Rotating & Scrubbing Secrets

If a password/token was committed:

### 1. Rotate the leaked secret immediately.

### 2. Scrub Git history:

```bash
git clone --mirror https://github.com/your/repo.git repo-mirror.git
cd repo-mirror.git

git filter-repo --replace-text replacements.txt

git push --force --all
git push --force --tags
```

### 3. Ask all developers to re-clone.

---

# 📊 Monitoring & Logging

### Logging Options

* Serilog → Console, File, CloudWatch, ElasticSearch
* K8s logs via `kubectl logs`

### Metrics & Observability

* Prometheus scraping
* Grafana dashboarding
* K8s HPA scaling metrics
* ArgoCD application health & drift detection

---


### ✔ **Prometheus Integration**

The application exposes Prometheus-friendly metrics via a `/metrics` endpoint (can be added using `prometheus-net` package).
Prometheus collects:

* Request rate
* Response times
* Error rate
* CPU & memory metrics (via cAdvisor)
* K8s pod/node metrics

### ✔ **Grafana Dashboards**

Grafana consumes Prometheus metrics and Loki logs to display:

* Application performance dashboards
* Request latency heatmaps
* HPA scaling history
* Container resource usage
* Error frequency

Custom dashboards can be imported using JSON templates.

### ✔ **Loki (Centralized Logging)**

Loki provides lightweight log aggregation with:

* Zero-index logging
* High retention at low cost
* Native Grafana integration
* Structured logs from ASP.NET Core (via Serilog → Loki sink)

Logs can be queried with LogQL, allowing filtering by pod, namespace, correlation ID, etc.

### ✔ **Tempo (Distributed Tracing)**

Tempo enables **end-to-end request tracing** in microservices environments.

* Works with OpenTelemetry
* No dependency on external databases
* Natively integrated with Grafana
* Enables detection of slow requests & hidden bottlenecks

### ✔ **SonarQube (Code Quality & Security)**

Integrated into Azure Pipelines to ensure:

* Code coverage enforcement
* Bug & vulnerability detection
* Code smells detection
* Cyclomatic complexity reporting
* Technical debt tracking

SonarQube gates can block deployments if quality rules fail.

---

## 📊 Updated Monitoring & Observability Stack

Here is the improved observability section you can insert into your README:

---

# 🔭 Monitoring, Logging & Tracing (Prometheus, Grafana, Loki, Tempo)

The application supports a **full observability ecosystem**, enabling production-grade monitoring.

## 🔹 **Prometheus (Metrics Collection)**

Prometheus scrapes metrics from:

* ASP.NET Core exporter (HTTP metrics)
* K8s metrics-server
* Node exporter
* cAdvisor (container metrics)

### Example scrape config:

```yaml
scrape_configs:
  - job_name: 'todo-webapp'
    static_configs:
      - targets: ['todo-app-service:80']
```

---

## 🔹 **Grafana (Dashboards & Visualization)**

Dashboards include:

* Application Performance Overview
* API Latency Panels
* System Resource Usage
* Error/Error-rate dashboards
* Pod-level utilization dashboards

Grafana can also query Loki & Tempo for cross-panel linking.

---

## 🔹 **Loki (Centralized Logging)**

Loki collects logs from:

* Application pods via Promtail
* K8s events
* System components

### Example Serilog configuration:

```json
"Serilog": {
  "WriteTo": [
    {
      "Name": "GrafanaLoki",
      "Args": {
        "uri": "http://loki:3100",
        "labels": { "app": "todo-webapp" }
      }
    }
  ]
}
```

Logs become searchable in Grafana using LogQL, such as:

```
{app="todo-webapp"} |= "ERROR"
```

---

## 🔹 **Tempo (Distributed Tracing)**

Tempo receives traces exported using **OpenTelemetry**.

### Benefits:

* Full request flow visibility
* Root cause analysis for slow requests
* Built-in Grafana UI

### Example OTEL config snippet:

```yaml
exporters:
  otlp:
    endpoint: tempo:4317
```



# 🛡 Production Hardening Guide

### ✔ Performance

* Enable response caching
* Add SQL indexing for heavy queries

### ✔ Security

* HTTPS enforcement
* Docker image vulnerability scanning
* Pod Security Standards (restricted policies)

### ✔ Kubernetes Best Practices

* Configure readiness/liveness probes
* Use autoscaling (HPA)
* Apply Pod Resource Limits
* Use separate namespaces (dev/qa/prod)

---

# 📁 Repository Layout

```
/ToDo
  /Controllers
  /Models
  /Data
  /Views
Dockerfile
docker-compose.yml
k8s/ (Dev, QA, Prod)
azure-pipelines.yml
README.md
```

---

# 🛠 Troubleshooting

| Issue                     | Possible Fix                                         |
| ------------------------- | ---------------------------------------------------- |
| EF migration failure      | Verify connection string & Db permissions            |
| SQL container won't start | Allocate 2GB+ Docker RAM                             |
| Port conflict             | Modify `docker-compose.yml` or `launchSettings.json` |
| ArgoCD shows OutOfSync    | Ensure new Docker image tag is committed             |
| Pod CrashLoopBackOff      | Check env variables & secrets                        |

---

# 🤝 Contributing

1. Fork the repo
2. Create a feature branch
3. Add your enhancements
4. Include tests when relevant
5. Submit a PR
6. Do **not** commit secrets

---

# 📄 License & Contact

Licensed under the **MIT License**.
Maintainer: **Alok Raja**

*Developed with ❤️ for enterprise & cloud-native learning.*

### Tips & Notes

* Replace placeholder values (`<your-repo>`, `<YOUR_REAL_PASSWORD>`) before running commands.
* Consider adding GitHub Actions or Dependabot for dependency updates if you prefer not to use Azure Pipelines.
* Add a short `CONTRIBUTING.md`, `SECURITY.md`, and `CODE_OF_CONDUCT.md` for open-source or enterprise collaboration.
