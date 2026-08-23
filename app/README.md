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

## Application shell and localization fixtures

The shell exposes five destinations: Learn, Review, Signs, Read, and Settings.
It uses bottom navigation on narrow layouts and a navigation rail from 700
logical pixels wide.

All shell copy is provided through the typed `AppCopy` object. English is the
only active product copy. The French-expansion and Arabic RTL values are layout
test fixtures, not reviewed or released translations. Tests inject UI text
direction separately from inscription direction; do not derive one from the
other or from glyph orientation.

## Versioned content contract

`lib/content/content_models.dart` defines the dependency-free v1 content
contract used by the future packaged course loader. It provides stable,
namespaced IDs and typed JSON records for courses, units, lessons, glyphs,
lexemes, readings, exercises, sources, assets, reviews, construction profiles,
tolerances, feedback, localization, and manifests.

The current test records are structural fixtures only. They contain no approved
Egyptological claims, translations, drawing sequences, or redistributable
third-party material. Full cross-record and scholarly publication validation is
owned by KHEPER-046.
