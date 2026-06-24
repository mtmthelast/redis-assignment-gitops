#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Removing FastAPI Deployment..."
kubectl delete -f "$PROJECT_ROOT/k8s/deployment.yaml" --ignore-not-found

echo "Removing FastAPI Service..."
kubectl delete -f "$PROJECT_ROOT/k8s/service.yaml" --ignore-not-found

echo "Removing Redis Deployment..."
kubectl delete -f "$PROJECT_ROOT/k8s/redis-deployment.yaml" --ignore-not-found

echo "Removing Redis Service..."
kubectl delete -f "$PROJECT_ROOT/k8s/redis-service.yaml" --ignore-not-found

echo "Removing PVC..."
kubectl delete -f "$PROJECT_ROOT/k8s/redis-pvc.yaml" --ignore-not-found

echo "Removing Secret..."
kubectl delete -f "$PROJECT_ROOT/k8s/redis-secret.yaml" --ignore-not-found

echo "Removing ConfigMap..."
kubectl delete -f "$PROJECT_ROOT/k8s/redis-configmap.yaml" --ignore-not-found

echo
echo "Cleanup complete."