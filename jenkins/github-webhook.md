# GitHub Webhook Setup for Jenkins

## 1. Go to your GitHub repository:
https://github.com/varunbiluri/airflow-spinnaker

## 2. Go to Settings > Webhooks

## 3. Add webhook:
- **Payload URL**: http://YOUR_JENKINS_IP:8080/jenkins/github-webhook/
- **Content type**: application/json
- **Secret**: (leave empty for now)
- **Events**: Just the push event

## 4. Save the webhook

## 5. In Jenkins:
- Install GitHub Integration plugin
- Configure GitHub credentials
- Set up the pipeline to trigger on webhook
