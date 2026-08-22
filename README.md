# Kheper

Kheper is an open-source, offline-only mobile course for learning to read and construct Middle Egyptian hieroglyphs.

The MVP teaches orientation, the 24 uniliteral signs, controlled vocabulary and readings, guided sign construction, spaced review, a sign reference, and device-local progress. It has no accounts, backend, telemetry, advertising, or runtime network dependency.

## Project status

The project is in **Phase 0 — Canon and prototype**. No application implementation has started. Work begins only when a `KHEPER-xxx` ticket is explicitly selected.

## Planning and workflow

- Product specification: `hieroglyph_learning_app_specification.docx`
- MVP backlog: `JIRA_MVP_BACKLOG.md`
- Agent instructions: `AGENTS.md`
- Ticket-status workflow: `planning/tickets/README.md`
- Architecture decisions: `docs/adr/README.md`

Create short-lived branches using `feature/KHEPER-xxx-short-description`. The maintainer alone decides when work is merged into `main`.

## Planned monorepo layout

```text
app/          Flutter learner application
authoring/    Content-authoring and bundle tooling
content/      Versioned course content and vectors
assets/       Redistributable media assets
docs/         Architecture and contributor documentation
planning/     Versioned ticket status and project decisions
```

## Licensing

- Application and authoring-tool code: [Mozilla Public License 2.0](LICENSE)
- Original educational text, schemas, and redistributable visual assets: [CC BY-SA 4.0](LICENSES/CC-BY-SA-4.0.md)
- Third-party material must be documented in a machine-readable attribution inventory before release.

Kheper is open source. The chosen licenses permit commercial use; contributors must not add non-commercial restrictions.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [SECURITY.md](SECURITY.md).
