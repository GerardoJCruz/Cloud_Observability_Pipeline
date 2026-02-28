# Phase 2: Agent Deployment & Authentication

## Goal:

Deploy the CloudWatch Unified Agent using the RPM package manager and establish the authentication handshake with the AWS API. 

## Technical Components

- IAM identity: sentinel-agent-local (Service User).
- Policy Name: SentinelAgentPolicy.
- Permissions: logs:PutLogEvents, logs:CreateLogStream, log:DescribeLogStreams.
- Auth Method: AWS Access Keys (HMAC).

## Key Tasks Completed

1. Policy Engineering: Authored a JSON IAM policy limited strictly to the required Log Group actions. 
2. Credential Provisioning: Generated and secured AWS Access Keys for the service user. 
3. Local Auth Setup: Configured /root/.aws/credentials to store the identity of the VM node. 

## Troubleshooting Log:

- Issue: The “Time traveler” Bug (Clock Drift)
    - Firx: Diagnosed 403 SignatureDoesNotMatch errors caused by VM hardware clock lag. Synced system time using timedatectl to satisfy AWS Signature V4 security requirements.
