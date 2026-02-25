# Hybrid-Cloud Observability Pipeline. 

## Project Justification. 
Local logs are a "block box". If the service fails to recover, nobody know until a user complains. 
This project bridges the visibility gab by pushing critical health events into a managed cloud platform (AWS), ensuring 100% notification reliability even if the local server is under haevy load. 

## Project Goals & Scope.
- Goal: Bridge local bash automation with AWS native services for real-time  alerting. 
- Scope: Installation of CloudWatch Agent on a local Linux VM. 
	- Secure log streaming via IAM User with least-privilege. 
	- Automated notification via SNS + SES. 
- Context (The Hybrid Setup):
	- Source: Local VM (web-prod-01) running Nginx. 
	- Bridge: SSH Tunneling to an EC2 Reverse Proxy (cloud-sentinel-01).
	- Destination: AWS CloudWatch (Region:us-east-1).	

## Topology & Naming Conventions. 
Naming Conventions:
- Log Group: /hybrid/web-prod/nginx-alerts
- Metric Filter: NginxFailureDetection
- SNS Topic: web-prod-critical-alerts
- IAM Policy: CloudWatchAgentLogPushPolicy. 

## The topology: 
[Local VM (web-prod-01)] --(CW Agent)--> [Public Internet] --(IAM Credentials)--> [AWS CloudWatch Logs] --> [Metric Filter] --> [SNS] --> [SES Email]

## Resume:
Engineer a Hybrid-Cloud monitoring pipeline using AWS CloudWatch and SNS to provide real-time visibility for an on-premise self-healing Nginx cluster, reducing incident response time.

## My  Project Topology
![my-topology](/imagens_and_project_diagram/hybrid-cloud-observability-pipeline-topology.png)
