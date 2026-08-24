# Kheper content-bundle manifest contract

**Contract version:** 1.0.0  
**Related ticket:** `KHEPER-045`

The learner application accepts course bundles only from a learner-selected
local file or from its packaged assets. It never discovers or downloads a
bundle over a network.

## Manifest fields

The typed `ManifestRecord` contains a stable manifest ID; independent manifest,
schema, and curriculum versions; the minimum and optional maximum compatible
app versions; stable record and asset IDs; relative-file SHA-256 checksums;
approval references; staging or production channel; an optional rollback-parent
manifest ID; and an Ed25519 signature envelope with a stable key ID.

Production manifests require approval references. Those references record
approval evidence but do not make draft content approved by themselves. Bundle
assembly and activation must resolve them to approved `ReviewRecord` values.

## Signature payload

The signature covers the UTF-8 bytes returned by
`ManifestRecord.canonicalSigningPayload()`:

- remove the top-level `signature` member;
- sort object keys lexicographically at every nesting level;
- preserve array order because record and asset ordering is authored data;
- encode as compact JSON with no insignificant whitespace.

The only v1 algorithm identifier is `ed25519`. The signature value is standard
base64 encoding of exactly 64 bytes. The key ID uses the stable `key.*` namespace
and is resolved exclusively from trust material packaged with the application.
No public key is accepted from the imported bundle itself.

## Fail-closed activation order

Before activation, the future validator must parse the manifest, reject unknown
fields or unsupported versions, check app compatibility, resolve approvals,
validate safe relative paths, recompute every SHA-256 checksum, verify the
signature against a packaged trusted key, validate all record references, and
only then make the staged bundle active atomically. Failure leaves the current
bundle untouched. Rollback targets must be compatible, previously validated,
and different from the candidate itself.

`ManifestContract.validateStructure()` implements the first structural gate.
`ContentBundleValidator` implements the cross-record, checksum, approval, and
signature gates through a trusted `BundleIntegrityVerifier`; any issue blocks
the bundle. Bundle assembly and atomic activation remain owned by `KHEPER-052`
and `KHEPER-057` respectively. The packaged course loader must supply the
maintained SHA-256/Ed25519 adapter and application-owned trust keys.

## Examples

A structurally valid staging manifest has a supported schema version, at least
one safe checksummed file, a compatible app-version floor, a `key.*` signer ID,
and a base64-encoded 64-byte signature. Staging may have no approvals while work
is under review.

Invalid examples covered by automated tests include a production manifest with
no approvals, a `../` path, a non-SHA-256 digest, malformed base64, and an
unscoped signer ID. Each is rejected before any content can become active. The
zero-filled signature in the structural fixture is deliberately not authentic;
passing structural checks never claims cryptographic or scholarly approval.
