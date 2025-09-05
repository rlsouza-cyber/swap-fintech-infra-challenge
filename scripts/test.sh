#!/bin/bash

# This script runs tests to validate the functionality of the deployed services.

# Function to check the health of the Transaction API service
check_transaction_api_health() {
    echo "Checking Transaction API health..."
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://transaction-api:8080/health)
    if [ "$RESPONSE" -eq 200 ]; then
        echo "Transaction API is healthy."
    else
        echo "Transaction API is not healthy. HTTP Status: $RESPONSE"
        exit 1
    fi
}

# Function to check the health of the Notification Service
check_notification_service_health() {
    echo "Checking Notification Service health..."
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://notification-service:8081/health)
    if [ "$RESPONSE" -eq 200 ]; then
        echo "Notification Service is healthy."
    else
        echo "Notification Service is not healthy. HTTP Status: $RESPONSE"
        exit 1
    fi
}

# Function to run integration tests
run_integration_tests() {
    echo "Running integration tests..."
    # Example test for creating a transaction
    CREATE_RESPONSE=$(curl -s -X POST http://transaction-api:8080/transactions -d '{"amount": 100, "currency": "USD"}' -H "Content-Type: application/json")
    echo "Create Transaction Response: $CREATE_RESPONSE"

    # Add more tests as needed
}

# Main script execution
check_transaction_api_health
check_notification_service_health
run_integration_tests

echo "All tests completed."