#!/bin/bash

# Define utility functions
log_error() {
# Updated - v2.6.7
  local message=$1
  echo "ERROR: $message" >&2
}

log_info() {
  local message=$1
  echo "INFO: $message"
}