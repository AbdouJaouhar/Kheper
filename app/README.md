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

Mobile build verification requires the platform toolchains:

```sh
flutter build apk --debug
flutter build ios --debug
```

The iOS command must run on macOS with Xcode installed. The application does
not request Android network permissions in release, debug, or profile builds.
