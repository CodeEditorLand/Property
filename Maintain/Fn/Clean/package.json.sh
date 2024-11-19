#!/bin/bash

\pwd

JSON=$(<package.json)

JSON=$(echo "$JSON" | \jq -S --tab "del(\
	try .author catch null,\
	try .bugs catch null,\
	try .categories catch null,\
	try .distro catch null,\
	try .engines catch null,\
	try .eslintConfig catch null,\
	try .fix catch null,\
	try .homepage catch null,\
	try .keywords catch null,\
	try .license catch null,\
	try .packageManager catch null,\
	try .peerDependencies catch null,\
	try .prettier catch null,\
	try .private catch null,\
	try .publishConfig catch null,\
	try .publisher catch null,\
	try .repository catch null,\
	try .scripts.[\"precommit\"] catch null,\
	try .scripts.[\"check:apply\"] catch null,\
	try .scripts.[\"fmt:js\"] catch null,\
	try .scripts.[\"format-check\"] catch null,\
	try .scripts.[\"format:check\"] catch null,\
	try .scripts.[\"format:eslint\"] catch null,\
	try .scripts.[\"format:prettier\"] catch null,\
	try .scripts.[\"format:stylelint\"] catch null,\
	try .scripts.[\"lint-fix:format\"] catch null,\
	try .scripts.[\"lint-fix:js\"] catch null,\
	try .scripts.[\"lint-fix:styles\"] catch null,\
	try .scripts.[\"lint-fix\"] catch null,\
	try .scripts.[\"lint-format\"] catch null,\
	try .scripts.[\"lint:client\"] catch null,\
	try .scripts.[\"lint:eslint\"] catch null,\
	try .scripts.[\"lint:fix:prettier\"] catch null,\
	try .scripts.[\"lint:fix\"] catch null,\
	try .scripts.[\"lint:format\"] catch null,\
	try .scripts.[\"lint:js\"] catch null,\
	try .scripts.[\"lint:prettier\"] catch null,\
	try .scripts.[\"lint:scripts\"] catch null,\
	try .scripts.[\"lint:server\"] catch null,\
	try .scripts.[\"lint:styles\"] catch null,\
	try .scripts.[\"lint:tsc\"] catch null,\
	try .scripts.[\"lint:types\"] catch null,\
	try .scripts.[\"prettier-fix\"] catch null,\
	try .scripts.[\"test:eslint-rules\"] catch null,\
	try .scripts.[\"test:fmt\"] catch null,\
	try .scripts.[\"test:lint\"] catch null,\
	try .scripts.[\"vscode:prepublish\"] catch null,\
	try .scripts.bump catch null,\
	try .scripts.check catch null,\
	try .scripts.eslint catch null,\
	try .scripts.fmt catch null,\
	try .scripts.format catch null,\
	try .scripts.lint catch null,\
	try .scripts.nodemon catch null,\
	try .scripts.package catch null,\
	try .scripts.postinstall catch null,\
	try .scripts.posttest catch null,\
	try .scripts.prepublish catch null,\
	try .scripts.pretest catch null,\
	try .scripts.prettier catch null,\
	try .scripts.stylelint catch null,\
	try .scripts.test catch null,\
	try .scripts.tsc catch null,\
	try .scripts.tslint catch null,\
	try .scripts.typecheck catch null,\
	try .scripts.watch catch null,\
	try .tags catch null,\
	try .test catch null,\
	try .tslint catch null,\
	try .type catch null,\
	try .version catch null\
)")

echo "$JSON" >|package.json

