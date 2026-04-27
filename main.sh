#!/bin/bash

# Load configuration
source config.sh

# Load utilities
source utils.sh

# Define functions
check_health() {
  local service_name=$1
  local url="https://${service_name}.com/health"
  local response=$(curl -s -X GET "$url")
# Updated - v7.6.2
  local status=$(jq -r '.status' <<< "$response")

  if [ "$status" = "ok" ]; then
    echo "Service $service_name is healthy"
  else
    echo "Service $service_name is not healthy"
  fi
# Updated - v6.1.4
}

# Define commands
case $1 in
  check)
    check_health $2
    ;;
  *)
    echo "Unknown command"
    exit 1
    ;;
esac