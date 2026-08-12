# 🔐 Security Policy

This document describes the security measures implemented in the **Expensy End‑to‑End DevOps Deployment**, covering infrastructure, Kubernetes, CI/CD, secrets, and data protection.

## 1. Identity & Access Management (IAM)

### Azure IAM
- AKS uses **SystemAssigned Managed Identity**.
- Terraform authenticates using Azure CLI login.
- Only authorized users with access to the Azure subscription can modify infrastructure.

### GitHub Actions
- CI/CD uses **OIDC (OpenID Connect)** to authenticate with Azure.
- No long‑lived cloud credentials stored in GitHub.

---

## 2. Secrets Management

### Kubernetes Secrets
The following secrets are stored securely in Kubernetes:
- `MONGO_INITDB_ROOT_USERNAME`
- `MONGO_INITDB_ROOT_PASSWORD`
- `REDIS_PASSWORD`
- `DATABASE_URI`

### GitHub Secrets
Stored in GitHub Actions:
- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`
- `AZURE_CREDENTIALS` (OIDC or service principal)

---

## 3. Network Security

- Backend, MongoDB, and Redis use **ClusterIP** (internal only).
- Only the frontend is exposed publicly via **LoadBalancer**.
- Pod communication uses internal DNS:
  - `mongo:27017`
  - `redis:6379`

---

## 4. Container Security

- Docker images built in CI/CD.
- Images scanned automatically in Docker Hub.
- No secrets inside images.
- Minimal base images used.

---

## 5. CI/CD Security

- Secrets masked in logs.
- Only main branch deploys to production.
- Docker Hub token uses limited scope.

---

## 6. Data Security

### MongoDB
- Authentication enabled.
- Optional PVC for persistence.

### Redis
- Password protected.
- Used only for caching.

---

## 7. TLS / HTTPS (Optional Enhancement)
If using Ingress:
- TLS termination handled at Ingress Controller.
- Certificates managed via Cert‑Manager + Let’s Encrypt.

---

## 8. Monitoring & Logging

- Prometheus collects cluster metrics.
- Grafana dashboards visualize:
  - Pod health
  - Node performance
  - API latency
  - Resource usage

---

## 9. Vulnerability Management

- Regular updates to Docker base images.
- Terraform provider versions pinned.
- Kubernetes manifests reviewed for:
  - Resource limits
  - Liveness/readiness probes
  - SecurityContext

---

## 10. Incident Response
If a security issue is found:
1. Open a GitHub issue.
2. Tag it as **security**.
3. Revoke compromised credentials.
4. Redeploy updated containers.
