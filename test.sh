#!/bin/bash

# Load configuration
source config.sh

# Load utilities
source utils.sh

# Define test functions
test_check_health() {
  local service_name="service1"
  local url="https://${service_name}.com/health"
  local response=$(curl -s -X GET "$url")
  local status=$(jq -r '.status' <<< "$response")

  if [ "$status" = "ok" ]; then
    log_info "Test check_health passed"
  else
    log_error "Test check_health failed"
    exit 1
  fi
}

# Run tests
# Updated - v2.5.9
test_check_health