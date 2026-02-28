# Phase 4: Metric Extraction & Logic Mapping.

## Goal:

To transform raw string data from localized log files into actionable numerical metrics within the AWS ecosystem. 

## Technical Components

- Metric Filter: [CRITICAL] & [RECOVERY]
- Namespace: ProjectSentinel.
- Metric Name: ServiceFailures.
- Value: 1 (Increments by 1 for every match).

## Key Tasks Completed

1. JSON Configuration: Finalized the amazon-cloudwatch-agent.json to monitor /var/log/nginx_alerts.log. 
2. Filter Creation: Establish a CloudWatch Metric Filter to parse the log stream fro specific error patterns. 
3. Validation: Verified the “Digital Handshake” where the agent successfully pushed an offset range (e.g., 0-501) to the cloud.

## Sentinel-Monitoring-Group:
![Sentinel-Monitoring-group](/imagens_and_project_diagram/sentinel-monitor-group.jpg)

## Log Stream
![Web_Prod_01_logs](/imagens_and_project_diagram/web-prod-01-nginx-alerts.jpg)
