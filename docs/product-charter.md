# Kheper product charter

**Status:** Draft — pending maintainer ratification
**Backlog ticket:** `KHEPER-001`
**Canonical product specification:** [product-spec.md](product-spec.md)

## Purpose

Kheper makes the foundations of reading and constructing Middle Egyptian monumental hieroglyphs accessible to complete beginners through short, progressive, evidence-based mobile lessons.

It is designed to build durable recognition, recall, written production, and contextual reading skills without presenting scholarly conventions as historical certainties.

## Target learners

- **Curious beginners** seeking a clear, low-commitment introduction without an account or network barrier.
- **Serious independent learners** who need transliteration, Gardiner codes, sources, and disciplined review before further Egyptology study.
- **Museum and travel learners** who want to recognize recurring signs, names, titles, and formulae in context.
- **Teachers and Egyptology students** who need transparent sources and learner-controlled, local progress.

## Problem

Beginning learners need a practical path from seeing a hieroglyph to recognizing its value, constructing it, recalling it after delay, and using it in a controlled reading context. Existing material often separates this into specialist references, worksheets, or unstructured sign lists.

Kheper addresses this with a guided loop: discover, construct, retrieve, apply, and review.

## Product promise

Kheper will provide a free, open-source, offline-first iOS and Android course that helps learners read and reproduce foundational Middle Egyptian hieroglyphs through guided sign construction, immediate explainable feedback, adaptive review, and sourced reference material.

The application teaches a **reviewed recommended construction sequence**. It does not claim a single universally correct ancient stroke order or certain reconstructed pronunciation.

## MVP outcome

The MVP is a complete foundational course containing:

- orientation to script, sign functions, reading direction, grouping, and transliteration;
- all 24 uniliteral signs;
- approximately 30 high-instructional-value words;
- approximately 40 short lessons, six mixed reviews, three mastery checks, one final assessment, and at least ten controlled mini-readings;
- eight exercise families, including trace, copy, draw from memory, recognition, typed recall, reading direction, and word building;
- deterministic vector-based drawing evaluation with sign-specific, accessible feedback;
- spaced review, local goals/streaks, an offline sign reference, and local backup/restore;
- English learner-facing content and an architecture prepared for later localization.

## Non-negotiable constraints

- **Offline and private:** The complete learning experience works after installation without runtime network requests, accounts, backend services, cloud sync, telemetry, analytics, advertising, or user-data collection.
- **Local control:** Progress, settings, and handwriting remain on device unless the learner explicitly exports a local backup.
- **Open licensing:** Code uses MPL-2.0; original educational text, schemas, and redistributable visual assets use CC BY-SA 4.0. Commercial use is permitted under these licenses.
- **Scholarly honesty:** Learner-visible claims distinguish language, script, transliteration, pedagogical pronunciation, visual sign form, and construction sequence. Claims, sources, and uncertainty must be reviewable.
- **Source and reuse discipline:** A source's scholarly authority does not by itself permit copying it. Kheper redistributes only original assets or material with an explicit, compatible licence; every learner-visible claim remains traceable to a serious scholarly source.
- **Accessibility:** Core learning supports screen readers, dynamic text, contrast, reduced motion, one-handed use, and a non-drawing alternative for freehand-production activities.

## Educational source and reuse policy

Kheper uses a deliberately narrow, auditable source stack. No source is treated as sufficient for every content field, and no draft is published without the approval gate in this charter.

