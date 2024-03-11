#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed."
    exit 1
else
    echo "Docker is installed."
fi

# Check if Kubernetes is installed (using kubectl)
if ! command -v kubectl &> /dev/null; then
    echo "Kubernetes (kubectl) is not installed."
    exit 1
else
    echo "Kubernetes (kubectl) is installed."
fi

# Check other dependencies as needed

# Generate a text file summarizing the environment status
echo "Environment status summary:" > environment_status.txt
echo "------------------------------------" >> environment_status.txt
echo "Docker: $(docker --version)" >> environment_status.txt
echo "Kubernetes: $(kubectl version )" >> environment_status.txt

# Add more checks and information as needed

echo "Environment status summary saved to environment_status.txt"

