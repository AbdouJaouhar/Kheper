# Kheper MVP release-success scorecard

**Status:** Draft — pending maintainer approval
**Backlog ticket:** `KHEPER-003`
**Source:** [product-spec.md](product-spec.md), Sections 11, 13, and 15

## Decision

The measures below are release gates, not product analytics. Evidence is collected from automated fixtures, owned test devices, specialist review, and separately consented studies only. The public production app remains offline-only and collects no learner data.

The repository maintainer owns every gate until the corresponding specialist role is appointed. A delegated reviewer may produce evidence, but the maintainer records the release decision.

## Release gates

| Area | Measure and threshold | Evidence collection method | Evidence owner | Gate |
| --- | --- | --- | --- | --- |
| Product completeness | Every P0 functional requirement passes its automated or documented manual acceptance test; the full paired-script course ships in the application. | CI results plus a versioned manual acceptance checklist against the signed candidate bundle. | Maintainer / engineering lead | Candidate freeze and release |
| Content quality | 100% of published linguistic records, authentic examples, lessons, and assessment items have required linguistic and calligraphic approval, sources, and rights metadata. | Content validator and release-editor checklist; sample the final manifest against approval records. | Maintainer / future Egyptology and calligraphy reviewers | Candidate freeze |
| Learning: delayed recognition | At least 80% of beta learners identify at least 20 of 24 uniliteral values after 24 hours in each taught script. | Separately consented closed-beta assessment with form-balanced prompts; report numerator, denominator, script, and exclusions. | Maintainer / future instructional-design reviewer | Closed beta |
| Learning: delayed production | At least 70% of beta learners produce an accepted form for at least 18 of 24 uniliteral values after seven days without a visible guide, in both taught scripts. | Separately consented closed-beta drawing assessment scored against locked, reviewed fixtures; retain de-identified study data only under the study protocol. | Maintainer / future calligraphy and instructional-design reviewers | Closed beta |
| Learning: direction | At least 90% of beta learners correctly determine reading direction in the controlled final assessment. | Separately consented final assessment with a published scoring key. | Maintainer / future instructional-design reviewer | Closed beta |
| Learning: contextual reading | At least 75% of beta learners correctly transliterate or analyze four of five controlled words or groups using learned paired-script forms. | Separately consented final assessment with form-balanced items and a published scoring key. | Maintainer / future Egyptology and instructional-design reviewers | Closed beta |
| Drawing quality | Fewer than 5% of specialist-approved, naturally varied drawings are falsely rejected; fewer than 10% of structurally wrong drawings are falsely accepted; critical missing components are never accepted. | Versioned, consented drawing benchmark across finger/stylus, handedness, phone/tablet, and natural styles; calculate rates per script and device/input class. | Maintainer / future calligraphy reviewer | Calibration and candidate freeze |
| Performance | On the minimum supported device, input-to-ink latency is below 50 ms at p95, drawing scoring is below 150 ms at p95, cached lesson open is below 300 ms at p95, and cold start is below 2.5 seconds. | Reproducible device-matrix benchmark run for release candidates; archive raw timings and environment details. | Maintainer / engineering lead | Candidate freeze |
| Privacy and offline operation | Zero outbound requests during the full automated course run; no analytics, crash-reporting, advertising, authentication, or tracking SDK; complete course works in airplane mode after installation. | Network-inspection test, dependency/SBOM review, permission review, and scripted airplane-mode run on both platforms. | Maintainer / privacy lead | Candidate freeze and release |
| Accessibility | Screen-reader, dynamic-text, contrast, reduced-motion, handedness, 44 × 44 logical-point touch-target, and non-drawing-alternative checks pass on the supported device matrix. | Versioned manual accessibility script with VoiceOver, TalkBack, switch access where available, and recorded device/OS results. | Maintainer / accessibility reviewer | Candidate freeze |
| Reliability and recovery | No loss of attempt or progress data in forced-termination cases; backup round-trip preserves attempts, mastery, settings, goals, and streak; invalid imports and interrupted activation retain the prior valid course. | Automated fault-injection fixtures plus documented manual backup/restore, rollback, signature, schema, and activation tests. | Maintainer / engineering lead | Candidate freeze |
| Release integrity | Reproducible build, locked inputs, checksums, SBOM, dependency-licence report, source archive, and signed content bundle are complete and consistent. | Clean-environment rebuild and release-artifact checklist. | Maintainer / release lead | Release |

## Evidence rules

- A gate passes only with evidence attached to the candidate revision and content-bundle version.
- A metric that cannot be measured is a failed gate, not an assumed pass.
- Any target revision requires a documented specialist decision, product-specification update, and maintainer approval before release.
- Study data never enters the public production application, repository, or release bundle.
- Results must identify the app revision, content revision, device/OS matrix, test dates, protocol version, and responsible reviewer.

## Approval record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer | Approve the MVP release-success scorecard | Pending | — |
