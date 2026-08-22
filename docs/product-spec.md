# Kheper — Product specification

> Canonical Markdown version migrated from the original Draft v0.2 specification on 22 August 2026.

A mobile-first course for reading and writing Middle Egyptian hieroglyphs

Status: Draft v0.2

Date: 22 August 2026

Audience: Product, engineering, design, curriculum, and Egyptology reviewers

Delivery scope: Open-source, offline-only iOS and Android MVP with no user-data collection

| PRODUCT DECISION Build an open-source, offline-only Middle Egyptian course for iOS and Android. The application has no accounts, backend, telemetry, advertising, or user-data collection. Its defining interaction is guided sign construction: watch, trace, copy, recall, and use. It teaches a reviewed pedagogical construction sequence, never a falsely universal historical stroke order. |
| --- |

### Executive summary

Kheper applies the short-session progression, immediate feedback, adaptive review, daily goals, and visible learning path associated with modern language-learning apps to Middle Egyptian written in monumental hieroglyphs. It begins with the 24 uniliteral signs, then introduces common words, sign grouping, biliterals, triliterals, determinatives, grammar, and authentic inscriptions.

The MVP is deliberately narrower: foundational orientation, the 24 uniliteral signs, approximately 30 high-frequency words, 40 short lessons, eight exercise families, a vector-based drawing evaluator, spaced review, a sign reference, and device-local progress. The complete course ships with the application and works indefinitely without connectivity. Code, content schemas, and releasable educational assets are published under documented open-source/open-content licenses and reviewed by specialists.

## Document map

| Section | Purpose |
| --- | --- |
| 1 | Product scope, foundational decisions, goals, and exclusions |
| 2 | Learners, jobs, and representative user stories |
| 3 | Learning architecture, mastery model, and progression rules |
| 4 | Curriculum from orientation through authentic inscriptions |
| 5 | Lesson anatomy, exercise catalogue, feedback, and motivation |
| 6 | Drawing engine, authoring format, scoring, and tolerances |
| 7 | User experience, navigation, and core screen requirements |
| 8 | Functional requirements and acceptance conditions |
| 9 | Content model, editorial workflow, and authenticity controls |
| 10 | Open-source, offline-only technical architecture |
| 11 | Local data model, import/export, and storage contracts |
| 12 | Performance, reliability, accessibility, privacy, and localization |
| 13 | Learning evaluation and privacy-preserving validation |
| 14 | Delivery plan, staffing assumptions, and release boundaries |
| 15 | MVP release acceptance checklist |
| Appendices | Example lesson, content record, glossary, and sources |

## 1. Product scope and decisions

### 1.1 Product statement

Kheper is a mobile learning application for beginners who want to read and reproduce Middle Egyptian hieroglyphic writing. It transforms a specialist subject into a progressive sequence of brief lessons while preserving the distinctions among sound signs, logograms, determinatives, phonetic complements, writing direction, and sign arrangement.

### 1.2 Foundational product decisions

| Decision | Specification |
| --- | --- |
| Language stage | Middle Egyptian is the initial linguistic target because it is the classical teaching stage and supports a coherent beginner curriculum. |
| Script | Monumental hieroglyphic writing. Hieratic, Demotic, and Coptic are outside the initial course. |
| Writing claim | Teach a recommended construction sequence reviewed by specialists. Never label it the single historically correct stroke order. |
| First interface | English UI and explanations. Content architecture must support later French and Arabic localization. |
| Platforms | One accessible cross-platform codebase producing native-quality iOS and Android applications, tested on low-end and older supported phones. |
| Connectivity | The complete learner experience works offline after installation. The application makes no runtime network requests and contains no backend dependency. |
| Identity | No accounts, login, device identifier, cloud profile, or cross-device tracking. Progress exists only in application-local storage unless the learner explicitly exports it. |
| Openness | Source code, build instructions, issue tracking, content schemas, and redistributable course assets are public under documented licenses. Reproducible builds and contribution rules are required. |
| Course structure | A linear recommended path with adaptive review and optional reference browsing; no unrestricted content dump. |
| Pedagogy | Recognition, recall, production, and contextual reading are tracked separately. XP cannot substitute for mastery. |

### 1.3 Goals

G1 - Accessible entry. A complete beginner can begin without prior Egyptology, linguistics, or calligraphy knowledge.

G2 - Durable learning. The learner remembers signs after delay, not merely within the lesson that introduced them.

G3 - Productive skill. The learner can construct signs from memory and receive specific, tolerant feedback.

G4 - Authentic reading. Progress leads toward real words, formulae, cartouches, and museum inscriptions rather than modern name transliteration alone.

G5 - Scholarly honesty. Uncertainty, conventional pronunciation, modern sign classification, and pedagogical drawing choices are labeled precisely.

G6 - Sustainable content. Experts can add or correct signs, examples, and lessons through versioned local content packs without changing application code.

G7 - Universal availability. The same free core course is available on supported iOS and Android phones without subscription, account, advertising, or network access.

G8 - Public stewardship. Anyone can audit the source, reproduce builds, report defects, and propose reviewed improvements through an open governance process.

### 1.4 Non-goals for the MVP

Automatic translation of arbitrary photographs or complete inscriptions.

A comprehensive dictionary of every encoded or historically attested sign.

Teaching reconstructed spoken Egyptian as if its pronunciation were certain.

Hieratic, Demotic, Coptic, temple-specific cryptographic writing, or Ptolemaic specialist variants.

Public user-generated lessons, social feeds, competitive leagues, or live tutoring.

A generic English-to-hieroglyph converter that implies letter-for-letter equivalence.

| AUTHENTICITY RULE Every lesson must distinguish language, script, transliteration, pedagogical pronunciation, visual sign form, and drawing sequence. These are related but not interchangeable. |
| --- |

## 2. Learners and use cases

### 2.1 Primary learners

| Learner | Need | Design implication |
| --- | --- | --- |
| Curious beginner | Understand signs without committing to an academic textbook. | Fast first success, plain explanations, strong visual mnemonics, no account or network wall. |
| Serious independent learner | Build a reliable foundation before studying grammar or inscriptions. | Transliteration, Gardiner codes, mastery detail, references, and rigorous review. |
| Museum or travel learner | Recognize recurring signs, names, titles, and formulae in context. | Short authentic examples, reading-direction drills, and later camera-assisted identification. |
| Teacher or Egyptology student | Use structured exercises to supplement formal teaching. | Transparent content sources, learner-controlled local progress export, and no fabricated certainty. |

