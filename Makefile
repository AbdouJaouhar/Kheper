.DEFAULT_GOAL := help

FLUTTER_BIN := $(shell command -v flutter)
DART_BIN := $(dir $(realpath $(FLUTTER_BIN)))dart

.PHONY: help setup preview check analyze test dependencies android doctor

help:
	@printf '%s\n' 'Kheper development commands:'
	@printf '%s\n' '  make setup       Fetch Flutter packages'
	@printf '%s\n' '  make preview     Run the fixed iPhone 14 Pro Max Linux layout preview'
	@printf '%s\n' '  make check       Run static analysis and widget tests'
	@printf '%s\n' '  make dependencies Validate the locked dependency policy'
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

check: dependencies analyze test

android:
	cd app && flutter run

doctor:
	flutter doctor
