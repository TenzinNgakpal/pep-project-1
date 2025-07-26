#!/bin/bash

CONTAINER_NAME=$1

if [ -z "$CONTAINER_NAME" ]; then
    echo "UNKNOWN: No container name provided. Usage: $0 <container_name>"
    exit 3
fi

docker_ps_output=$(sudo docker ps -a --filter "name=${CONTAINER_NAME}" --format "{{.Names}}")

if [ -z "$docker_ps_output" ]; then
    echo "CRITICAL: Container '${CONTAINER_NAME}' does not exist."
    exit 2
fi

docker_status=$(sudo docker inspect -f '{{.State.Status}}' "${CONTAINER_NAME}" 2>/dev/null)

if [ "$docker_status" == "running" ]; then
    echo "OK: Container '${CONTAINER_NAME}' is running."
    exit 0
else
    echo "CRITICAL: Container '${CONTAINER_NAME}' is in '$docker_status' state."
    exit 2
fi