### 2.2 Jobs to be done

When I see a sign, help me recall its sound value, role, and common meaning.

When I want to reproduce a sign, show me a practical construction sequence and tell me what is structurally wrong without demanding artistic perfection.

When I forget material, bring it back at the right time and mix recognition with production.

When I encounter a short inscription, help me identify direction, grouping, phonetic complements, and determinatives before translating it.

When scholarly certainty is limited, state the convention being used rather than hiding the uncertainty.

### 2.3 Representative user stories

As a new learner, I can complete an orientation lesson and correctly determine the reading direction of a short inscription.

As a learner, I can watch a sign being constructed, trace it, copy it, and later draw it from memory.

As a learner, I can choose whether to display transliteration continuously, only after answering, or only in reference views.

As a returning learner, I can complete a mixed review session containing due signs, words, and reading rules.

As a serious learner, I can open a sign record to inspect its Gardiner code, phonetic value, category, variants, examples, sources, and mastery dimensions.

As an offline learner, I can install the complete course, finish lessons and reviews permanently without connectivity, and export or restore my progress as a local file under my control.

## 3. Learning architecture

### 3.1 Core learning loop

Discover. Introduce one concept or at most three new signs with a visual mnemonic, phonetic value, and contextual example.

Construct. Animate the recommended drawing sequence; progress from tracing to copying without an overlay.

Retrieve. Ask for recognition and production without immediately visible cues.

Apply. Use the sign inside a word, quadrat, direction problem, or short inscription.

Review. Schedule the material according to delayed performance and mix exercise modalities.

### 3.2 Mastery model

Each learnable item maintains four independent mastery components on a 0.00-1.00 scale. The displayed mastery is a weighted summary, but unlocking and review decisions may use the weakest component rather than the average.

| Component | Weight | Evidence |
| --- | --- | --- |
| Recognition (R) | 25% | Identify a sign or concept when shown. |
| Phonetic/semantic recall (P) | 25% | Produce the value, role, or meaning without options. |
| Written production (W) | 30% | Construct the sign with acceptable topology, proportion, and placement. |
| Contextual use (C) | 20% | Read or deploy the item inside a word, group, or inscription. |

| MASTERY FORMULA M = 0.25R + 0.25P + 0.30W + 0.20C. A unit is complete only when M >= 0.80 and no required component is below 0.65. |
| --- |

### 3.3 Review scheduling

Every attempt records correctness, confidence proxy, latency, hint usage, exercise modality, and content version.

The scheduler maintains item difficulty, memory stability, last-reviewed time, due time, and modality weakness.

An incorrect or heavily hinted response returns quickly; a fast unassisted response expands the interval.

Production and contextual use receive independent due dates so repeated multiple-choice success cannot hide weak writing or reading skill.

A standard review session contains 8-15 prompts and prioritizes overdue items, then weak modalities, then controlled interleaving of newer content.

The learner may manually mark a response as harder or easier, but cannot directly set mastery to complete.

### 3.4 Progression rules

| Rule | Behavior |
| --- | --- |
| Lesson length | Target 3-7 minutes and 8-14 scored interactions. |
| New material | At most three new signs or one new grammar mechanism per ordinary lesson. |
| Unit gate | Required lessons complete, unit mastery >= 0.80, and required components >= 0.65. |
| Remediation | If three related failures occur, insert a short explanation and a guided exercise before continuing. |
| Review gate | The path remains usable when reviews are due, but the home screen makes overdue foundational material explicit. |
| Placement | Post-MVP diagnostic may skip recognition lessons; production tasks remain required unless demonstrated. |

## 4. Curriculum specification

### 4.1 Course progression

| Stage | Learning outcome | Release |
| --- | --- | --- |
| 0. Orientation | Distinguish language from script; understand sign functions, transliteration, quadrats, and reading direction. | MVP |
| 1. Uniliterals | Recognize and construct the 24 one-consonant signs; read controlled beginner words. | MVP |
| 2. Building words | Use phonetic complements, common biliterals, and common word spellings. | V1 |
| 3. Determinatives | Interpret semantic classifiers and distinguish words with similar consonantal spelling. | V1 |
| 4. Core grammar | Read basic nominal patterns, gender/number, adjectives, pronouns, possession, and simple clauses. | V1 |
| 5. Formulae and names | Read royal names, titles, dates, and the core structure of offering formulae. | V1 |
| 6. Guided inscriptions | Analyze short, sourced museum inscriptions with controlled scaffolding. | V2 |
| 7. Extended reading | Read longer passages with dictionary and grammar support. | V2 |

### 4.2 MVP curriculum inventory

Orientation: 4 lessons covering scripts and periods, sign functions, reading direction, sign grouping, and transliteration conventions.

Uniliteral path: 6 units of four signs, each with introduction, construction practice, recognition, production, and contextual review.

Consolidation: 6 mixed review lessons, 3 mastery checks, and one final foundational assessment.

Lexicon: Approximately 30 reviewed words selected for high instructional value, not merely modern name writing.

Mini-readings: At least 10 short, sourced or carefully controlled inscription fragments with direction and grouping exercises.

Total: Approximately 40 lessons and 450-600 authored exercise instances generated from reusable templates.

### 4.3 Linguistic and notation policy

| Topic | Required treatment |
| --- | --- |
| Transliteration | Use a documented Egyptological transliteration scheme. Provide a plain-keyboard fallback and explain symbols before assessment. |
| Pronunciation | Audio is an explicit pedagogical convention. Never imply that unrecorded vowels or exact historical sound values are known with certainty. |
| Gardiner codes | Display in reference views and advanced settings; do not require codes for beginner progression. |
| Sign variants | Teach a canonical pedagogical form first, then show attested or font-specific variants without scoring them as separate signs unless necessary. |
| Direction | Teach left-to-right and right-to-left reading early. UI direction and inscription direction must remain independent. |
| Grouping | Teach rectangular sign grouping as a reading and composition skill, not as decoration. |
| Translation | Separate transliteration, normalized Egyptian, literal gloss, and natural English translation where each is available. |

## 5. Lessons, exercises, and motivation

### 5.1 Lesson anatomy

