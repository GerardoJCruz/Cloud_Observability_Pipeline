# Project Roadmap. 

## Phases: 
1. Phase 1 - IAM Security: 
	Create a dedicated IAM user for the local VM to talk to AWS. 

2. Phase 2 - Agent Deployment: 
	Install and configure the Unified CloudWatch Agent on the Local VM. 

3. Phase 3 - Schema Definition:
	Define the amazon-cloudwatch-agent.json to track specifically the nginx_alerts.log file. 

4. Phase 4 - Logic Extraction: 
	Create CloudWatch Metric Filters to turn "Text Logs" into "Numerical Metrics".

5. Phase 5 - Notification Loop: 
	Link Alarms to SNS and verify SES email delivery.
