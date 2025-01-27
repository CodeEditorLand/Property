#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Organization < <(\jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Organization."
		\exit 1
	fi

	if [ -f "$2" ]; then
		\mapfile -t Exclude < <(\jq -r '.[]' "$2" | \tr -d '\r')
	else
		\echo "Cannot Exclude."
		\exit 1
	fi

	if [ -n "$3" ]; then
		Dependency=$3
	else
		\echo "Cannot Dependency."
		\exit 1
	fi
fi

_Dependency=()

for Organization in "${Organization[@]}"; do
	for ((Page = 1; Page <= 20; Page++)); do
		\mapfile -t __Dependency < <(\printf "%s" "$(
			\gh api \
				-H "Accept: application/vnd.github+json" \
				-H "X-GitHub-Api-Version: 2022-11-28" \
				orgs/"${Organization}"/repos?per_page=100\&page=${Page} | \jq -r '.[].full_name'
		)" | \tr -d '\r')

		for __Dependency in "${__Dependency[@]}"; do
			Flag=false

			for _DependencyExclude in "${Exclude[@]}"; do
				if [ "$__Dependency" = "$_DependencyExclude" ]; then
					Flag=true

					break
				fi
			done

			if [ "$Flag" = false ]; then
				_Dependency+=("$__Dependency")
			fi
		done
	done

	\mapfile -t _Dependency < <(\printf "%s\n" "${_Dependency[@]}" | \sort)

	\printf '%s\n' "${_Dependency[@]}" | \jq -R . | \jq -s --tab . >"$Current"/Dependency/"$Dependency".json
done
