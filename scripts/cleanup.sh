#!/bin/bash

# Cleanup script for the fintech platform

# Function to delete Kubernetes resources
cleanup_k8s() {
    echo "Cleaning up Kubernetes resources..."
    kubectl delete namespace fintech-platform || true
    echo "Kubernetes resources cleaned up."
}

# Function to delete AWS resources
cleanup_aws() {
    echo "Cleaning up AWS resources..."
    # Add commands to delete AWS resources here
    # Example: aws cloudformation delete-stack --stack-name fintech-platform
    echo "AWS resources cleaned up."
}

# Main cleanup function
main() {
    cleanup_k8s
    cleanup_aws
    echo "Cleanup completed."
}

# Execute the main function
main