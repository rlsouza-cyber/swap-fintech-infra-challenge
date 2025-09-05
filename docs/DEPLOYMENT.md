# Deployment Instructions for Fintech Platform

This document provides step-by-step instructions for deploying the Fintech Platform, including the necessary infrastructure and application components.

## Prerequisites

Before you begin, ensure you have the following:

- AWS account with appropriate permissions to create resources.
- `kubectl` installed and configured to access your Kubernetes cluster.
- `Crossplane` installed in your Kubernetes cluster.
- `Docker` installed for building container images.
- `Helm` installed for managing Kubernetes applications.

## Step 1: Configure Crossplane

1. **Install Crossplane**: Follow the official Crossplane installation guide to set up Crossplane in your Kubernetes cluster.
   
2. **Configure AWS Provider**:
   - Navigate to the `crossplane/providers` directory.
   - Apply the AWS provider configuration:
     ```
     kubectl apply -f providers/aws-provider.yaml
     ```

3. **Set Up IAM Roles**: Ensure that the IAM roles defined in your provider configuration have the necessary permissions to manage AWS resources.

## Step 2: Provision Infrastructure

1. **Create Composite Resource Definitions (XRDs)**:
   - Navigate to the `crossplane/xrds` directory.
   - Apply the XRDs:
     kubectl apply -f xrds/fintech-platform-xrd.yaml

2. **Create Compositions**:
   - Navigate to the `crossplane/compositions` directory.
   - Apply the compositions:
     kubectl apply -f compositions/fintech-platform-composition.yaml

3. **Provision Instances**:
   - Navigate to the `crossplane/instances` directory.
   - Apply the instance configuration:
     kubectl apply -f instances/fintech-platform-instance.yaml

## Step 3: Deploy Kubernetes Applications

1. **Set Up Namespaces**:
   - Navigate to the `k8s/namespaces` directory.
   - Apply the namespace configurations:
     kubectl apply -f namespaces/fintech-namespace.yaml

2. **Deploy Transaction API**:
   - Navigate to the `k8s/apps/transaction-api` directory.
   - Apply the deployment and service configurations:

     kubectl apply -f deployment.yaml
     kubectl apply -f service.yaml
     kubectl apply -f ingress.yaml

3. **Deploy Notification Service**:
   - Navigate to the `k8s/apps/notification-service` directory.
   - Apply the deployment and service configurations:

     kubectl apply -f deployment.yaml
     kubectl apply -f service.yaml

## Step 4: Set Up Monitoring

1. **Deploy Monitoring Tools**:
   - Navigate to the `k8s/monitoring` directory.
   - Apply the monitoring configurations for Prometheus and Grafana:

     kubectl apply -f prometheus.yaml
     kubectl apply -f grafana.yaml


## Step 5: Verify Deployment

1. **Check Pod Status**:
   - Use the following command to check the status of your pods:
     kubectl get pods -n fintech

2. **Access Services**:
   - Use the Ingress URL to access the Transaction API and Notification Service.

## Step 6: Cleanup Resources

To clean up the resources created during the deployment, run the cleanup script:

./scripts/cleanup.sh

## Conclusion

You have successfully deployed the Fintech Platform. For further details on troubleshooting and API documentation, refer to the respective documents in the `docs` directory.