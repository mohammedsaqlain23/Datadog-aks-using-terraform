############################################
# AKS CLUSTER NAME
############################################

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

############################################
# AKS RESOURCE GROUP
############################################

variable "resource_group" {
  description = "Resource group of the AKS cluster"
  type        = string
}

############################################
# ENVIRONMENT TAG
############################################

variable "env" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

############################################
# DATADOG API KEY
############################################

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

