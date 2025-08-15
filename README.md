# Airflow with Spinnaker Deployment

This repository contains Apache Airflow configured for deployment to Azure Kubernetes Service (AKS) using Spinnaker.

## Architecture

- **Webserver**: Airflow web interface
- **Scheduler**: DAG scheduling and task orchestration
- **Workers**: Scalable task execution (KubernetesExecutor)
- **PostgreSQL**: Metadata database
- **Spinnaker**: Continuous deployment pipeline

## Local Development

1. Start local Airflow:
   ```bash
   docker-compose up -d
   ```

2. Access Airflow UI: http://localhost:8080
   - Username: airflow
   - Password: airflow

## Deployment to Azure

1. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f k8s/ -n varun-dev
   ```

2. Configure Spinnaker pipeline using `spinnaker/airflow-pipeline.json`

## Scaling

- Workers: Adjust replicas in `k8s/airflow-worker.yaml`
- Scheduler: Adjust replicas in `k8s/airflow-scheduler.yaml`
- Webserver: Adjust replicas in `k8s/airflow-webserver.yaml`

## Namespace: varun-dev

All resources are deployed to the `varun-dev` namespace in Azure.
