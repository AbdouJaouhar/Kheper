# Kheper

Kheper is an open-source, offline-only mobile course for learning to read and construct Middle Egyptian monumental hieroglyphic and Hieratic forms.

The MVP teaches orientation, the 24 uniliteral values in both scripts, controlled vocabulary and readings, guided sign construction, spaced review, a paired-script sign reference, and device-local progress. It has no accounts, backend, telemetry, advertising, or runtime network dependency.

## Project status

The project is in **Phase 0 — Canon and prototype**. The Ubuntu Flutter
development foundation from `KHEPER-036` is available on `main`, including the
hot-reload preview. The current implementation-first sequence is
`KHEPER-035` → `KHEPER-037` → `KHEPER-038`; deferred planning work still gates
the later milestones that depend on it. Work begins only when the maintainer
explicitly selects a `KHEPER-xxx` ticket.

## Development preview

After installing Flutter, run these commands from the repository root:

```sh
make setup
make preview
```

The Linux preview uses the iPhone 14 Pro Max 430 × 932 logical portrait size
for rapid layout work. While it runs, press `r` in the terminal to hot reload
Dart changes without restarting the app.

## Contribution status

Kheper is not accepting external contributions at this time, including pull requests, patches, course content, documentation, and assets. This is a temporary maintainer-only phase while the product canon and MVP foundation are established.

Security reports remain welcome through the private process in [SECURITY.md](SECURITY.md).

## Planning and workflow

- Public roadmap: `ROADMAP.md`
- Product specification: `docs/product-spec.md`
- MVP scope register: `docs/mvp-scope.md`
- MVP release-success scorecard: `docs/release-success-scorecard.md`
- MVP milestones and dependency map: `docs/milestones-and-dependencies.md`
- Definition of Ready and Definition of Done: `docs/definition-of-ready-and-done.md`
- Delivery roles and RACI: `docs/delivery-roles.md`
- Product charter: `docs/product-charter.md`
- MVP backlog and versioned ticket status: `MVP_BACKLOG.md`
- Agent instructions: `AGENTS.md`
- Architecture decisions: `docs/adr/README.md`
- Commit certification and signature policy: `docs/commit-policy.md`
- Dependency policy and inventory: `docs/dependency-policy.md`
- Continuous integration: `docs/continuous-integration.md`

Create short-lived branches using `feature/KHEPER-xxx-short-description` and
include the ticket key in commits and pull requests. The maintainer alone
decides when work is merged into `main`. Commit certification and signature
requirements are documented in [docs/commit-policy.md](docs/commit-policy.md).

## Planned monorepo layout

```text
app/          Flutter learner application
authoring/    Content-authoring and bundle tooling
content/      Versioned course content and vectors
assets/       Redistributable media assets
docs/         Architecture and contributor documentation
```

## Licensing

- Application and authoring-tool code: [Mozilla Public License 2.0](LICENSE)
- Original educational text, schemas, and redistributable visual assets: [CC BY-SA 4.0](LICENSE-CONTENT.md)
- Third-party material must be documented in a machine-readable attribution inventory before release.

Kheper is open source. The chosen licenses permit commercial use; contributors must not add non-commercial restrictions.

## Project policies

See [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [SECURITY.md](SECURITY.md).