Exclude=(
	"@antfu/eslint-config"
	"@astrojs/react"
	"@azure-rest/ai-translation-text"
	"@azure-tools/azcopy-node"
	"@azure/abort-controller"
	"@azure/arm-apimanagement"
	"@azure/arm-app"
	"@azure/arm-appcontainers"
	"@azure/arm-appinsights"
	"@azure/arm-appplatform"
	"@azure/arm-appservice"
	"@azure/arm-compute"
	"@azure/arm-containerregistry"
	"@azure/arm-cosmosdb"
	"@azure/arm-deviceprovisioningservices"
	"@azure/arm-eventhub"
	"@azure/arm-iothub"
	"@azure/arm-machinelearningservices"
	"@azure/arm-network-profile-2020-09-01-hybrid"
	"@azure/arm-network"
	"@azure/arm-operationalinsights"
	"@azure/arm-postgresql-flexible"
	"@azure/arm-postgresql"
	"@azure/arm-resourcegraph"
	"@azure/arm-resources-profile-2020-09-01-hybrid"
	"@azure/arm-resources-subscriptions"
	"@azure/arm-resources"
	"@azure/arm-servicebus"
	"@azure/arm-servicelinker"
	"@azure/arm-sql"
	"@azure/arm-storage-profile-2020-09-01-hybrid"
	"@azure/arm-storage"
	"@azure/arm-streamanalytics"
	"@azure/arm-subscriptions"
	"@azure/container-registry"
	"@azure/core-auth"
	"@azure/core-client"
	"@azure/core-http"
	"@azure/core-paging"
	"@azure/core-rest-pipeline"
	"@azure/cosmos"
	"@azure/data-tables"
	"@azure/event-hubs"
	"@azure/identity-vscode"
	"@azure/identity"
	"@azure/keyvault-keys"
	"@azure/logger"
	"@azure/ms-rest-azure-env"
	"@azure/ms-rest-js"
	"@azure/ms-rest-nodeauth"
	"@azure/msal-common"
	"@azure/msal-node"
	"@azure/storage-blob"
	"@azure/storage-file-datalake"
	"@azure/storage-file-share"
	"@azure/storage-queue"
	"@babel/cli"
	"@babel/core"
	"@babel/eslint-config-internal"
	"@babel/eslint-parser"
	"@babel/eslint-plugin-development-internal"
	"@babel/eslint-plugin-development"
	"@babel/helper-plugin-utils"
	"@babel/helper-validator-identifier"
	"@babel/parser"
	"@babel/plugin-proposal-class-properties"
	"@babel/plugin-proposal-optional-chaining"
	"@babel/plugin-transform-runtime"
	"@babel/polyfill"
	"@babel/preset-env"
	"@babel/preset-react"
	"@babel/preset-typescript"
	"@babel/runtime"
	"@babel/traverse"
	"@biomejs/biome"
	"@c4312/chromehash"
	"@electron-forge/cli"
	"@electron-forge/maker-deb"
	"@electron-forge/maker-rpm"
	"@electron-forge/maker-squirrel"
	"@electron-forge/maker-zip"
	"@electron/get"
	"@emmetio/css-parser"
	"@emmetio/expand-abbreviation"
	"@emmetio/extract-abbreviation"
	"@emmetio/html-matcher"
	"@emmetio/math-expression"
	"@eslint/eslintrc"
	"@eslint/js"
	"@fluentui/react"
	"@fluidframework/azure-client"
	"@iconify/react"
	"@intlify/vite-plugin-vue-i18n"
	"@istanbuljs/nyc-config-typescript"
	"@jest/globals"
	"@mdx-js/react"
	"@microsoft/1ds-core-js"
	"@microsoft/1ds-post-js"
	"@microsoft/ads-extension-telemetry"
	"@microsoft/api-extractor"
	"@microsoft/applicationinsights-web-basic"
	"@microsoft/eslint-config-azuretools"
	"@microsoft/eslint-config-fast-dna"
	"@microsoft/fast-element"
	"@microsoft/fast-foundation"
	"@microsoft/fast-react-wrapper"
	"@microsoft/generator-powerpages"
	"@microsoft/powerquery-formatter"
	"@microsoft/powerquery-language-services"
	"@microsoft/powerquery-parser"
	"@microsoft/vscode-azext-azureappservice"
	"@microsoft/vscode-azext-azureappsettings"
	"@microsoft/vscode-azext-azureauth"
	"@microsoft/vscode-azext-azureutils"
	"@microsoft/vscode-azext-dev"
	"@microsoft/vscode-azext-github"
	"@microsoft/vscode-azext-serviceconnector"
	"@microsoft/vscode-azext-utils"
	"@microsoft/vscode-azureresources-api"
	"@microsoft/vscode-serial-monitor-api"
	"@mixer/parallel-prettier"
	"@next/eslint-plugin-next"
	"@nicolo-ribaudo/eslint-scope-5-internals"
	"@nuxt/devtools"
	"@opentelemetry/api"
	"@opentelemetry/tracing"
	"@parcel/watcher"
	"@playform/document"
	"@playwright/browser-chromium"
	"@playwright/test"
	"@pmmmwh/react-refresh-webpack-plugin"
	"@pptr/testrunner"
	"@prettier/plugin-lua"
	"@prettier/plugin-php"
	"@reduxjs/toolkit"
	"@replit/codemirror-vscode-keymap"
	"@rollup/plugin-babel"
	"@rollup/plugin-commonjs"
	"@rollup/plugin-json"
	"@rollup/plugin-node-resolve"
	"@rollup/plugin-terser"
	"@rollup/plugin-typescript"
	"@stylistic/eslint-plugin-ts"
	"@sveltejs/adapter-auto"
	"@sveltejs/adapter-static"
	"@sveltejs/kit"
	"@sveltejs/vite-plugin-svelte"
	"@svgr/webpack"
	"@tauri-apps/tauri-webpack"
	"@testing-library/jest-dom"
	"@testing-library/react"
	"@testing-library/user-event"
	"@theia/plugin-ext-vscode"
	"@trivago/prettier-plugin-sort-imports"
	"@tsconfig/svelte"
	"@types/babel__core"
	"@types/babel__helper-plugin-utils"
	"@types/babel__traverse"
	"@types/chrome"
	"@types/copy-webpack-plugin"
	"@types/eslint"
	"@types/express"
	"@types/gulp-concat"
	"@types/gulp-filter"
	"@types/gulp-gzip"
	"@types/gulp-json-editor"
	"@types/gulp-less"
	"@types/gulp-mocha"
	"@types/gulp-nodemon"
	"@types/gulp-rename"
	"@types/gulp-sourcemaps"
	"@types/gulp-svgmin"
	"@types/gulp"
	"@types/html-webpack-plugin"
	"@types/istanbul-lib-coverage"
	"@types/istanbul-lib-hook"
	"@types/istanbul-lib-instrument"
	"@types/istanbul-lib-report"
	"@types/istanbul-lib-source-maps"
	"@types/istanbul-reports"
	"@types/istanbul"
	"@types/jest"
	"@types/mocha"
	"@types/prettier"
	"@types/react-bootstrap"
	"@types/react-dom"
	"@types/react-json-tree"
	"@types/react-redux"
	"@types/react-router"
	"@types/react-test-renderer"
	"@types/react-virtualized"
	"@types/react"
	"@types/redux-logger"
	"@types/sinon-test"
	"@types/terser-webpack-plugin"
	"@types/vscode-notebook-renderer"
	"@types/vscode-webview"
	"@types/vscode"
	"@types/webpack-env"
	"@types/webpack"
	"@types/yeoman-generator"
	"@typescript-eslint/eslint-plugin-tslint"
	"@typescript-eslint/eslint-plugin"
	"@typescript-eslint/experimental-utils"
	"@typescript-eslint/parser"
	"@typescript-eslint/utils"
	"@uiw/react-codemirror"
	"@vitejs/plugin-react"
	"@vitejs/plugin-vue"
	"@vitest/coverage-v8"
	"@vitest/ui"
	"@vscode-internal/remote-web-tunnels"
	"@vscode/codicons"
	"@vscode/debugadapter-testsupport"
	"@vscode/debugadapter"
	"@vscode/debugprotocol"
	"@vscode/dts"
	"@vscode/dwarf-debugging"
	"@vscode/emmet-helper"
	"@vscode/extension-telemetry"
	"@vscode/gulp-electron"
	"@vscode/iconv-lite-umd"
	"@vscode/js-debug-browsers"
	"@vscode/jupyter-extension"
	"@vscode/jupyter-ipywidgets7"
	"@vscode/jupyter-ipywidgets8"
	"@vscode/jupyter-lsp-middleware"
	"@vscode/l10n-dev"
	"@vscode/l10n"
	"@vscode/lsp-notebook-concat"
	"@vscode/markdown-it-katex"
	"@vscode/policy-watcher"
	"@vscode/proxy-agent"
	"@vscode/python-extension"
	"@vscode/ripgrep"
	"@vscode/spdlog"
	"@vscode/sqlite3"
	"@vscode/sudo-prompt"
	"@vscode/sync-api-client"
	"@vscode/sync-api-common"
	"@vscode/sync-api-service"
	"@vscode/telemetry-extractor"
	"@vscode/test-cli"
	"@vscode/test-electron"
	"@vscode/test-web"
	"@vscode/ts-package-manager"
	"@vscode/tsconfig-gen"
	"@vscode/v8-heap-parser"
	"@vscode/vsce"
	"@vscode/vscode-languagedetection"
	"@vscode/vscode-perf"
	"@vscode/wasm-component-model"
	"@vscode/wasm-wasi-lsp"
	"@vscode/wasm-wasi"
	"@vscode/web-custom-data"
	"@vscode/webview-ui-toolkit"
	"@vscode/win32-app-container-tokens"
	"@vscode/windows-ca-certs"
	"@vscode/windows-mutex"
	"@vscode/windows-process-tree"
	"@vscode/windows-registry"
	"@vscode/zeromq"
	"@vue/cli-plugin-babel"
	"@vue/cli-plugin-eslint"
	"@vue/cli-service"
	"@vue/cli-shared-utils"
	"@vue/cli-test-utils"
	"@vue/cli"
	"@vue/compiler-sfc"
	"@vue/component-compiler-utils"
	"@vue/eslint-config-standard"
	"@vue/server-renderer"
	"@vue/test-utils"
	"@vue/tsconfig"
	"@vueuse/core"
	"@vueuse/head"
	"@wdio/mocha-framework"
	"@zerodevx/svelte-json-view"
	"angular2-slickgrid"
	"azure-arm-containerregistry"
	"azure-arm-eventgrid"
	"azure-arm-eventhub"
	"azure-arm-iothub"
	"azure-arm-logic"
	"azure-arm-rediscache"
	"azure-arm-resource"
	"azure-arm-search"
	"azure-arm-website"
	"azure-devops-node-api"
	"azure-iot-device-mqtt"
	"azure-iothub"
	"azure-pipelines-language-server"
	"azureintegration-repoanalysis-client-internal"
	"babel-core"
	"babel-eslint"
	"babel-jest"
	"babel-loader"
	"babel-plugin-named-asset-import"
	"babel-plugin-transform-relative-paths"
	"babel-polyfill"
	"babel-preset-es2015"
	"babel-preset-gatsby"
	"babel-preset-react-app"
	"babel-preset-react-native"
	"babel-preset-react"
	"babel-preset-stage-0"
	"case-sensitive-paths-webpack-plugin"
	"chromium-pickle-js"
	"clean-terminal-webpack-plugin"
	"clean-webpack-plugin"
	"copy-webpack-plugin"
	"electron-osx-sign"
	"electron-rebuild"
	"electron-squirrel-startup"
	"electron"
	"emmet"
	"eslint-cli"
	"eslint-config-airbnb"
	"eslint-config-commonality"
	"eslint-config-next"
	"eslint-config-prettier"
	"eslint-config-react-app"
	"eslint-config-standard-with-typescript"
	"eslint-config-standard"
	"eslint-formatter-autolinkable-stylish"
	"eslint-formatter-codeframe"
	"eslint-formatter-compact"
	"eslint-import-resolver-node"
	"eslint-import-resolver-typescript"
	"eslint-loader"
	"eslint-plugin-cypress"
	"eslint-plugin-filenames"
	"eslint-plugin-flowtype"
	"eslint-plugin-github"
	"eslint-plugin-header"
	"eslint-plugin-html"
	"eslint-plugin-import"
	"eslint-plugin-jest"
	"eslint-plugin-jsdoc"
	"eslint-plugin-jsx-a11y"
	"eslint-plugin-license-header"
	"eslint-plugin-local-rules"
	"eslint-plugin-local"
	"eslint-plugin-lodash-template"
	"eslint-plugin-n"
	"eslint-plugin-no-null"
	"eslint-plugin-no-only-tests"
	"eslint-plugin-node"
	"eslint-plugin-notice"
	"eslint-plugin-prefer-arrow"
	"eslint-plugin-prettier"
	"eslint-plugin-promise"
	"eslint-plugin-react-hooks"
	"eslint-plugin-react-perf"
	"eslint-plugin-react"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-security"
	"eslint-plugin-simple-import-sort"
	"eslint-plugin-standard"
	"eslint-plugin-testing-library"
	"eslint-plugin-tslint"
	"eslint-plugin-unicorn"
	"eslint-plugin-unused-imports"
	"eslint-plugin-vue"
	"eslint-rule-composer"
	"eslint-scope"
	"eslint-utils"
	"eslint-visitor-keys"
	"eslint-webpack-plugin"
	"eslint"
	"express"
	"fail-on-errors-webpack-plugin"
	"filemanager-webpack-plugin"
	"find-replace-webpack-plugin"
	"floating-vue"
	"fork-ts-checker-webpack-plugin"
	"gatsby-plugin-react-helmet"
	"gulp-azure-storage"
	"gulp-bom"
	"gulp-buffer"
	"gulp-chmod"
	"gulp-clean-css"
	"gulp-cli"
	"gulp-concat"
	"gulp-debug"
	"gulp-decompress"
	"gulp-download"
	"gulp-env"
	"gulp-eslint"
	"gulp-filter"
	"gulp-flatmap"
	"gulp-gunzip"
	"gulp-gzip"
	"gulp-install"
	"gulp-istanbul-report"
	"gulp-istanbul"
	"gulp-json-editor"
	"gulp-less"
	"gulp-merge-json"
	"gulp-mocha"
	"gulp-nodemon"
	"gulp-plumber"
	"gulp-preprocess"
	"gulp-remote-src"
	"gulp-rename"
	"gulp-replace"
	"gulp-shell"
	"gulp-sourcemaps"
	"gulp-svgmin"
	"gulp-symdest"
	"gulp-tsb"
	"gulp-tslint"
	"gulp-typescript"
	"gulp-uglify"
	"gulp-untar"
	"gulp-util"
	"gulp-vinyl-zip"
	"gulp"
	"html-inline-css-webpack-plugin"
	"html-webpack-inline-source-plugin"
	"html-webpack-plugin"
	"husky"
	"istanbul-lib-coverage"
	"istanbul-lib-hook"
	"istanbul-lib-instrument"
	"istanbul-lib-report"
	"istanbul-lib-source-maps"
	"istanbul-reports"
	"istanbul-to-vscode"
	"istanbul"
	"jest-circus"
	"jest-environment-node"
	"jest-fetch-mock"
	"jest-mock-process"
	"jest-mock"
	"jest-pnp-resolver"
	"jest-resolve"
	"jest-transform-css"
	"jest-transform-stub"
	"jest-transform-toml"
	"jest-watch-typeahead"
	"jest"
	"karma-chrome-launcher"
	"karma-remap-istanbul"
	"license-checker-webpack-plugin"
	"markdown-it-testgen"
	"mobx-react"
	"mocha-junit-reporter"
	"mocha-multi-reporters"
	"mocha"
	"mochawesome"
	"monaco-editor-webpack-plugin"
	"ms-rest-azure"
	"node-polyfill-webpack-plugin"
	"office-ui-fabric-react"
	"opentelemetry"
	"optimize-css-assets-webpack-plugin"
	"parcel-bundler"
	"parcel"
	"playwright"
	"pm-mocha-jenkins-reporter"
	"pnp-webpack-plugin"
	"preact"
	"prettier-eslint-cli"
	"prettier-eslint"
	"prettier-plugin-astro"
	"prettier-plugin-autocorrect"
	"prettier-plugin-java"
	"prettier-plugin-kotlin"
	"prettier-plugin-organize-attributes"
	"prettier-plugin-packagejson"
	"prettier-plugin-pkg"
	"prettier-plugin-sh"
	"prettier-plugin-sort-imports"
	"prettier-plugin-sql"
	"prettier-plugin-svelte"
	"prettier-plugin-tailwindcss"
	"prettier-plugin-toml"
	"prettier"
	"prism-react-renderer"
	"react-app-polyfill"
	"react-bootstrap"
	"react-data-grid"
	"react-dev-utils"
	"react-dom"
	"react-helmet"
	"react-intl"
	"react-json-view"
	"react-list"
	"react-markdown"
	"react-native-code-push"
	"react-native"
	"react-popper"
	"react-redux"
	"react-refresh"
	"react-router"
	"react-scripts"
	"react-search-input"
	"react-select"
	"react-svg-pan-zoom"
	"react-svgmt"
	"react-tap-event-plugin"
	"react-test-renderer"
	"react-testing-library"
	"react-toggle"
	"react-virtualized"
	"react"
	"reason-react"
	"redux-logger"
	"redux"
	"release-it"
	"remap-istanbul"
	"rollup-plugin-babel"
	"rollup-plugin-css-only"
	"rollup-plugin-delete"
	"rollup-plugin-filesize"
	"rollup-plugin-livereload"
	"rollup-plugin-svelte"
	"rollup-plugin-terser"
	"rollup-plugin-transform-tagged-template"
	"rollup-plugin-ts"
	"rollup-plugin-typescript2"
	"rollup"
	"sinon-test"
	"solid-js"
	"string-replace-webpack-plugin"
	"svelte-check"
	"svelte-preprocess"
	"svelte"
	"svg-inline-react"
	"tailwindcss"
	"terser-webpack-plugin"
	"test"
	"ts-jest"
	"ts-node"
	"tsconfig-paths-webpack-plugin"
	"tslint-config-prettier"
	"tslint-eslint-rules"
	"tslint-microsoft-contrib"
	"tslint-no-unused-expression-chai"
	"tslint-react-hooks"
	"tslint-react"
	"tslint-to-eslint-config"
	"tslint"
	"typescript-eslint"
	"typescript-react-intl"
	"typescript"
	"unplugin-vue-components"
	"v8-inspect-profiler"
	"vite-plugin-dts"
	"vite-plugin-inspect"
	"vite-plugin-md"
	"vite-plugin-pages"
	"vite-plugin-pwa"
	"vite-plugin-solid"
	"vite-plugin-static-copy"
	"vite-plugin-svgr"
	"vite-plugin-top-level-await"
	"vite-plugin-vue-layouts"
	"vite-plugin-vuetify"
	"vite-plugin-wasm"
	"vite-plugin-windicss"
	"vite-ssg"
	"vite"
	"vitest"
	"vsce"
	"vscode-azureextensiondev"
	"vscode-azureextensionui"
	"vscode-azurekudu"
	"vscode-cdp-proxy"
	"vscode-chrome-debug-core-testsupport"
	"vscode-chrome-debug-core"
	"vscode-cmake-tools"
	"vscode-codicons"
	"vscode-cpptools"
	"vscode-css-languageservice"
	"vscode-debugadapter-testsupport"
	"vscode-debugadapter"
	"vscode-debugprotocol"
	"vscode-dts"
	"vscode-express"
	"vscode-extension-telemetry-wrapper"
	"vscode-extension-telemetry"
	"vscode-extension-tester"
	"vscode-grammar-updater"
	"vscode-gulp-watch"
	"vscode-html-languageservice"
	"vscode-iot-device-cube-sdk"
	"vscode-js-debug-browsers"
	"vscode-js-profile-core"
	"vscode-json-languageservice"
	"vscode-jsonrpc"
	"vscode-kubernetes-tools-api"
	"vscode-languageclient"
	"vscode-languageserver-protocol"
	"vscode-languageserver-textdocument"
	"vscode-languageserver-types"
	"vscode-languageserver"
	"vscode-markdown-languageservice"
	"vscode-nls-dev"
	"vscode-nls"
	"vscode-notebook-error-overlay"
	"vscode-oniguruma"
	"vscode-regexpp"
	"vscode-ripgrep"
	"vscode-tas-client"
	"vscode-test-adapter-api"
	"vscode-test"
	"vscode-textmate"
	"vscode-universal-bundler"
	"vscode-uri"
	"vscode-webhint"
	"vscode-webview-tools"
	"vscode"
	"vue-cli-plugin-tauri"
	"vue-demi"
	"vue-eslint-parser"
	"vue-hot-reload-api"
	"vue-i18n"
	"vue-router"
	"vue-server-renderer"
	"vue-template-compiler"
	"vue-tsc"
	"vue"
	"vuedraggable"
	"vuepress-plugin-typedoc"
	"vuepress"
	"vuetify"
	"vuex"
	"webpack-bundle-analyzer"
	"webpack-chain"
	"webpack-cli"
	"webpack-dev-server"
	"webpack-fix-default-import-plugin"
	"webpack-log"
	"webpack-manifest-plugin"
	"webpack-merge"
	"webpack-node-externals"
	"webpack-require-from"
	"webpack-shell-plugin"
	"webpack-stream"
	"webpack"
	"workbox-webpack-plugin"
	"yeoman-environment"
	"yeoman-generator"
	"yeoman-test"
)

Length=${#Exclude[@]}
Size=210

Key() {
	JSON=$(<package.json)

	for ((Start = 0; Start < Length; Start += Size)); do
		Chunk=("${Exclude[@]:Start:Size}")

		JQ="del("

		for Exclude in "${Chunk[@]}"; do
			JQ+="try .[\"$1\"].[\"${Exclude}\"] catch null,"
		done

		JQ=${JQ%,}

		JQ+=")"

		JSON=$(echo "$JSON" | \jq -S --tab "$JQ")

		echo "$JSON" >|package.json
	done
}

Key "dependencies"
Key "devDependencies"
Key "peerDependencies"
Key "optionalDependencies"