Objective. One sentence stating what the learner will be able to recognize, construct, or read.

Teach. One compact explanation or sign card; no uninterrupted lecture sequence longer than 45 seconds.

Guide. Two or three scaffolded exercises with visible reference or constrained choices.

Retrieve. Two to five exercises without the original cue, mixing modalities.

Apply. One word, quadrat, direction, or inscription problem.

Close. Mastery change, corrected misconceptions, due review count, and the next path node.

### 5.2 Exercise catalogue

| Exercise | Interaction | Primary evidence | Release |
| --- | --- | --- | --- |
| Sign introduction | Inspect animation, value, role, mnemonic, and example. | Exposure only | MVP |
| Trace construction | Follow animated vector segments over a guide. | Production scaffold | MVP |
| Copy construction | Draw beside a static reference without an overlay. | Production | MVP |
| Draw from memory | Construct the requested sign on a blank canvas. | Production recall | MVP |
| Sign recognition | Choose value, role, or sign from plausible distractors. | Recognition | MVP |
| Typed recall | Enter transliteration or select from a symbol keyboard. | Phonetic recall | MVP |
| Reading direction | Choose start point and order for a sign group. | Reading rule | MVP |
| Build a word | Arrange signs into a valid grouped representation. | Contextual use | MVP |
| Transliterate | Convert a sign group into transliteration with staged hints. | Contextual recall | V1 |
| Choose determinative | Complete a word using semantic context. | Semantic role | V1 |
| Gloss and translate | Order glosses or produce a natural translation. | Grammar/context | V1 |
| Inscription lab | Annotate signs, groups, direction, and translation in a real image. | Authentic transfer | V2 |

### 5.3 Feedback rules

State what is correct before identifying the single most useful correction.

For drawing, show an overlay or highlighted region and name the structural issue: missing component, misplaced component, proportion, contour, sequence, or direction.

Never reduce a complex drawing to a red/green verdict without an explanation.

After one failure, allow a retry; after two, reveal a partial guide; after three, replay construction and schedule the item sooner.

Use plausible distractors based on known confusions, never random unrelated signs.

A hint reduces mastery evidence but does not erase completion credit.

### 5.4 Motivation system

| Mechanism | Rule |
| --- | --- |
| Daily goal | Learner chooses a target measured in meaningful exercises or minutes. Default: one short lesson. |
| Streak | Counts days on which the learning goal is met. It is never required to unlock content and is not sold back after failure. |
| XP | Rewards completed learning activity and challenge difficulty; it does not alter mastery. |
| Achievements | Tie to durable outcomes such as delayed recall, first complete word, or first inscription analysis. |
| Path progress | Show completed lessons, mastery gates, and due review separately. |
| Failure | Unlimited practice. No punitive hearts or payment gate after mistakes in the MVP. |
| Competition | No leagues or public ranking in the MVP. Educational effectiveness takes priority over session volume. |

## 6. Sign-construction and drawing engine

### 6.1 Principle

The drawing engine evaluates whether a learner has reproduced the defining structure of the pedagogical sign form. It is not an art grader and must tolerate natural motor variation. Sequence and direction are taught because they make construction learnable; they carry less weight than final structure unless a reviewed sign-specific rule requires otherwise.

### 6.2 Authored sign representation

| Field | Requirement |
| --- | --- |
| Reference outline | One or more normalized vector paths defining the pedagogical target form. |
| Construction segments | Ordered vector segments or segment groups with start/end points, direction, timing, and optional pen lifts. |
| Accepted alternatives | Explicit alternative group orders or directions where the sequence is not materially significant. |
| Structural anchors | Named regions or landmarks used to explain errors and score relative placement. |
| Topology | Required components, connectivity, enclosure, intersection, and containment constraints. |
| Tolerance profile | Per-sign limits for proportion, curvature, rotation, scale, and segment omission. |
| Presentation assets | Mnemonic illustration, construction animation, canonical thumbnail, and reviewed variant thumbnails. |
| Provenance | Source, contributor, reviewer, review date, confidence, and content version. |

### 6.3 Input and scoring pipeline

Capture pointer coordinates, timestamps, pressure when available, pen-up events, canvas size, and input type.

Remove accidental taps, resample at a stable arc-length interval, and apply light smoothing without changing corners.

Normalize translation and scale within bounded limits. Do not freely normalize reflection or orientation.

Match learner segments to accepted construction segments using geometry and topology, not only raster overlap.

Calculate component scores, determine the most useful feedback, and persist both the summary and diagnostic features.

### 6.4 Scoring model

| Dimension | Weight | Examples |
| --- | --- | --- |
| Shape similarity | 40% | Contour distance, curvature, endpoints, local direction. |
| Proportion | 20% | Relative size and aspect ratio of major components. |
| Placement | 15% | Component alignment, spacing, enclosure, and overlap. |
| Topology/completeness | 15% | Required parts, connectivity, crossings, and missing segments. |
| Sequence/direction | 10% | Match to recommended or accepted alternative construction sequence. |

Default interpretation: 85-100 = strong; 70-84 = accepted with feedback; 50-69 = guided retry recommended; below 50 = construction replay and retry. A critical missing component may cap the score regardless of geometric similarity.

### 6.5 Tolerance and interaction requirements

Tracing uses the widest corridor and visible start cues; copy mode removes the corridor; recall mode removes the reference.

Tolerance adapts to device size and input type. Finger input is more tolerant than a stylus; no device class receives a learning penalty.

The ink trail must remain under 50 ms input-to-display at the 95th percentile and visually target 60 frames per second.

Final scoring must return within 150 ms at the 95th percentile on the minimum supported device.

Undo, clear, replay, left-handed controls, reduced motion, and a non-drawing alternative are always available.

The MVP uses deterministic vector and topology scoring. Machine learning may later assist recognition, but cannot replace explainable sign-specific constraints.

## 7. User experience specification

### 7.1 Information architecture

| Destination | Purpose | Required elements |
| --- | --- | --- |
| Learn | Continue the recommended course path. | Current unit, next lesson, mastery gate, due review, packaged-content version. |
| Review | Practice due and weak material. | Due count, estimated duration, modality mix, custom review filters. |
| Signs | Browse the reference collection. | Search, categories, Gardiner code, value, drawing animation, variants, mastery. |
| Read | Apply skills to words and inscriptions. | Direction, grouping, annotation layers, hints, source details. |
| Settings | Inspect goals and device-local preferences. | Daily goal, streak, achievements, mastery summary, accessibility, local backup, reset controls. |

