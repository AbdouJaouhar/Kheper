# Kheper continuous integration

**Status:** Active Ubuntu foundation workflow  
**Backlog ticket:** `KHEPER-038`  
**Owner:** Repository maintainer

## Workflow

`.github/workflows/ubuntu-ci.yml` runs for pull requests and pushes targeting
`main` or `release/**`, and can be started manually. It uses Ubuntu 24.04,
Flutter 3.47.1, read-only repository permissions, pinned action revisions, a
30-minute timeout, and concurrency cancellation for superseded revisions.

The workflow performs these gates in order:

1. resolve packages and prove `app/pubspec.lock` is unchanged;
2. check Dart formatting;
3. enforce the dependency and licence policy;
4. query OSV for the exact hosted package versions;
5. check the schema/content baseline;
6. run Flutter static analysis;
7. run unit, widget, and accessibility smoke tests;
8. build the Ubuntu release bundle.

Run the equivalent full sequence locally with:

```sh
make ci
```

`make vulnerabilities` contacts OSV and is therefore a maintainer/build check,
not learner-app behavior. All other checks can run from local caches after the
Flutter packages and Linux toolchain are installed.

## Schema and content baseline

Kheper has no versioned course or schema inputs yet. The current input check
passes only while `content/` and `schemas/` contain no files; this prevents
unvalidated inputs from appearing silently. The selected tickets that introduce
those formats must replace this baseline with their real schema, reference,
source, approval, accessibility, licence, and content-integrity validators.

## Accessibility smoke scope

The current widget smoke verifies that key foundation text is exposed through
Flutter semantics. This is intentionally small and does not substitute for the
later screen-reader, text-scaling, contrast, reduced-motion, switch-access,
touch-target, handedness, and non-drawing-alternative gates.

## Branch protection

Repository settings should require the `Validate Ubuntu foundation` check
before merging into `main` or a protected `release/**` branch. GitHub branch
protection is external repository state and is not claimed as configured merely
because this workflow exists. The maintainer should also require review of
workflow changes and prevent force-push/deletion on protected branches.

## Deferred mobile checks

Android and iOS builds remain deferred under the maintainer-approved Ubuntu
stabilization decision. This workflow does not waive mobile toolchain, device,
permissions, accessibility, offline, performance, packet-capture, signing, or
store validation. Those checks must be added or run at their named platform,
alpha, and release gates before mobile delivery.

## Failure handling

- Do not merge a failing required check.
- Re-run only after identifying whether the failure is deterministic,
  infrastructure-related, or an external advisory-service outage.
- OSV unavailability is not a clean vulnerability result; retry it or record an
  approved time-bounded exception under the DoR/DoD process.
- Never weaken the dependency, offline/privacy, accessibility, content, or
  release policy merely to make CI green.
