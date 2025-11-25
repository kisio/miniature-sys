#!/bin/bash
set -e

echo "🚀 Starting Deployment..."

# Add current directory to PATH for local minikube
export PATH=$PWD:$PATH

# Navigate to terraform directory
cd terraform-conf

echo "📦 Initializing Terraform..."
terraform init

echo "🔧 Provisioning Minikube Cluster..."
# Apply only the minikube cluster first to ensure it's ready for the docker env
terraform apply -target=minikube_cluster.minikube_docker -auto-approve

echo "🐳 Building Docker Image in Minikube..."
# Point shell to minikube's docker-daemon
eval $(minikube -p miniature-devops-sys docker-env)
# Build image from root directory (parent of terraform-conf)
docker build -t flask-time-app:latest ../

echo "🚀 Deploying Application..."
terraform apply -auto-approve

echo "✅ Deployment Complete!"
echo "⏳ Waiting for service to be ready..."
sleep 10

echo "🌍 Access URL:"
minikube -p miniature-devops-sys service flask-time-app-service --url
