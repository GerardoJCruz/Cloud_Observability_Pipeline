# AWS Signature Authentication Failure.

## 1. Issue Description

Status Resolved. 

Error Code: 403 Forbidden / SignatureDoesNotMatch. 

Symptoms: The CloudWatch Agent failed to initialized a connection to the regional endpoint. 

Logs indicated that the request signature calculated by the agent did not match the signature calculated by AWS. 

## 2. Diagnostic Process.

Initially, the error was suspected to be an IAM Credential issue (incorrect Access Keys).

However, after rotating keys and verifying permissions, the error persisted. 

Further investigation into the request metadata revealed:

- Request Time: The VM timestamp was significantly out of sync with real-time UTC.
- Security Protocol: AWS Signature Version 4 includes a timestamp in the signing process. If the client’s clock differs from the server’s clock by more than 5 minutes, AWS rejects the request to prevent “replay attacks.”

## 3. Root Cause Analysis (RCA)

- Root Cause: Hardware clock drift on the local virtual machine (web-prod-01)
- Technical Detail: The local system clock was lagging behind the AWS API server time, causing the CredentialScope and Date headers in the HMAC signature to be invalidated upon arrival at the AWS endpoint.

## 4. Resolution & Fix.

To resolve the synchronization mismatch, the Network Time Protocol (NTP) was forced to update the system hardware clock. 

### Commands Executed:

```bash
# Check current system time and synchronization status
timedatectl status

# Enable NTP synchronization
sudo timedatectl set-ntp true

# Verify the updated time matches UTC. 
date -u 
```

## 5. Lesson learned.

In a hybrid Cloud environment, time synchronization is a security requirement, no just a convenience. Authentication protocols like SigV4 rely on temporal accuracy to ensure the integrity of the request.
