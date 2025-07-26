#!/bin/bash

echo "Starting application deployment on EC2..."

sudo systemctl start docker
sudo systemctl enable docker

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

echo "Stopping and removing existing container (if any)..."
docker stop "${DOCKER_IMAGE_NAME}" || true
docker rm "${DOCKER_IMAGE_NAME}" || true

echo "Pulling latest Docker image: ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"
docker pull "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"

echo "Running new container..."
docker run -d \
  --name "${DOCKER_IMAGE_NAME}" \
  -p 80:5000 \
  "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"

docker logout

echo "Application deployment complete. Check http://<EC2_PUBLIC_IP> to verify."
