#!/usr/bin/env bash

function main() {
  local env="${1:-dev}"

  kind delete cluster --name "$env"
}

main "$@"
