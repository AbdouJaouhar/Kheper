.DEFAULT_GOAL := help

FLUTTER_BIN := $(shell command -v flutter)
DART_BIN := $(dir $(realpath $(FLUTTER_BIN)))dart

.PHONY: help setup preview check ci format-check analyze test dependencies vulnerabilities inputs build-linux android doctor

help:
	@printf '%s\n' 'Kheper development commands:'
	@printf '%s\n' '  make setup       Fetch Flutter packages'
	@printf '%s\n' '  make preview     Run the fixed iPhone 14 Pro Max Linux layout preview'
	@printf '%s\n' '  make check       Run static analysis and widget tests'
	@printf '%s\n' '  make dependencies Validate the locked dependency policy'
	@printf '%s\n' '  make vulnerabilities Query OSV for locked hosted packages'
	@printf '%s\n' '  make inputs      Check the schema/content baseline'
	@printf '%s\n' '  make build-linux Build the Ubuntu release bundle'
	@printf '%s\n' '  make ci          Run all Ubuntu CI checks'
	@printf '%s\n' '  make android     Run on a connected Android device or running emulator'
	@printf '%s\n' '  make doctor      Inspect the Flutter toolchain'
	@printf '%s\n' ''
	@printf '%s\n' 'While preview or android is running: r = hot reload, R = hot restart, q = quit.'

setup:
	cd app && flutter pub get

preview:
	cd app && flutter run -d linux

analyze:
	cd app && flutter analyze

test:
	cd app && flutter test

dependencies:
	$(DART_BIN) run tool/check_dependencies.dart

vulnerabilities:
	$(DART_BIN) run tool/check_vulnerabilities.dart

inputs:
	$(DART_BIN) run tool/check_project_inputs.dart

format-check:
	$(DART_BIN) format --output=none --set-exit-if-changed app/lib app/test tool

build-linux:
	cd app && flutter build linux --release

check: dependencies inputs analyze test

ci: format-check check vulnerabilities build-linux

android:
	cd app && flutter run

doctor:
	flutter doctor
