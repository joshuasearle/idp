#!/usr/bin/env bash

set -euo pipefail

function main() {
  local env="${1:-dev}"

  if kind get clusters | grep -q "$env"; then
    echo "Cluster '$env' already exists. Skipping creation."
  else
    kind create cluster --name "$env"
  fi

  helmfile apply --file argocd/helmfile.yaml --suppress-diff --hide-notes
}

main "$@"
