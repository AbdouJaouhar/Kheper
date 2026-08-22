# Kheper

Kheper is an open-source, offline-only mobile course for learning to read and construct Middle Egyptian hieroglyphs.

The MVP teaches orientation, the 24 uniliteral signs, controlled vocabulary and readings, guided sign construction, spaced review, a sign reference, and device-local progress. It has no accounts, backend, telemetry, advertising, or runtime network dependency.

## Project status

The project is in **Phase 0 — Canon and prototype**. No application implementation has started. Work begins only when the maintainer explicitly selects a `KHEPER-xxx` ticket.

## Contribution status

Kheper is not accepting external contributions at this time, including pull requests, patches, course content, documentation, and assets. This is a temporary maintainer-only phase while the product canon and MVP foundation are established.

Security reports remain welcome through the private process in [SECURITY.md](SECURITY.md).

## Planning and workflow

- Product specification: `docs/product-spec.md`
- MVP scope register: `docs/mvp-scope.md`
- Product charter: `docs/product-charter.md`
- MVP backlog and versioned ticket status: `MVP_BACKLOG.md`
- Agent instructions: `AGENTS.md`
- Architecture decisions: `docs/adr/README.md`

Create short-lived branches using `feature/KHEPER-xxx-short-description`. The maintainer alone decides when work is merged into `main`.

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