### 7.2 Onboarding

Explain that the first course teaches Middle Egyptian through monumental hieroglyphs.

Demonstrate that figures face toward the beginning of a line and that inscriptions may run in either direction.

Explain that the app teaches a reviewed modern construction sequence, not an attested universal ancient stroke order.

Let the learner choose a daily target, transliteration visibility, audio preference, dominant hand, and reduced-motion setting.

Start immediately with no account or consent dialog because no personal data leaves the device; explain local-only storage and backup controls in plain language.

### 7.3 Lesson player

One task per screen with a persistent progress indicator and a clear exit that preserves completed attempts.

Large central sign or canvas; instructions never compete with the drawing area.

Primary action remains reachable one-handed; drawing controls move according to handedness.

Feedback appears after submission, not while the learner is attempting recall, except in guided trace mode.

Reference, transliteration, and pronunciation can be revealed as hints with recorded cost.

Lesson completion shows learning evidence, not only points: signs strengthened, weakest dimension, and next review.

### 7.4 Sign detail

Canonical pedagogical drawing and construction replay.

Gardiner code, Unicode identifier where applicable, visual category, transliteration, phonetic class, logographic or determinative uses.

Plain-language mnemonic, common confusions, accepted drawing alternatives, and attested visual variants.

Example words with transliteration, gloss, translation, and lesson links.

Four mastery components, next review, and a focused practice action.

Source and review note accessible without overwhelming the beginner view.

### 7.5 Error and empty states

| State | Required behavior |
| --- | --- |
| No network | Continue the complete learning experience without warning, degraded mode, queued upload, or blocked feature. |
| Local content import fails | Keep the packaged or previous valid bundle, explain the invalid file, and never partially activate an imported bundle. |
| Drawing cannot be scored | Preserve the attempt, allow retry, and offer reference comparison or a non-drawing alternative. |
| No reviews due | Offer optional mixed practice, reading practice, or continuation of the course path. |
| Backup restore conflict | Preview the local backup date and content version; require an explicit replace or merge decision and retain a rollback copy. |
| Unsupported glyph rendering | Use bundled vector assets; never depend on the operating system having an Egyptian hieroglyph font. |

## 8. Functional requirements

Priority definitions: P0 is release-blocking for the MVP; P1 is expected for the first substantial release after MVP; P2 is deferred. Each requirement is independently testable.

### 8.1 Course and lesson requirements

| ID | Requirement | Pri. | Acceptance condition |
| --- | --- | --- | --- |
| FR-LRN-01 | Display a recommended path of stages, units, lessons, reviews, and mastery gates. | P0 | A learner can complete the full MVP path and see consistent unlock state after restart, without creating an account. |
| FR-LRN-02 | Run lessons from versioned content rather than hard-coded screens. | P0 | A new valid lesson bundle loads without a client release. |
| FR-LRN-03 | Support teaching, recognition, typed recall, drawing, direction, and grouping prompts. | P0 | Every MVP exercise schema renders, scores, retries, and records an attempt. |
| FR-LRN-04 | Preserve partial lesson progress on exit or interruption. | P0 | Reopening returns to the next unanswered exercise without duplicating completed attempts. |
| FR-LRN-05 | Calculate mastery by dimension and enforce prerequisite gates. | P0 | Unlock decisions match the documented thresholds for a fixed attempt fixture. |
| FR-LRN-06 | Offer optional placement for experienced learners. | P1 | Diagnostic results skip only demonstrated recognition content and preserve required production checks. |

### 8.2 Drawing requirements

| ID | Requirement | Pri. | Acceptance condition |
| --- | --- | --- | --- |
| FR-DRW-01 | Animate authored construction segments with pause, replay, and speed controls. | P0 | All 24 MVP signs replay deterministically at three speeds. |
| FR-DRW-02 | Capture finger and stylus input with timestamps and pen-up boundaries. | P0 | Recorded attempts reproduce the visible path within one display pixel after normalization. |
| FR-DRW-03 | Score shape, proportion, placement, topology, and recommended sequence. | P0 | Approved expert and novice fixtures meet agreed false-reject and false-accept limits. |
| FR-DRW-04 | Return localized, sign-specific corrective feedback. | P0 | Every failing MVP fixture maps to a reviewed feedback message and visible region when applicable. |
| FR-DRW-05 | Support accepted alternative sequences per sign. | P0 | All authored alternatives receive no sequence penalty. |
| FR-DRW-06 | Provide undo, clear, replay, handedness, reduced motion, and non-drawing fallback. | P0 | Controls remain operable with touch, keyboard/switch access where supported, and screen reader labels. |
| FR-DRW-07 | Recognize a freely drawn sign across the catalogue. | P2 | Top-five result meets the separately approved recognition benchmark. |

### 8.3 Review and motivation requirements

| ID | Requirement | Pri. | Acceptance condition |
| --- | --- | --- | --- |
| FR-REV-01 | Generate a due queue from item stability, difficulty, weakness, and last review. | P0 | A deterministic clock and attempt fixture produces the expected queue and order. |
| FR-REV-02 | Interleave modalities so recognition cannot substitute for production. | P0 | Weak production schedules drawing even when recognition is strong. |
| FR-REV-03 | Allow focused review by unit, sign category, error type, or modality. | P1 | Selected filters constrain the generated queue without altering historical mastery. |
| FR-MOT-01 | Track a configurable daily learning goal and streak locally. | P0 | Timezone changes and offline completion reconcile without duplicate days and without a network clock. |
| FR-MOT-02 | Award XP and achievements independently from mastery. | P0 | Changing XP cannot unlock a mastery-gated unit. |
| FR-MOT-03 | Offer optional reminders scheduled entirely on the device, with explicit permission and quiet-hour controls. | P1 | No reminder is scheduled before permission; reminders require no push token or server and can be disabled centrally. |

### 8.4 Reference, openness, privacy, and content requirements

