## 📂 File Explanation & Repository Structure

This repository deploys **Datadog on Azure Kubernetes Service (AKS)** in a **secure, GDPR-compliant, and production-ready** way using **Terraform and Helm**.  
The **clear responsibility** for each file is described below.

---

### 📄 Provider & Connectivity Configuration at provider.tf

The goal is to specify and set up the Terraform providers needed for this project.

What it accomplishes
Terraform is connected to Azure (azurerm), Kubernetes (kubernetes), Helm (helm), and the AKS cluster for authentication.
Helm can now install Datadog inside of Kubernetes.

**Why it’s needed**  
Without this file, Terraform would not know **where** or **how** to deploy resources.

---

### 📄 Core Deployment Logic in main.tf

It contains the primary logic for the infrastructure.

What it performs
- Uses the Helm chart to deploy Datadog; - Creates a Kubernetes Secret for the Datadog API key
Installing:
  - Datadog Operator (if enabled) - Datadog Cluster Agent - Datadog Agent (DaemonSet)
Utilising the configuration found in `datadog-values.yaml`

Why it's essential  
In the AKS cluster, this file outlines **what gets deployed** and **how Datadog is installed**.

### variables.tf — Definitions of Input Variables

**Purpose** outlines every input variable that the Terraform configuration uses.

What it accomplishes
Variables like the AKS cluster name are declared.
  The name of the resource group
  The development, staging, and production environments
  The securely transmitted Datadog API key

It is necessary because it keeps the code **clean**, **reusable**, and **environment-agnostic** without hardcoding values.

---

### 📄 Datadog Configuration & Policies – datadog-values.yaml

**Goal** Manages Datadog's behaviour during runtime within the AKS cluster.

What it accomplishes
Datadog **EU site (`datadoghq.eu`)** is used for GDPR compliance.
It permits:
  Log gathering
  Application Performance Monitoring, or APM
Logs are dropped at the agent level:
  Logs of information (cost optimisation)
  Kubernetes health checks
  Tokens, authorisation headers, and emails (PII protection)
Permits:
  The Datadog UI will display WARN, ERROR, and CRITICAL logs.

**Why it's necessary** It guarantees **privacy, compliance, and cost control** and keeps **observability policy** apart from Terraform logic.
---

## Configuring Datadog API Keys

To authenticate the Datadog Agent with Datadog, the Datadog API key is needed.

⚠️ The API key is not kept in the repository or code for security reasons.

---

### ✅ Export Datadog API Key (Needed)

Export the Datadog API key as an environment variable prior to executing Terraform:

```bash export TF_VAR_datadog_api_key="YOUR_DATADOG_API_KEY"

