#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to deploy Crossplane resources
deploy_crossplane() {
    echo "Deploying Crossplane resources..."
    kubectl apply -f ../crossplane/providers/
    kubectl apply -f ../crossplane/compositions/
    kubectl apply -f ../crossplane/xrds/
    kubectl apply -f ../crossplane/instances/
}

# Function to deploy Kubernetes resources
deploy_k8s() {
    echo "Deploying Kubernetes resources..."
    kubectl apply -f ../k8s/namespaces/
    kubectl apply -f ../k8s/apps/transaction-api/
    kubectl apply -f ../k8s/apps/notification-service/
    kubectl apply -f ../k8s/monitoring/
    kubectl apply -f ../k8s/security/
}

# Function to build and push Docker images
build_docker_images() {
    echo "Building Docker images..."
    docker build -t fintech-transaction-api:latest ../docker/transaction-api/
    docker build -t fintech-notification-service:latest ../docker/notification-service/
    
    # Push images to a container registry (e.g., Docker Hub, ECR)
    # Uncomment and configure the following lines if using a registry
    # echo "Pushing Docker images..."
    # docker push fintech-transaction-api:latest
    # docker push fintech-notification-service:latest
}

# Main deployment function
main() {
    build_docker_images
    deploy_crossplane
    deploy_k8s
    echo "Deployment completed successfully!"
}

# Execute the main function
main