| ID | Requirement | Pri. | Acceptance condition |
| --- | --- | --- | --- |
| FR-REF-01 | Browse and search unlocked sign records by label, value, category, and Gardiner code. | P0 | Search results remain available offline for the packaged catalogue. |
| FR-REF-02 | Show drawing replay, variants, examples, mastery, and sources on sign detail. | P0 | Every MVP sign passes the content completeness validator. |
| FR-PRV-01 | Operate without accounts, identifiers, telemetry, analytics SDKs, advertising SDKs, or network permissions where the platform permits. | P0 | A release build generates zero outbound requests during a full automated course run and contains no tracking dependency. |
| FR-LOC-01 | Export and restore progress through a documented local file format. | P0 | A backup round-trip reproduces attempts, mastery, settings, goals, and streak state without contacting a service. |
| FR-OSS-01 | Publish source, build instructions, dependency lockfiles, licenses, and contribution policy in a public repository. | P0 | A clean documented environment produces installable Android and iOS artifacts from the tagged source release. |
| FR-CNT-01 | Ship the full MVP course in the application and optionally import signed local content bundles. | P0 | First installation needs no content download; an invalid imported bundle retains the previous active bundle. |
| FR-CNT-02 | Provide an authoring preview and review workflow. | P0 | Unapproved content cannot enter a production bundle. |
| FR-CNT-03 | Annotate photographs and real inscriptions. | P2 | Annotations remain aligned across supported screen sizes and image zoom. |
| FR-DEV-01 | Support the documented iOS and Android device matrix from one codebase. | P0 | All P0 flows pass on the minimum OS versions, smallest supported screen, and low-memory reference devices. |

## 9. Content system and governance

### 9.1 Editorial roles

| Role | Authority |
| --- | --- |
| Lead Egyptologist | Approves linguistic claims, transliteration, translations, chronology, sign roles, variants, and source use. |
| Calligraphy reviewer | Approves pedagogical sign forms, construction segments, accepted alternatives, anchors, and feedback language. |
| Instructional designer | Defines sequencing, cognitive load, retrieval pattern, distractors, remediation, and assessment validity. |
| Content author | Creates sign records, explanations, words, exercises, mnemonics, and lesson assemblies. |
| Content QA | Validates schemas, links, rendering, answer keys, localization, accessibility text, and device presentation. |
| Release editor | Freezes the manifest, records approvals, signs the bundle, and manages rollback. |

### 9.2 Content lifecycle

Author or revise content in structured records with stable IDs and explicit sources.

Run automated schema, reference, glyph, stroke-path, answer-key, and localization checks.

Preview the lesson and drawing behavior on representative phone and tablet canvases.

Obtain linguistic and calligraphic approval; unresolved disputes remain unpublished and documented.

Assemble a versioned bundle, run regression lessons, sign the manifest, and publish to the staging channel.

Promote to production after beta validation; retain the prior bundle for immediate rollback.

### 9.3 Required sign record

| Group | Fields |
| --- | --- |
| Identity | Stable internal ID, Gardiner code when applicable, Unicode code point when applicable, category, status. |
| Language | Primary transliteration, alternate transliterations, sign functions, phonetic class, meanings, determinative domains. |
| Presentation | Beginner label, description, mnemonic, canonical vector, thumbnails, variants, orientation behavior. |
| Construction | Segments, accepted alternatives, anchors, topology, tolerances, feedback mappings, difficulty. |
| Examples | Reviewed lexemes and inscriptions with transliteration, gloss, translation, source, period, and provenance. |
| Governance | Author, specialist reviewers, source references, confidence, review date, changelog, content version. |
| Accessibility | Screen-reader description, text alternative, reduced-motion construction description, non-drawing prompt. |

### 9.4 Automated validation

Stable IDs and Gardiner codes are unique within the active catalogue.

Unicode values are valid scalar values and match the reviewed identifier where one exists.

Every stroke segment has bounded coordinates, a nonzero path, a declared group, and at least one accepted sequence.

Every scored prompt has exactly one valid answer set or an explicit multi-answer policy.

Every distractor is a valid content reference and cannot accidentally satisfy the prompt.

Every published linguistic claim and authentic example has at least one source and specialist approval.

Every learner-visible string has a localization key and accessibility alternative when visual-only.

A content bundle activates only when its manifest, schema version, checksums, and signature validate.

### 9.5 Open-source governance and licensing

Publish application and authoring-tool source under MPL-2.0; publish original educational text, schemas, and redistributable visual assets under CC BY-SA 4.0.

Keep third-party works in a machine-readable attribution inventory; exclude any asset whose license does not permit redistribution in the application.

Require signed commits or a developer certificate of origin, automated tests, specialist review for scholarly changes, and two-person approval for release branches.

Maintain a public roadmap, issue tracker, contribution guide, code of conduct, security-reporting route, content-style guide, and documented decision records.

Produce source archives, checksums, software bills of materials, dependency-license reports, and reproducible build instructions for every tagged release.

| SOURCE BASELINE Use Fischer's step-by-step calligraphy guide as a starting reference for pedagogical construction, Unicode/Unikemet for encoded identity and format controls, and specialist-reviewed teaching sources for linguistic sequencing. No single source is sufficient for every content field. |
| --- |

## 10. Reference technical architecture

### 10.1 Recommended implementation

| REFERENCE STACK Flutter/Dart mobile client; custom vector canvas; SQLite local database; packaged, signed course bundles; local backup/import services; and a browser-based open-source authoring console. The learner application has no backend, authentication, telemetry, advertising, or runtime networking layer. Equivalent technology is acceptable only if it preserves these privacy, accessibility, portability, and performance contracts. |
| --- |

| Layer | Components | Responsibility |
| --- | --- | --- |
| Mobile client | Lesson engine, vector renderer, scorer, review scheduler, local repository, backup/import service, accessibility layer. | Execute the complete course offline and maintain all learner state locally. |
| Packaged content | Immutable course bundles, bundled assets, schema validation, signature verification, rollback copy. | Make first launch and the full MVP independent of connectivity or service availability. |
| Local storage | SQLite records, immutable attempt log, preferences, mastery projections, backup serializer. | Keep learner information inside the application sandbox and under learner control. |
| Authoring | Structured editor, vector/stroke editor, lesson preview, validation, review states, bundle builder. | Let specialists create and approve content safely. |
| Release engineering | Public repository, locked dependencies, automated tests, reproducible build scripts, license and attribution generation. | Allow independent audit, community contribution, and verifiable releases for both platforms. |

### 10.2 Mobile modules

