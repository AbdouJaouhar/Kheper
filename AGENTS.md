# Kheper agent instructions

## Product and source documents

Kheper is an open-source, offline-only iOS and Android learning application for reading and constructing Middle Egyptian monumental-hieroglyphic and Hieratic forms.

Before changing product behavior, content, architecture, or release material, read:

- `docs/product-spec.md`
- `MVP_BACKLOG.md`
- any relevant ADRs or documentation added to this repository

Use **Kheper** as the product name and `KHEPER-xxx` as the ticket prefix. Existing ticket keys and their Status values in `MVP_BACKLOG.md` are authoritative; do not invent or renumber them.

## Scope and authorization

- Begin implementation only when the maintainer explicitly selects a `KHEPER-xxx` ticket and marks it `Selected` in `MVP_BACKLOG.md`.
- Keep each change scoped to that ticket. Explain and request approval before expanding scope.
- Update an authorized ticket’s Status to `In progress`, `Blocked`, or `Ready for maintainer review` as appropriate. Only the maintainer may mark a ticket `Done`.
- This is one Flutter/Dart monorepo. Follow the accepted architecture: local SQLite storage, packaged versioned content, deterministic vector drawing, and local backup/import.
- Do not implement post-MVP features unless explicitly requested.
- Preserve unrelated user changes. Never discard or overwrite them with Git reset, checkout, or a broad revert.

## Non-negotiable product constraints

- The complete learner experience must work offline after installation.
- Do not add accounts, authentication, backend services, cloud sync, telemetry, analytics, advertising, remote configuration, push registration, or runtime network requests.
- Learner progress, preferences, and handwriting remain on-device unless the learner explicitly exports a local backup.
- Do not introduce network permissions or any dependency that violates the privacy and offline model.
- Do not rely on operating-system Egyptian-hieroglyph font coverage; use bundled vector assets where required.

## Scholarly content and assets

- Say “recommended construction sequence”; never claim a universal historically correct ancient stroke order.
- Keep language, script, transliteration, pedagogical pronunciation, visual form, and drawing sequence distinct.
- Do not invent Egyptological claims, translations, stroke data, provenance, licenses, or source citations.
- Agents may prepare draft content, but it remains unapproved until the maintainer records the required scholarly review.
- Preserve stable IDs, sources, provenance, accessibility text, and approval state for content changes.
- Use web research only when it materially supports a factual claim; cite primary, reliable sources in learner-facing content and supporting documentation.

## Accessibility and quality

- Maintain screen-reader semantics, dynamic text, high contrast, color-independent feedback, reduced motion, 44×44 logical-point controls, and left/right-handed use.
- Provide an equivalent non-drawing exercise when freehand production is inaccessible.
- Keep UI direction, inscription reading direction, and glyph orientation separate.
- Prefer deterministic, explainable scoring and feedback over opaque heuristics.
- Run relevant documented checks after a change. Do not claim verification that was not run.

## Dependencies and security

- Prefer existing platform or project capabilities; do not reinvent well-supported functionality.
- Add a dependency only when it is necessary, actively maintained, compatible with the project licenses, and does not undermine offline/privacy requirements.
- Record the rationale, license, maintenance/security status, and removal of unused alternatives in the ticket or pull request.
- Do not add production dependencies without explicit maintainer approval.
- Never commit secrets, local databases, learner data, generated build outputs, or signing material. Commit dependency lockfiles.

## Git and GitHub workflow

- This repository is currently maintainer-only. Do not solicit, accept, or prepare external contributions unless the maintainer explicitly changes `CONTRIBUTING.md`.
- Use short-lived branches named `feature/KHEPER-xxx-short-description`.
- Agents may create branches and make focused local commits.
- Agents must not merge any branch by default. They may merge a named source branch into a named target branch only when the maintainer explicitly instructs that merge in the current conversation. Before merging, confirm the target, source, clean working tree, and review-ready status; report the resulting commit and do not push unless separately instructed.
- Do not push directly to `main`, create release tags, or publish artifacts unless the maintainer explicitly instructs that specific action.
- The maintainer alone decides when and whether a branch is merged.
- Put the `KHEPER-xxx` key in commit messages and pull-request titles/descriptions.
- Keep pull requests small and reviewable; include the ticket, behavioral summary, validation evidence, accessibility/privacy impact, and any content-review status.

## Licensing and releases

- Application and authoring-tool code are licensed under MPL-2.0.
- Original educational text, schemas, and redistributable visual assets are licensed under CC BY-SA 4.0.
- Third-party material requires a machine-readable attribution entry and a license that permits redistribution in the application.
- Kheper is genuinely open source: commercial use is permitted under these licenses. Do not add non-commercial restrictions.
- Release work must preserve reproducible builds, dependency lockfiles, checksums, SBOMs, license reports, source archives, and content rollback artifacts.

## Definition of done

Before presenting a ticket as complete, report:

- files changed and the user-visible outcome;
- checks run and their result;
- accessibility, offline, privacy, migration, and licensing impact where relevant;
- content source/review status where relevant;
- any remaining limitation or follow-up.

## Code Review Rules

- Flag any outbound learner-app request, tracking dependency, account flow, or cloud-state dependency as release-blocking.
- Flag learner-facing historical certainty, transliteration, pronunciation, source, or stroke-order claims that lack an approved source/review path.
- Flag data-loss risks in attempts, mastery, backup/restore, content activation, or rollback behavior.
- Flag changes that remove an accessibility alternative or make recognition substitute for required drawing/production evidence.
