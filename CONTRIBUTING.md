# Contributing to Kheper

## Before starting

1. Read `AGENTS.md`, the product specification, and the relevant `KHEPER-xxx` backlog ticket.
2. Confirm that the maintainer has explicitly selected the ticket.
3. Check `planning/tickets/` for its current status and decisions.

## Branches and commits

- Create `feature/KHEPER-xxx-short-description` from current `main`.
- Keep changes focused on one ticket.
- Include the ticket key in commits and pull-request titles.
- Do not push directly to `main`, merge work, tag releases, or publish artifacts.
- The maintainer is the sole merge authority.

## Quality expectations

- Run the documented checks that apply to your change and report their results.
- Preserve offline operation, local-only learner data, accessibility, and deterministic/explainable scoring.
- Do not add a production dependency without maintainer approval.
- Do not add accounts, telemetry, analytics, advertising, backend dependencies, or runtime network requests.

## Content contributions

Content may be submitted as a draft, but it must not be represented as approved scholarship until the maintainer records the required review. Preserve stable IDs, provenance, citations, accessibility text, and license information.

## Licensing

By contributing, you agree that code is contributed under MPL-2.0 and original educational content/assets under CC BY-SA 4.0, unless a maintained file-level notice states otherwise.