| Module | Contract |
| --- | --- |
| Content repository | Resolve active bundle, expose typed records, retain previous valid version, and migrate local references. |
| Lesson runtime | Render exercise schemas, manage attempts and hints, apply branching remediation, and preserve session state. |
| Drawing runtime | Render construction animation, capture input, score locally, and produce explainable diagnostics. |
| Mastery engine | Update local mastery projections after each attempt using deterministic versioned rules. |
| Review scheduler | Generate due queues offline from mastery state and scheduler parameters. |
| Backup service | Export and restore a versioned local progress archive chosen explicitly by the learner. |
| Privacy boundary | Expose no network client to learner features; block tracking dependencies and verify zero outbound traffic in release tests. |

### 10.3 Offline-only state lifecycle

Assign every attempt a device-local UUID and persist it before showing completion.

Update local mastery and streak projections transactionally with the attempt.

Store attempts immutably in the application sandbox; no attempt, drawing path, preference, or device identifier is transmitted.

Create an encrypted or integrity-protected backup only after an explicit export action to a learner-chosen file destination.

Before restore, validate schema and content versions, show the backup date and scope, and preserve a rollback snapshot.

A complete local reset deletes all learner state without requiring authentication, confirmation from a service, or a network connection.

Content-version references remain attached to attempts so revised answer keys or stroke profiles can be audited.

### 10.4 Content delivery

Ship the complete MVP course in the application package so installation is the only prerequisite for learning.

Bundle structured JSON or a compact binary representation with vector assets, audio, thumbnails, and checksums.

Allow optional content packs to be imported from a learner-selected local file; the app itself does not fetch them.

Verify an imported manifest and signature in a staging location, then switch the active bundle atomically.

Keep at least one prior compatible bundle for rollback and failed-import recovery.

Separate content schema version, curriculum version, scoring algorithm version, and app version.

Use bundled vector assets for signs and grouping; operating-system fonts are optional display fallbacks only.

## 11. Local data and file contracts

### 11.1 Core entities

| Entity | Selected fields |
| --- | --- |
| Local profile | local profile UUID, locale, timezone, handedness, accessibility settings, created_at; never transmitted |
| Course/Unit/Lesson | stable IDs, prerequisites, order, objectives, exercise references, content version |
| Glyph | identity, language data, presentation assets, construction profile, variants, provenance |
| Lexeme/Reading | sign groups, transliteration, gloss, translation, grammar tags, source, period |
| Exercise | schema type, prompt payload, answer policy, hints, remediation, mastery mappings |
| Attempt | UUID, profile, item, exercise, response summary, score, latency, hints, timestamp, versions |
| Mastery state | item, R/P/W/C values, stability, difficulty, last review, due time, algorithm version |
| Goal/Streak | daily target, local date, completion evidence, timezone, reconciled state |
| Content release | manifest ID, schema, curriculum, checksums, signature, channel, approvals, rollback parent |

### 11.2 Local interface surface

| Interface | Purpose | Privacy contract |
| --- | --- | --- |
| Packaged course loader | Open the course bundle shipped with the application. | Reads application resources only. |
| Local content import | Validate and activate a learner-selected signed content pack. | Reads only the selected file; performs no lookup or callback. |
| Progress export | Write a portable versioned backup to a learner-selected destination. | Exports only documented learning state after an explicit action. |
| Progress restore | Validate and restore a selected local backup with preview and rollback. | Reads only the selected file and never uploads it. |
| Reset local data | Delete attempts, mastery, preferences, and backups held inside the app sandbox. | Completes entirely on device. |
| Licenses and source | Display license texts, dependency notices, source revision, and repository reference. | Uses metadata embedded at build time. |

### 11.3 Attempt contract

An attempt is the irreducible local learning event. It is immutable after creation. Corrections create a new local administrative event or content release; they do not silently rewrite learner history.

| Field | Rule |
| --- | --- |
| attempt_id | Device-generated UUID; unique within a local profile and stable across local retries and backups. |
| occurred_at / local_date | Device timestamp plus learner-local date and timezone offset for local streak calculation. |
| content versions | Bundle, exercise, construction-profile, and scoring-algorithm versions. |
| response | Answer representation and raw drawing points retained only in the application sandbox or an explicit learner-created backup. |
| score | Overall and component scores, correctness, accepted alternative, hints, latency, and feedback code. |
| mastery effects | Dimensions evidenced and local before/after projection; restore may recompute using the recorded algorithm version. |

## 12. Non-functional requirements

### 12.1 Performance and reliability

| ID | Requirement |
| --- | --- |
| NFR-PERF-01 | Drawing targets 60 fps with input-to-ink latency below 50 ms at p95 on the minimum supported device. |
| NFR-PERF-02 | Local drawing score returns below 150 ms at p95 after pen-up. |
| NFR-PERF-03 | A cached lesson opens below 300 ms at p95; cold application start targets below 2.5 seconds. |
| NFR-OFF-01 | The complete packaged course, reviews, references, scoring, progress, backup, and restore work without network. |
| NFR-REL-01 | Attempt creation and local mastery update are one transaction; forced termination cannot lose a submitted attempt. |
| NFR-REL-02 | Content activation is atomic and rollback-safe; corrupt or incompatible bundles never replace the active bundle. |
| NFR-REL-03 | Backup export and restore are versioned, integrity-checked, interruption-safe, and rollback-capable. |
| NFR-PRV-01 | A release build contains no analytics, crash-reporting, advertising, authentication, or tracking SDK and makes zero outbound requests during automated network inspection. |
| NFR-DEV-01 | Target iOS 15 or later and Android 8/API 26 or later, including 2 GB RAM Android reference hardware and screens from 320 logical pixels wide. |

### 12.2 Accessibility

Target WCAG 2.2 AA principles where applicable to native mobile interfaces.

Provide screen-reader names, roles, states, instructions, and text descriptions for every sign and exercise.

Provide an equivalent non-drawing exercise when motor, vision, or input limitations make freehand production inaccessible.

Support dynamic text, high contrast, color-independent feedback, reduced motion, and large touch targets of at least 44 by 44 logical points.

Allow handedness control and keep critical actions outside the active drawing path.

Construction animations include a step-by-step textual description and manual advance.

Do not place essential linguistic information only inside a glyph image or color encoding.

