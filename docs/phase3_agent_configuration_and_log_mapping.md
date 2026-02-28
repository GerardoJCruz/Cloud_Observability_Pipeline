# Phase 3: Agent Configuration & Log Mapping.

## Goal:

Architect the bridging logic the maps local filesystem events to centralized AWS CloudWatch Log Groups. 

## Technical Components.

- Config File: amazon-cloudwatch-agent.json
- Global Config: common-config.toml.
- Mapping: /var/log/nginx_alerts.log → Sentinel-Monitoring-Group.
- Service User: root (Agent Runtime).

## Key Tasks Completed.

1. Configuration Authoring: Developed the JSON schema to define log collection intervals and retention policies. 
2. Identity Linking: Configured the agent to utilize the file-based credential provider instead of EC2 Instance Metadata (IMDS).
3. Service Integration: Initialized the agent using the amazon-cloudwatch-agent-ctl utility. 

## Troubleshooting Log

- Issue: The “Identity Crisis” (Credential Chain)
    - Fix: Resolved NoCredentialProviders errors by explicitly defining the shared_credential_file path in the agent’s common configuration, ensuring persistence across service restarts.
