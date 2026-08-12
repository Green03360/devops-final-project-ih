# Expensy – End‑to‑End DevOps Deployment

## Overview
Expensy is a full‑stack expense‑tracking application deployed on **Azure Kubernetes Service (AKS)** using **Terraform IaC** and **GitHub Actions CI/CD**.

## Architecture
- Frontend → Next.js app (Dockerized)
- Backend → Node.js Express API
- Database → MongoDB (ClusterIP)
- Cache → Redis (ClusterIP)
- Monitoring → Prometheus + Grafana
- Infrastructure → Terraform (Azure Resource Group + AKS)

## Deployment Steps
1. Authenticate Azure CLI → `az login`
2. Initialize Terraform → `terraform init`
3. Apply IaC → `terraform apply -auto-approve`
4. Export kubeconfig → `terraform output -raw kube_config > kubeconfig.yaml`
5. Deploy Kubernetes → `kubectl apply -f k8s/`
6. Access App → `http://<EXTERNAL-IP>:3000`

## CI/CD
- GitHub Actions builds Docker images and pushes to Docker Hub.
- Pipeline deploys to AKS automatically on main branch merge.

## Security & Compliance
See [`SECURITY.md`](./SECURITY.md) and [`COMPLIANCE.md`](./COMPLIANCE.md).

## Author
Green Uzoma – Ironhack DevOps Bootcamp 2026
