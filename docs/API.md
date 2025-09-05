# API Documentation for Fintech Platform

## Overview
This document provides an overview of the API endpoints exposed by the Transaction API and Notification Service microservices in the Fintech Platform. Each endpoint includes the HTTP method, URL, request parameters, and response format.

## Transaction API Service

### Base URL
`http://<transaction-api-service-url>:8080`

### Endpoints

#### 1. Create Transaction
- **Method:** POST
- **URL:** `/transactions`
- **Request Body:**
  ```json
  {
    "amount": "number",
    "currency": "string",
    "description": "string"
  }
  ```
- **Response:**
  - **201 Created**
    ```json
    {
      "id": "string",
      "amount": "number",
      "currency": "string",
      "description": "string",
      "status": "string",
      "created_at": "string"
    }
    ```
  - **400 Bad Request**
    ```json
    {
      "error": "string"
    }
    ```

#### 2. Get Transaction by ID
- **Method:** GET
- **URL:** `/transactions/{id}`
- **Response:**
  - **200 OK**
    ```json
    {
      "id": "string",
      "amount": "number",
      "currency": "string",
      "description": "string",
      "status": "string",
      "created_at": "string"
    }
    ```
  - **404 Not Found**
    ```json
    {
      "error": "string"
    }
    ```

#### 3. Health Check
- **Method:** GET
- **URL:** `/health`
- **Response:**
  - **200 OK**
    ```json
    {
      "status": "UP"
    }
    ```

## Notification Service

### Base URL
`http://<notification-service-url>:8081`

### Endpoints

#### 1. Send Notification
- **Method:** POST
- **URL:** `/notify`
- **Request Body:**
  ```json
  {
    "user_id": "string",
    "message": "string"
  }
  ```
- **Response:**
  - **200 OK**
    ```json
    {
      "status": "string",
      "message_id": "string"
    }
    ```
  - **400 Bad Request**
    ```json
    {
      "error": "string"
    }
    ```

#### 2. Get Notifications by User ID
- **Method:** GET
- **URL:** `/notifications/{user_id}`
- **Response:**
  - **200 OK**
    ```json
    [
      {
        "message_id": "string",
        "user_id": "string",
        "message": "string",
        "timestamp": "string"
      }
    ]
    ```
  - **404 Not Found**
    ```json
    {
      "error": "string"
    }
    ```

#### 3. Health Check
- **Method:** GET
- **URL:** `/health`
- **Response:**
  - **200 OK**
    ```json
    {
      "status": "UP"
    }
    ```

## Notes
- Ensure to replace `<transaction-api-service-url>` and `<notification-service-url>` with the actual service URLs when making requests.
- All endpoints should be secured with HTTPS to ensure data privacy and integrity.