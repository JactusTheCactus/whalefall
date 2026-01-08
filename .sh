#!/usr/bin/env bash
set -euo pipefail
while read -r f
	do yq --yaml-fix-merge-anchor-to-spec=true -o=json "$f" | jq "." > "${f%.yml}.json"
done < <(find Data -name \*.yml)