# Kheper commit certification and signature policy

**Status:** Active for commits created after `KHEPER-035` is merged  
**Backlog ticket:** `KHEPER-035`  
**Owner:** Repository maintainer

## Purpose

Kheper keeps authorship, contribution rights, reviewed history, and release
provenance explicit. This policy distinguishes Developer Certificate of Origin
(DCO) sign-off from cryptographic Git signatures: they serve different
purposes, and one does not replace the other.

## DCO sign-off

Every commit created after this policy becomes active must include a
`Signed-off-by` trailer matching an identity the author is authorized to use.
The trailer certifies the contribution under the Developer Certificate of
Origin 1.1: <https://developercertificate.org/>.

Create it with:

```sh
git commit -s -m "KHEPER-xxx: concise outcome"
```

The author must understand the DCO before signing. Agents and automation must
not invent a human identity, add a sign-off without authorization, or rewrite
older history merely to add trailers. Existing commits made before this policy
remain valid historical records.

When contribution intake eventually opens, every contributor commit will need
its own valid sign-off. A maintainer merge does not certify another author's
unsigned commits.

## Cryptographic signatures

- Cryptographically signed commits are recommended for normal maintainer work.
- Commits that create or approve release artifacts, release tags, signing or
  provenance configuration, dependency-policy exceptions, or security/privacy
  boundary changes must have a verifiable SSH or GPG signature.
- Release tags must be annotated and cryptographically signed.
- Merge commits inherit the requirement when the merged ticket falls into one
  of the mandatory categories above.
- GitHub's verification badge is useful evidence but does not replace review,
  DCO sign-off, checksums, SBOMs, or reproducible-build evidence.

Configure signing through Git and the repository host without placing private
keys in this repository. Never commit private keys, tokens, signing
certificates, provisioning profiles, or recovery material.

## Commit and branch conventions

- Work on `feature/KHEPER-xxx-short-description` branches.
- Put the selected `KHEPER-xxx` key in commit subjects and pull-request titles.
- Keep commits focused on the selected ticket and preserve unrelated user work.
- Use non-destructive history changes. Do not rewrite shared `main` history.
- The maintainer reviews and merges; no branch is pushed or merged implicitly.

## Verification and exceptions

Reviewers check new commits with `git log --show-signature` and inspect
`Signed-off-by` trailers. Continuous enforcement may be added under
`KHEPER-038`; until then, the maintainer records manual verification.

An unsigned commit in a mandatory-signature category or a missing/invalid DCO
trailer blocks merge. Exceptions follow
[`definition-of-ready-and-done.md`](definition-of-ready-and-done.md) and cannot
authorize fabricated identity, secret exposure, unlicensed work, or unverifiable
release provenance.