Pass core flows with VoiceOver and TalkBack, switch access, 200% text scaling, reduced motion, bold text, high contrast, and one-handed use on the minimum device matrix.

### 12.3 Privacy and security

Collect, transmit, or remotely process no learner, device, usage, handwriting, crash, advertising, location, contact, or identifier data.

Include no account system, login, remote configuration, push token registration, telemetry endpoint, advertising identifier access, or third-party analytics SDK.

Keep progress, settings, and raw handwriting trajectories inside the application sandbox unless the learner explicitly exports a local backup file.

Request only permissions necessary for an explicit learner action, such as opening a backup file or choosing an export destination; the core course requires none.

Provide one local reset action that deletes all learner state and completes without a network connection.

Document the zero-collection architecture in the privacy notice and verify it with dependency inspection and automated packet-capture tests for every release.

Treat user-submitted issue reports, attachments, or research data as external voluntary contributions governed outside the production application.

### 12.4 Localization and rendering

Externalize every learner-visible string and support variable-length translations without fixed text containers.

Keep application interface direction, inscription reading direction, and glyph orientation as separate state.

Support English first; design and test for French and Arabic, including right-to-left UI and mixed-script content.

Bundle sign vectors and grouping metadata so rendering does not depend on operating-system Unicode font coverage.

Preserve Gardiner codes, transliteration symbols, and Unicode identifiers losslessly in search, storage, export, and copy.

## 13. Learning evaluation and privacy-preserving validation

### 13.1 Educational success criteria

| Criterion | MVP beta target |
| --- | --- |
| Delayed recognition | At least 80% of beta learners identify 20 of 24 uniliterals 24 hours after completing the path. |
| Delayed production | At least 70% produce an accepted form for 18 of 24 uniliterals seven days later without a visible guide. |
| Direction | At least 90% correctly determine reading direction in the controlled final assessment. |
| Contextual reading | At least 75% correctly transliterate or analyze four of five controlled words or groups using learned signs. |
| False rejection | Fewer than 5% of specialist-approved, naturally varied drawings are rejected by the MVP scorer. |
| False acceptance | Fewer than 10% of structurally wrong test drawings are accepted; critical missing components are never accepted. |
| Content quality | 100% of published linguistic records and authentic examples have required specialist approval and source references. |

### 13.2 Local diagnostics and public quality evidence

The production application emits no analytics or diagnostic events. Product quality is established through automated tests, public issue reports, specialist fixtures, and separately recruited studies rather than passive observation of learners.

| Evidence source | Privacy boundary |
| --- | --- |
| Automated fixtures | Synthetic attempts and reviewed drawing samples run in continuous integration; no production-user data is used. |
| Device test matrix | Maintainers execute scripted accessibility, performance, offline, and rendering tests on owned or hosted test devices. |
| Public issue reports | A learner may leave the app and submit only the information they choose through the public project tracker. |
| Local debug export | A developer build can create a readable local diagnostic file only after an explicit action; it is never transmitted automatically. |
| Recruited research study | Consent, collection, retention, and withdrawal are handled by a separate study build and protocol, never by the public production app. |
| Store diagnostics | Platform-provided aggregate store data is reviewed outside the app and is not combined with an in-app identifier or learner history. |

### 13.3 Validation studies

Expert calibration: two independent Egyptology/calligraphy reviewers approve every MVP sign form, sequence policy, and scoring fixture.

Usability study: 8-12 beginners complete orientation, one sign lesson, a delayed recall task, and a sign lookup.

Drawing benchmark: collect consented examples across finger/stylus, dominant hand, phone/tablet, and natural drawing styles.

Closed alpha: validate offline continuity, local backup/restore, zero outbound traffic, content rollback, and accessibility with representative iOS and Android devices.

Beta learning study: measure the delayed criteria above; revise content or scheduler rules before broad release.

## 14. Delivery plan

### 14.1 Planning assumptions

The schedule assumes two full-time application engineers, one half-time product designer, one half-time content/illustration producer, one quarter-time Egyptologist, part-time instructional design, and dedicated QA during alpha and beta. Content review and drawing calibration are on the critical path.

### 14.2 Phases

| Phase | Duration | Deliverables | Exit condition |
| --- | --- | --- | --- |
| 0. Canon and prototype | 2 weeks | Content policy, sign schema, five approved sign prototypes, interaction prototype. | Specialists approve the claims and drawing model. |
| 1. Vertical slice | 4 weeks | One complete unit, local lesson runtime, trace/copy/recall, mastery, review, basic sign detail. | A beginner completes the unit fully offline. |
| 2. MVP production | 6 weeks | All P0 application features, authoring workflow, 24 signs, path, local backup, goals, and reference. | Feature-complete build and content-complete candidate. |
| 3. Calibration and alpha | 3 weeks | Drawing fixtures, specialist review, accessibility pass, device matrix, backup/restore and rollback tests. | No release-blocking content, privacy, accessibility, or scoring defect. |
| 4. Closed beta | 3 weeks | Beginner study, delayed assessment, defect correction, store assets, open-source release artifacts, and privacy verification. | MVP release criteria and learning thresholds met or explicitly revised. |

### 14.3 Release boundaries

| MVP | V1 | V2 |
| --- | --- | --- |
| Orientation; 24 uniliterals; ~30 words; ~40 lessons; eight exercise families; deterministic drawing feedback; review; goals/streak; complete offline operation; no account or telemetry; local backup; sign reference; English; public source. | Common biliterals and triliterals; determinatives; core grammar; 80-120 signs; richer readings; placement; focused review; French/Arabic; teacher progress export. | 200+ signs; authentic inscription lab; camera-assisted sign identification; advanced grammar and formulae; classroom management; specialist modules. |

### 14.4 Principal risks

| Risk | Mitigation |
| --- | --- |
| False certainty about stroke order | Use 'recommended construction sequence,' support alternatives, publish source and reviewer, and test all wording. |
| Content production dominates engineering | Prototype five signs first, measure authoring time, build reusable validators and templates, and narrow the MVP before lowering review quality. |
| Drawing scorer frustrates natural writers | Weight topology and structure, calibrate on varied human samples, show explainable feedback, and provide easy override/retry paths. |
| System-font glyph failures | Bundle canonical vectors and test mixed-script rendering; Unicode is identity/interchange, not the sole presentation asset. |
| Gamification displaces learning | Separate XP from mastery, measure delayed recall, avoid punitive lives, and reject experiments that increase activity while weakening retention. |
| Oversized curriculum | Ship the uniliteral foundation as a complete useful product and require content-complete gates before adding grammar breadth. |
| Specialist disagreement | Record confidence and variant policies, require documented resolution, and permit multiple approved representations where justified. |

