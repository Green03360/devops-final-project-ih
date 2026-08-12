# 📘 Compliance Policy

This document outlines compliance considerations for the **Expensy End‑to‑End DevOps Deployment**.

## 1. Infrastructure Compliance

- AKS cluster provisioned using Terraform IaC.
- Resource naming follows Azure best practices.
- Infrastructure changes tracked through Git version control.

## 2. CI/CD Compliance

- GitHub Actions workflows stored in `.github/workflows`.
- CI/CD pipeline includes:
  - Linting
  - Docker image build
  - Docker push
  - Kubernetes deployment
- All pipeline steps are logged and auditable.

## 3. Container Compliance

- Docker images follow best practices:
  - Minimal base images
  - No secrets baked in
  - Multi‑stage builds

## 4. Kubernetes Compliance

- All deployments include:
  - Resource limits
  - Liveness probes
  - Readiness probes
- Sensitive services use **ClusterIP** only.
- Public access limited to frontend LoadBalancer.

## 5. Data Compliance

- MongoDB authentication enabled.
- Redis password protected.
- Optional PVC for persistent storage.

## 6. Monitoring Compliance

- Prometheus and Grafana deployed for observability.
- Dashboards track cluster health and performance.

## 7. Documentation Compliance

This project includes:
- `README.md`
- `SECURITY.md`
- `COMPLIANCE.md`
- Terraform IaC
- Kubernetes manifests
- CI/CD workflows

All required by Ironhack final project guidelines.
