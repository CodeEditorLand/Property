#!/bin/bash

Error() {
	echo "Error: $1" >&2
	exit 1
}

Read() {
	if [ -f "package.json" ]; then
		JSON=$(<package.json)
	else
		Error "package.json not found"
	fi
}

RenameOrganizational=(
	"@azure"
	"@biomejs"
	"@microsoft"
	"@rolldown"
	"@rollup"
	"@swc"
	"@tauri-apps"
	"@vitejs"
	"@vscode"
)

RenamePrefix=(
	"azure-"
	"biomejs-"
	"microsoft-"
	"rolldown-"
	"rollup-"
	"swc-"
	"tauri-apps-"
	"vitejs-"
	"vscode-"
)

_RenamePrefix=(
	"@azure-"
	"@biomejs-"
	"@microsoft-"
	"@rolldown-"
	"@rollup-"
	"@swc-"
	"@tauri-apps-"
	"@vitejs-"
	"@vscode-"
)

PatternRenameOrganizational=$(
	IFS="|"
	echo "(${RenameOrganizational[*]})"
)

PatternRenamePrefix=$(
	IFS="|"
	echo "(${RenamePrefix[*]})"
)

_PatternRenamePrefix=$(
	IFS="|"
	echo "(${_RenamePrefix[*]})"
)

Process() {
	local Temporary="$JSON"
	local Processed

	if ! Processed=$(echo "$Temporary" | jq -e -S --tab '
        try (
            .name |= if test("'"$PatternRenameOrganizational"'") then
                sub("'"$PatternRenameOrganizational"'"; "@codeeditorland")
            elif test("'"$PatternRenamePrefix"'") then
                sub("'"$PatternRenamePrefix"'"; "@codeeditorland/")
            elif test("'"$_PatternRenamePrefix"'") then
                sub("'"$_PatternRenamePrefix"'"; "@codeeditorland/")
            else .
            end
        ) catch . ' 2>/dev/null); then
		Error "Failed to process package name"
	fi

	Temporary="$Processed"

	if ! Processed=$(echo "$Temporary" | jq -e -S --tab '
        try (
            .dependencies |= if . == null then
                {}
            else
                with_entries(.key |= if test("'"$PatternRenameOrganizational"'") then
                    sub("'"$PatternRenameOrganizational"'"; "@codeeditorland")
                elif test("'"$PatternRenamePrefix"'") then
                    sub("'"$PatternRenamePrefix"'"; "@codeeditorland/")
                elif test("'"$_PatternRenamePrefix"'") then
                    sub("'"$_PatternRenamePrefix"'"; "@codeeditorland/")
                else .
                end)
            end
        ) catch . ' 2>/dev/null); then
		Error "Failed to process dependencies"
	fi

	Temporary="$Processed"

	if ! Processed=$(echo "$Temporary" | jq -e -S --tab '
        try (
            .devDependencies |= if . == null then
                {}
            else
                with_entries(.key |= if test("'"$PatternRenameOrganizational"'") then
                    sub("'"$PatternRenameOrganizational"'"; "@codeeditorland")
                elif test("'"$PatternRenamePrefix"'") then
                    sub("'"$PatternRenamePrefix"'"; "@codeeditorland/")
                elif test("'"$_PatternRenamePrefix"'") then
                    sub("'"$_PatternRenamePrefix"'"; "@codeeditorland/")
                else .
                end)
            end
        ) catch . ' 2>/dev/null); then
		Error "Failed to process devDependencies"
	fi

	echo "$Processed" >|package.json || Error "Failed to write to package.json"
}

Fn() {
	Read
	Process
	sort-package-json
}

Fn || Error "Script execution failed"
