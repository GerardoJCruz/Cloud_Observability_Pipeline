# Phase 1: Security & Identity Foundation (IAM)

## Goal:

Establish a secure “Service Identity” for the local VM to authenticate with AWS Public Cloud services without exposing the Root account.

## Execution Checklist (Automated Steps)

- Define Policy: Construct a custom JSON policy that restricts access to only CloudWatch Logs.
- Identity Provisioning: Create a dedicated IAM user (sentinel-agent-local) specifically for the web-prod-01 node.
- Credential handshake: Generate Programmatic Access Keys (Access Key ID & Secret Access Key)
- Secure Storage: Store credentials safely (to be injected into the VM configuration)

## The Custom Security Policy.

Instead of using a generic “Full Access” policy, build a “Micro-Policy”.

Applied Least Privilege (PoLP) by restricting the machine identity to specific CloudWatch actions, mitigating risk in the event of local VM compromise.

## Policy Created: 
![policy_created](/imagens_and_project_diagram/policy_created.jpg)

## Dedicated User Created;
![User_created](/imagens_and_project_diagram/user_created.jpg)
