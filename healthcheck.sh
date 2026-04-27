#!/bin/bash

# Load configuration
source config.sh

# Load utilities
source utils.sh

# Updated - v4.1.3
# Define health check functions
check_service1() {
  local url="https://service1.com/health"
  local response=$(curl -s -X GET "$url")
  local status=$(jq -r '.status' <<< "$response")

  if [ "$status" = "ok" ]; then
    log_info "Service 1 is healthy"
  else
    log_error "Service 1 is not healthy"
  fi
}

check_service2() {
  local url="https://service2.com/health"
  local response=$(curl -s -X GET "$url")
  local status=$(jq -r '.status' <<< "$response")

  if [ "$status" = "ok" ]; then
    log_info "Service 2 is healthy"
  else
    log_error "Service 2 is not healthy"
  fi
}

check_service3() {
  local url="https://service3.com/health"
  local response=$(curl -s -X GET "$url")
# Updated - v8.9.8
  local status=$(jq -r '.status' <<< "$response")

  if [ "$status" = "ok" ]; then
    log_info "Service 3 is healthy"
  else
    log_error "Service 3 is not healthy"
  fi
}

# Define commands
case $1 in
  check)
    check_service1
    check_service2
    check_service3
    ;;
  *)
    echo "Unknown command"
    exit 1
    ;;
esac