#!/bin/bash

echo "🚀 Deploying Airflow to Azure Kubernetes Cluster..."

# Apply namespace
kubectl apply -f k8s/airflow-namespace.yaml

# Apply PostgreSQL
kubectl apply -f k8s/airflow-postgresql.yaml

# Wait for PostgreSQL to be ready
echo "⏳ Waiting for PostgreSQL to be ready..."
kubectl wait --for=condition=ready pod -l app=airflow-postgresql -n varun-dev --timeout=300s

# Apply Airflow components
echo "📦 Deploying Airflow components..."
kubectl apply -f k8s/airflow-configmap.yaml
kubectl apply -f k8s/airflow-webserver.yaml
kubectl apply -f k8s/airflow-scheduler.yaml
kubectl apply -f k8s/airflow-worker.yaml

# Wait for all pods to be ready
echo "⏳ Waiting for Airflow pods to be ready..."
kubectl wait --for=condition=ready pod -l app=airflow-webserver -n varun-dev --timeout=300s
kubectl wait --for=condition=ready pod -l app=airflow-scheduler -n varun-dev --timeout=300s
kubectl wait --for=condition=condition=ready pod -l app=airflow-worker -n varun-dev --timeout=300s

echo "✅ Airflow deployment completed!"
echo "🌐 Access Airflow UI:"
kubectl get service airflow-webserver -n varun-dev

echo "📊 Check pod status:"
kubectl get pods -n varun-dev