## 15. MVP release acceptance

The MVP is releasable only when every item below is satisfied or explicitly removed from scope before candidate freeze.

All P0 functional requirements pass automated or documented manual acceptance tests.

Orientation, 24 uniliterals, all MVP words, all lessons, and all assessment items have linguistic and calligraphic approval.

Every MVP sign has a canonical vector, construction sequence, accepted alternatives, anchors, tolerance profile, feedback mapping, accessibility text, source, and reviewer.

The complete course, review queue, sign reference, drawing score, and local progress work in airplane mode immediately after installation.

Forced termination during answer submission, lesson completion, local content activation, and backup or restore causes no attempt or progress loss.

A local backup round-trip preserves all attempts, mastery, settings, goals, and streak evidence without contacting a service.

Drawing benchmark meets the approved false-reject, false-accept, latency, and critical-topology thresholds across the device/input matrix.

Screen-reader, dynamic text, contrast, reduced-motion, handedness, touch-target, and non-drawing alternative checks pass.

Content rollback, schema incompatibility, invalid signature, failed local import, and interrupted activation scenarios pass.

Privacy disclosures match actual behavior; zero collection, zero outbound traffic, local export, and complete local reset are verified.

The delayed beta assessment meets the educational targets or a documented specialist decision revises the target before release.

No learner-facing text claims a universally correct ancient stroke order or certain reconstructed pronunciation.

## Appendix A. Example MVP lesson

### Lesson: Three signs in one word

| Attribute | Definition |
| --- | --- |
| Unit | Uniliterals 2 |
| Duration | Approximately 5 minutes |
| New signs | G17 (owl, m), D21 (mouth, r), N35 (water ripple, n) - subject to final specialist notation policy |
| Prior knowledge | Orientation, first four uniliterals, reading direction |
| Objective | Recognize and construct the three signs, then identify their values in a controlled sign group. |
| Mastery evidence | Recognition, phonetic recall, written production, contextual use |

#### Exercise sequence

Inspect G17: visual mnemonic, m value, sign category, construction animation, and a short usage note.

Trace G17 with visible start cues and a broad tolerance corridor.

Repeat for D21 and N35, limiting uninterrupted explanation.

Choose the sign corresponding to m from three visually or pedagogically plausible options.

Copy D21 beside a static model; receive proportion or completeness feedback if needed.

Draw N35 from memory; replay only after submission or as a recorded hint.

Select the correct reading direction for a controlled group containing the learned signs.

Match each sign to m, r, or n without the mnemonic.

Complete a controlled word/group exercise using the three signs and one previously learned sign.

Close with mastery changes and schedule weak modalities for review.

#### Branching remediation

If G17 and another bird sign are confused, display a side-by-side structural distinction and retry with no additional new sign.

If N35 is drawn with the wrong number or relationship of waves according to the approved pedagogical form, highlight the missing/excess structural region.

If direction is wrong, animate the facing cue and ask the learner to mark the starting edge before rereading the group.

If typed transliteration fails because the special keyboard is unclear, show the input mapping and score the concept separately from input mechanics.

## Appendix B. Example glyph content record

Illustrative schema only; values and terminology require specialist approval before publication.

| Path | Example value |
| --- | --- |
| id | glyph.g17 |
| gardiner_code | G17 |
| unicode | U+13153 |
| label.en | Owl |
| transliteration.primary | m |
| functions | phonogram: uniliteral |
| presentation.canonical_asset | vectors/g17/v3.svg |
| construction.profile | construction/g17/v2.json |
| construction.accepted_sequences | primary plus reviewed alternatives |
| scoring.weights | shape 0.40; proportion 0.20; placement 0.15; topology 0.15; sequence 0.10 |
| examples | Stable references to reviewed lexeme and reading records |
| sources | Stable references to bibliography/source records |
| review | linguistic reviewer; calligraphy reviewer; date; status; confidence |
| version | 3.0.0 |

## Appendix C. Glossary

| Term | Meaning in this specification |
| --- | --- |
| Uniliteral | A sign used to represent one consonantal value. |
| Biliteral / triliteral | A sign used to represent a sequence of two or three consonants. |
| Determinative | A normally unpronounced sign that helps classify or disambiguate a word semantically. |
| Phonetic complement | A sign that repeats part of another sign's phonetic value to clarify reading. |
| Quadrat | A visually balanced rectangular grouping of signs. |
| Gardiner code | A modern catalogue identifier from Gardiner's sign-list convention, used as a reference key. |
| Transliteration | A scholarly representation of Egyptian consonantal writing using Latin-based symbols. |
| Construction sequence | The app's reviewed pedagogical order for drawing a sign; not asserted as universal ancient practice. |
| Mastery dimension | One independently measured ability: recognition, recall, production, or contextual use. |
| Content bundle | A signed, versioned, atomically activated set of lessons, records, and media. |

## Appendix D. Reference sources

These sources establish the initial product constraints and content pipeline. Published lessons still require item-level scholarly sourcing and specialist review.

S1 Ancient Egyptian Calligraphy: A Beginner's Guide to Writing Hieroglyphs. The Metropolitan Museum of Art. Step-by-step guidance for drawing a selected set of signs; baseline for reviewed pedagogical construction. Open S1 source

S2 Cuneiform and Hieroglyphs, Unicode Standard, Chapter 11. Unicode Consortium. Encoded sign identity, directionality, rendering, and hieroglyph format-control context. Open S2 source

S3 Unicode Egyptian Hieroglyph Database (Unikemet). Unicode Consortium. Structured metadata and organization for encoded Egyptian hieroglyphs. Open S3 source

S4 Learn Hieroglyphs. Bibliotheca Alexandrina. Beginner progression across uniliterals, biliterals, triliterals, arrangement, direction, determinatives, and grammar. Open S4 source

S5 Fabricius. Google Arts & Culture and project partners. Existing interactive work on learning, drawing, recognizing, and analyzing hieroglyphs; useful competitor and interaction reference. Open S5 source
