#!/bin/bash

echo "WARNING: This script will destroy ALL AWS resources defined in your Terraform configuration."
echo "Ensure you are in the 'terraform/' directory before running this script."
read -p "Are you sure you want to proceed? (yes/no): " CONFIRMATION

if [ "$CONFIRMATION" != "yes" ]; then
  echo "Aborting cleanup."
  exit 0
fi

cd ../terraform || { echo "Error: 'terraform/' directory not found. Please run this script from the project root."; exit 1; }

echo "Running terraform destroy..."

terraform destroy -auto-approve

if [ $? -eq 0 ]; then
  echo "Terraform destroy completed successfully."
else
  echo "Terraform destroy failed. Please check the output for errors."
fi

echo "Cleanup process finished."
