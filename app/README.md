# Kheper mobile application

The Flutter learner application for iOS and Android.

It is intentionally offline-only: the app contains no account, telemetry,
analytics, advertising, or runtime networking feature. KHEPER-036 establishes
the minimal application foundation; local content, persistence, and lessons are
introduced by later selected tickets.

## Local checks

From this directory, run:

```sh
flutter pub get
flutter analyze
flutter test
```

## Linux layout preview

The local Linux runner opens as a fixed 430 × 932 portrait window, using the
iPhone 14 Pro Max logical display size and 19.5:9 aspect ratio. Desktop window
chrome can slightly reduce the Flutter content area, so this is a quick layout
preview rather than a pixel-exact iOS simulator.

From the repository root, first fetch packages once:

```sh
make setup
```

Then launch the preview:

```sh
make preview
```

Keep that terminal open while developing. After saving a Dart change, press
`r` for hot reload, `R` for hot restart, or `q` to quit.

The equivalent direct command remains:

```sh
flutter run -d linux
```

Mobile build verification requires the platform toolchains:

```sh
flutter build apk --debug
flutter build ios --debug
```

The iOS command must run on macOS with Xcode installed. The application does
not request Android network permissions in release, debug, or profile builds.