| Use | Approved source class | Reuse rule |
| --- | --- | --- |
| Sign identity, encoded names, code points, format controls, and interchange metadata | [Unicode / Unikemet](https://www.unicode.org/reports/tr57/) | Package only data files whose release identifies the open `Unicode-3.0` licence; never extract glyph artwork from Unicode charts. |
| Linguistic and historical claims | Peer-reviewed Egyptology, beginning with individual [UCLA Encyclopedia of Egyptology](https://escholarship.org/uc/nelc_uee) articles | Cite the specific article. Reuse text or images only if that individual item displays a compatible licence, such as CC BY. |
| Lexical and authentic-text verification | [Thesaurus Linguae Aegyptiae](https://tla.digital/info/introduction?lang=en) (TLA) | Use as a cited verification source. Do not scrape or import website content or a sub-corpus; import raw data only after recording that release's explicit free licence. |
| Pedagogical construction research | Henry George Fischer, *Ancient Egyptian Calligraphy: A Beginner's Guide to Writing Hieroglyphs* ([Met record](https://libmma.contentdm.oclc.org/digital/collection/p15324coll10/id/42144/)) and other reviewed specialist sources | Reference-only unless the specific item grants reuse. Do not reproduce its text, scans, or drawings; Kheper's canonical vectors and construction sequences are original, reviewed works. |
| Authentic visual context | Individual museum objects explicitly marked public-domain or otherwise compatibly licensed, beginning with [The Met Open Access collection](https://www.metmuseum.org/art/collection/search/562008) | Keep the object URL/number, holding institution, rights statement, title, dating, and provenance. Re-check rights before each release. |
| Kheper learning assets | Original, reviewed Kheper text, vectors, animations, exercises, and accessibility descriptions | Publish under CC BY-SA 4.0 with source and reviewer metadata. |

Before an item can be included in a packaged course, its record must name the source URL or DOI, exact licence or rights statement, source version/access date, claim or asset use, provenance where relevant, reviewer, review date, and approval state. A free-to-read webpage without an explicit reuse permission is reference-only. Copyrighted reference works may inform original explanations but are never copied into the app.

## Explicit MVP exclusions

- arbitrary photograph/inscription translation or camera recognition;
- comprehensive catalogue search from freehand input;
- accounts, social features, public user-generated lessons, leagues, live tutoring, or cloud services;
- hieratic, Demotic, Coptic, Ptolemaic specialist writing, and full grammar instruction;
- generic English-to-hieroglyph conversion;
- French and Arabic learner releases, reminders, placement diagnostics, and teacher/classroom features.

## Success criteria

The MVP is considered viable only when it meets the functional, privacy, accessibility, reliability, drawing, and learning criteria in [product-spec.md](product-spec.md), including:

- complete airplane-mode operation and zero outbound learner-app requests;
- safe local attempt persistence, backup/restore, and content rollback;
- drawing accuracy and latency thresholds across the supported device/input matrix;
- accessibility checks across VoiceOver, TalkBack, switch access, large text, contrast, reduced motion, and non-drawing alternatives;
- delayed recognition, production, reading-direction, and contextual-reading targets from the closed beta study.

## Decision ownership and approval gates

| Decision area | Owner | Required gate before final approval |
| --- | --- | --- |
| Product scope, priorities, and release decision | Repository maintainer | Maintainer ratification |
| Architecture, privacy boundary, dependencies, and release engineering | Repository maintainer | Maintainer review; documented ADR for durable decisions |
| Linguistic claims, transliteration, translations, sign roles, and authentic examples | Repository maintainer during draft preparation | Lead Egyptologist approval before publication |
| Pedagogical sign forms, construction sequences, alternatives, and drawing feedback | Repository maintainer during draft preparation | Calligraphy reviewer approval before publication |
| Lesson sequencing, retrieval design, remediation, and assessment validity | Repository maintainer during draft preparation | Instructional-design review before production freeze |
| Accessibility and device validation | Repository maintainer | Documented accessibility and device-matrix evidence before release |
| Content release, asset licensing, and rollback | Repository maintainer | Release-editor checklist before activation or release |

No draft prepared by an agent is scholarly approved merely because it is committed. The maintainer records approval and any later appointed specialist review in the relevant content and release records.

## Change control

Changes to the product promise, privacy model, licensing, MVP boundary, supported platforms, or scholarly-claim policy require:

1. an explicit `KHEPER-xxx` ticket;
2. an update to this charter and, where applicable, the product specification;
3. an ADR when the decision is durable or difficult to reverse; and
4. maintainer approval before implementation or release.

## Ratification record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer / product sponsor | Ratify this product charter | Pending | — |
| Repository maintainer / engineering lead | Confirm architecture and privacy constraints | Pending | — |
| Future lead Egyptologist | Confirm scholarly approval gate | Pending appointment | — |
| Future calligraphy reviewer | Confirm construction-review gate | Pending appointment | — |
| Future instructional-design reviewer | Confirm assessment-review gate | Pending appointment | — |
