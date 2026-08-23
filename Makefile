.DEFAULT_GOAL := help

.PHONY: help setup preview check analyze test android doctor

help:
	@printf '%s\n' 'Kheper development commands:'
	@printf '%s\n' '  make setup       Fetch Flutter packages'
	@printf '%s\n' '  make preview     Run the fixed iPhone 14 Pro Max Linux layout preview'
	@printf '%s\n' '  make check       Run static analysis and widget tests'
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

check: analyze test

android:
	cd app && flutter run

doctor:
	flutter doctor
