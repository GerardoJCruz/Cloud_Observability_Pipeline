#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "ERROR: This script must be run with root privileges (use sudo)."
   exit 1
fi

#
# =============================================================================================================================
# Script: Observability_pipeline.sh
# Description: Monitor local logs through a CloudWatch Agent and Trigger an Alerting using SNS AND SES services. 
# Strategy: Evaluate the Alerting based on the logs. 
# =============================================================================================================================
#
# Variables 
LOGS_FILE="/var/log/nginx_alerts.log"
ACCESS_KEY="YOUR_ACCESS_KEY"
SECRET_KEY="YOUR_SECRET_ACCESS_KEY"
CREDENTIALS_DIR="/root/.aws"
CREDENTIALS_FILE="$CREDENTIALS_DIR/credentials"
COMMON_CONFIG="/opt/aws/amazon-cloudwatch-agent/etc/common-config.toml"
AGENT_CONFIG="/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json"
CW_AGENT="/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl"

# Ensure Log Files exists
touch "$LOGS_FILE"
chmod 666 "$LOGS_FILE"

# Verify/Install CloudWatch Agent
if [ ! -f "$CW_AGENT" ]; then
	# Update system and install the CloudWatch Agent
	echo "Installing CloudWatch Agent..."
	dnf update -y
	dnf install amazon-cloudwatch-agent -y
fi

# Verify if the AWS credential directory exists.
if [[ ! -d "$CREDENTIALS_DIR" ]]; then
	# Create the credential directory if it doesn't exists.
      	echo "Creating the credentials directory"	
	mkdir -p "$CREDENTIALS_DIR"
	chmod 700 "$CREDENTIALS_DIR"
fi

# Manually create the credentials file
echo "Injecting credentials"
cat <<EOF > "$CREDENTIALS_FILE"
[default]
aws_access_key_id = "${ACCESS_KEY}"
aws_secret_access_key = "${SECRET_KEY}"
EOF
chmod 600 "$CREDENTIALS_FILE"

# Ensure system time is synced 
timedatectl set-ntp true

# Create the common config to point to the credentials file.
echo "Create the common config to point to the credentials"
tee "$COMMON_CONFIG" <<EOF
[credentials]
  shared_credential_file = "$CREDENTIALS_FILE"
EOF


# Create the main agent configuration JSON
echo "Agent Configuration JSON"
tee "$AGENT_CONFIG" <<EOF
{
  "agent": { "run_as_user": "root" },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "$LOGS_FILE",
            "log_group_name": "Sentinel-Monitoring-Group",
            "log_stream_name": "web-prod-01-nginx-alerts",
            "retention_in_days": 7
          }
        ]
      }
    }
  }
}
EOF

# Fetch the config and start the agent.
echo "Fetching and starting agent."
"$CW_AGENT" -a fetch-config -m onPremise -s -c file:"$AGENT_CONFIG"

# Check the status 
echo "______________________________________________________________"
echo "Verifying agent status"
"$CW_AGENT" -a status

