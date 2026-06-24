#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Deploying ConfigMap..."
kubectl apply -f "$PROJECT_ROOT/k8s/redis-configmap.yaml"

echo "Deploying Secret..."
kubectl apply -f "$PROJECT_ROOT/k8s/redis-secret.yaml"

echo "Deploying PVC..."
kubectl apply -f "$PROJECT_ROOT/k8s/redis-pvc.yaml"

echo "Deploying Redis Service..."
kubectl apply -f "$PROJECT_ROOT/k8s/redis-service.yaml"

echo "Deploying Redis Deployment..."
kubectl apply -f "$PROJECT_ROOT/k8s/redis-deployment.yaml"

echo "Deploying FastAPI Service..."
kubectl apply -f "$PROJECT_ROOT/k8s/service.yaml"

echo "Deploying FastAPI Deployment..."
kubectl apply -f "$PROJECT_ROOT/k8s/deployment.yaml"

echo
echo "Deployment complete."