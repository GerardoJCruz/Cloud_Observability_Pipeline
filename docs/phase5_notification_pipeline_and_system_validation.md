# Phase 5: Notification Pipeline & System Validation.

## Goal:

To establish an automated alerting threshold and a verified communication channel for real-time incident response. 

## Technical Components

- Alarm Threshold: ServiceFailures ≥ 1 for 1 datapoint within 1 minute.
- SNS Topic: Sentinel-Alerts-Topic.
- Protocol: Email (SMTP).
- Verification: SNS Subscription Confirmation Handshake.

## Key Tasks Completed

1. Trigger Logs Streaming 
2. Receive Email Alerting. 

## Sentinel-Alert-Topic

![Sentinel-Alert-Topic](/imagens_and_project_diagram/Sentinel-Alert-Topic.jpg)

## Email Alerting Received.

![Email_Alerting](/imagens_and_project_diagram/Sentinel-Alert-Topic.jpg)
