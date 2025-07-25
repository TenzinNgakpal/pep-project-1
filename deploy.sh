#!/bin/bash

# Set variables
AWS_REGION="ap-south-1"
AWS_ACCOUNT_ID="your_aws_account_id"
REPO_NAME="flask-app"
IMAGE_TAG="latest"

# Authenticate to ECR
echo "Logging into AWS ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Build Docker image
echo "Building Docker image..."
docker build -t $REPO_NAME .

# Tag image for ECR
echo "Tagging image..."
docker tag $REPO_NAME:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

# Push image to ECR
echo "Pushing to ECR..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

echo "✅ Docker image pushed successfully!"
