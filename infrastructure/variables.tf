variable "location" {
  type        = string
  default     = "West Europe"
  description = "Azure region for AKS"
}

variable "cluster_name" {
  type        = string
  default     = "expensy-aks-cluster"
}
