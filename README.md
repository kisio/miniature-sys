# Flask Kubernetes Deployment with Terraform

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=flat&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=flat&logo=python&logoColor=white)

A complete DevOps project demonstrating Infrastructure as Code (IaC) principles. This repository contains a Python Flask application that is containerized with Docker and deployed to a local Minikube Kubernetes cluster using Terraform.

## 🚀 Overview

This project showcases a modern DevOps workflow for deploying a microservice. It automates the provisioning of a local Kubernetes cluster and the deployment of a containerized application, ensuring a consistent and reproducible environment.

**Key Features:**
*   **Containerization**: The Flask application is packaged into a lightweight Docker container.
*   **Infrastructure as Code (IaC)**: Terraform is used to provision the Minikube cluster and manage Kubernetes resources (Deployments, Services).
*   **Automation**: A unified deployment script handles the entire lifecycle from cluster creation to application deployment.

## 🏗️ Architecture

The project consists of the following components:

1.  **Flask Application**: A simple web server returning the current time.
2.  **Docker**: Packages the application and its dependencies.
3.  **Minikube**: Provides a local Kubernetes cluster environment.
4.  **Terraform**:
    *   Provisions the Minikube cluster.
    *   Defines the Kubernetes `Deployment` (2 replicas).
    *   Defines the Kubernetes `Service` (NodePort) to expose the app.

## 🛠️ Technologies Used

*   **Language**: Python 3.9 (Flask)
*   **Containerization**: Docker
*   **Orchestration**: Kubernetes (Minikube)
*   **IaC**: Terraform (HashiCorp)
*   **Scripting**: Bash

## 📋 Prerequisites

Before running the project, ensure you have the following installed:

*   **Docker**: The Docker daemon must be running.
*   **Terraform**: Installed and available in your PATH.
*   **Minikube**: (Optional) The deployment script will attempt to download a local binary if not found, but having it installed system-wide is recommended.

## ⚡ Quick Start

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd miniature-sys
    ```

2.  **Run the deployment script**:
    This script will initialize Terraform, start Minikube, build the Docker image, and deploy the application.
    ```bash
    ./deploy.sh
    ```

3.  **Access the Application**:
    Once the deployment is complete, the script will output the URL.
    ```bash
    # Example output
    🌍 Access URL:
    http://192.168.49.2:32000
    ```
    Open the URL in your browser or use `curl` to verify:
    ```bash
    curl <url>
    ```

## 📂 Project Structure

```
.
├── deploy.sh                 # Main automation script
├── Dockerfile                # Docker build definition
├── app.py                    # Flask application source code
├── terraform-conf/           # Terraform configuration files
│   ├── main.tf               # Minikube cluster resource
│   ├── kubernetes.tf         # Kubernetes Deployment & Service resources
│   ├── provider.tf           # Provider configuration
│   ├── variables.tf          # Variable definitions
│   └── backend.tf            # Local backend configuration
└── README.md                 # Project documentation
```

## 🔮 Future Improvements

*   **CI/CD Pipeline**: Integrate GitHub Actions to run tests and deploy to a remote cluster.
*   **Monitoring**: Add Prometheus and Grafana for cluster monitoring.
*   **Helm Charts**: Package the application using Helm for more flexible deployments.
*   **Ingress Controller**: Implement an Ingress controller for better traffic management.

---