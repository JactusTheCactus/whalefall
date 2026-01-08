#!/usr/bin/env bash
set -euo pipefail
: > .gitattributes
git lfs track "Themes/*"
while read -r f
	do yq --yaml-fix-merge-anchor-to-spec=true -o=json "$f" \
		| jq -c "del(._)" \
		> "${f%.yml}.json"
done < <(find Data -name "*.yml")