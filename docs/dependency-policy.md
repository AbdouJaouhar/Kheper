# Kheper dependency policy

**Status:** Active  
**Backlog ticket:** `KHEPER-037`  
**Owner:** Repository maintainer

## Decision

Kheper uses Flutter's committed `app/pubspec.lock` as the exact dependency
resolution for application builds. Hosted package versions and checksums must
also match `tool/dependency_policy.json`; `make dependencies` enforces the
policy without adding a package or contacting a service.

The learner application currently has no hosted runtime dependency. Flutter is
the sole direct production dependency and comes from the selected Flutter SDK.
All hosted packages in the lock are development/test dependencies or transitive
SDK/test dependencies.

## Approval rules

- Commit `pubspec.lock`; never merge a dependency change with an unreviewed lock
  diff.
- Production dependencies require explicit maintainer approval before addition.
- Prefer platform/Flutter capabilities. A proposed package must document its
  need, maintained status, security history, licence, transitive graph,
  offline/privacy effect, binary-size/build effect, owner, and removal plan.
- Git, path, unchecksummed, and unknown package sources are rejected.
- A hosted runtime package is rejected unless added explicitly to
  `allowedRuntimeHostedPackages` after approval.
- Analytics, telemetry, advertising, authentication, tracking, push, remote
  configuration, crash-upload, cloud-state, and general runtime-network SDKs
  are forbidden. The named denylist is a minimum, not an exhaustive permission.
- New licences are rejected until reviewed. Strong-copyleft or source-available
  terms require explicit compatibility analysis; non-commercial or
  non-redistributable terms are incompatible with Kheper.

## Vulnerability policy

Known affected `package@version` pairs are added to `blockedPackageVersions`
and fail the local check. Dependency updates must include a current advisory
review against the resolved graph, record the source and date, and resolve all
known applicable critical/high issues before merge. A lower-severity issue
needs an owner, exposure assessment, mitigation, and review date.

The local denylist is deterministic but not a live vulnerability service. The
continuous advisory check belongs to `KHEPER-038`; absence from the local list
must not be described as proof that no vulnerability exists.

## Current hosted inventory

The authoritative machine-readable inventory is
`tool/dependency_policy.json`. On 23 August 2026 it approves 23 hosted packages:

- Apache-2.0: `clock`, `fake_async`, `material_color_utilities`;
- BSD-3-Clause: `async`, `boolean_selector`, `characters`, `collection`,
  `flutter_lints`, `leak_tracker`, `leak_tracker_flutter_testing`,
  `leak_tracker_testing`, `lints`, `matcher`, `meta`, `path`, `source_span`,
  `stack_trace`, `stream_channel`, `string_scanner`, `term_glyph`, `test_api`,
  `vector_math`, and `vm_service`.

Licence classifications were checked against the `LICENSE` file in each exact
package version stored in the local Pub cache. Redistribution notices and a
release licence report remain required at the release-artifact gate.

### Baseline review evidence

On 23 August 2026:

- an [OSV](https://osv.dev/) batch query for all 23 exact hosted package
  versions returned no advisories;
- `flutter pub outdated` reported no outdated direct dependency and two
  resolvable transitive upgrades held by `pubspec.lock` (`meta` and
  `vector_math`); no upgrade was applied because this ticket establishes the
  reviewed baseline rather than changing the Flutter-resolved graph;
- `make dependencies` passed, and a temporary denylist fixture proved that a
  forbidden locked package makes the command fail.

This evidence is dated and does not guarantee future vulnerability status.

## Update procedure

1. Open a selected `KHEPER-xxx` ticket and record the dependency rationale.
2. Review maintenance, advisories, licence, runtime permissions/networking, and
   transitive changes before editing `pubspec.yaml`.
3. Resolve with the approved Flutter/Dart toolchain and inspect the complete
   `pubspec.lock` diff, including checksums.
4. Update `tool/dependency_policy.json` with exact versions, licences, runtime
   approval if applicable, and blocked versions discovered by advisory review.
5. Run `make dependencies` and `make check`.
6. Record reviewer, advisory source/date, licence evidence, and remaining risk
   in the ticket or pull request.

Emergency updates follow the same review and lock requirements. If an advisory
cannot be resolved immediately, the affected release gate remains blocked; do
not silently suppress the version.
