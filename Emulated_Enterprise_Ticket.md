# Service Request / Infrastructure Enhancemnent. 
Ticket ID: CLD-2026-0222.
Priority: Medium.
Affected System: web-prod-01 (On-Premise) & cloud-sentinel-01 (AWS)
Service: Centralized Observability & Alerting.

Issue Summary:
Local auto-recovery on 'web-prod-01' is confirmed operational (Ref: OPS-2025-0213).
However, the infrastructure team lacks real-time visibility into these events. Currently failure audits require manual SSH access to local logs, which is non-compliant with our centralized monitoring policy. 


Business Impact:
Delayed awareness of "flapping" services. If a service recovers but fails repeatedly, the lack of immediate notification prevents root-cause analysis (RCA) and risks a total system collapse without warning. 

Request:
- Stream local recovery logs (nginx_alerts.log) to a centralized dashboard.
- Implement real-time email notifications for "Critical Failure" and "Recovery" events.
- Ensure the solution works with the existing Hybrid-Cloud (SSH Tunel) architecture.
- The system must handle "intermittent connectivity" (VM Suspend/Resume cycles).

Contraints:
- Use AWS CloudWatch for log ingestion.
- Use SNS/SES for the notification layer.
- Adhere to IAM Least-Privilege for the local VM credentials.
