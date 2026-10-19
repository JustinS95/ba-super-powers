# GitHub MVP run records

These are **library-owned semantic templates**, not GitHub API/CLI schemas. Replace angle-bracket entries with verified values or explicit unknowns; never submit this template to GitHub. Read [COMMON](../../references/COMMON.md) and [GITHUB_MUTATIONS](../../references/GITHUB_MUTATIONS.md).

## Resolve storage first

Confirm explicit absolute durable paths for manifest and checkpoints under an approved run folder (or validate configured relative paths/containment). Suggested descriptive names: `github-<purpose>-<run-key>-manifest.md` and `github-<purpose>-<run-key>-attempts.md`; collision means choose a new name, not overwrite. Approved manifests remain immutable; a changed plan gets a new version and approval. Checkpoint updates preserve attempt history, use an available safe atomic replacement/append mechanism and one writer, and stop on recording failure. Retain recovery records; no default cleanup. A chat draft names proposed paths only, never claims writes.

## Immutable manifest

| Record | Required content |
|---|---|
| Run | schema version of this local record; run key; version; resume lineage; approval reference/time; permitted continuation/retry bounds |
| Authority | exact host; non-secret principal/connection; approved read/write scope and documentation/capability evidence |
| Targets | repository owner/name/node ID/visibility; Project owner kind/login/node ID + Project number/node ID/URL/visibility; collection time |
| Inputs | selected canonical paths/source keys/versions/hashes; review provenance; duplicate/collision decisions; optional existing remote mappings |
| Review | exact publication content/metadata/links/marker; public-content decision; no-actions; source/destination risks; Status race acceptance or CAS-required block |
| Storage | exact approved manifest/checkpoint/evidence paths, retention and separately approved optional local writeback paths |
| Integrity | exact payload/template serialization and hash method/value; manifest integrity value/approval binding without a self-referential hash |

One entry per operation:

| Key | Kind/target | Before | Exact intended payload/template | Dependencies/bindings | Verification |
|---|---|---|---|---|---|
| `<source>-issue` | create repository Issue | source hash + no prior mapping/reconciliation evidence | exact title/raw Markdown body, approved marker, optional existing labels; omitted fields listed | none | exact Issue tuple, body/title/labels and repository |
| `<source>-add` | add Issue to selected Project | current membership evidence; protected Issue state/title/body/labels baselines; known automation and permitted initial/relevant Project field values | selected Project ID + verified Issue node ID placeholder | prerequisite `<source>-issue`; exact chosen transport return property, expected Issue type/repository, permitted content-ID slot; protected Issue values may bind only exact approved verified create outputs | exact item ID + Project + Issue identity; protected Issue/Project-value comparison; record discrepancies and stop dependents on unexpected change |
| `<source>-status` | set discovered Status | exact permitted initial option ID or unset, or separately reviewed post-add baseline | selected Project ID, item-ID placeholder, discovered single-select field ID + option ID | prerequisite `<source>-add`; exact transport return property, expected item type/Project/Issue, permitted item-ID slot | narrow re-read, then selected field/option read-back; Issue state unchanged in observed comparison |
| `<source>-local` | optional existing-schema mapping writeback | canonical source hash/schema | exact approved field-level diff with remote-identity placeholders | only verified prior outputs; exact insertion slots | re-read source key, mappings, preserved local identity/content |

Omit unused operations. Existing verified Issue identity can be literal input to add: do not include a create. Status and local writeback are optional, never implied. For a transport documented in the Projects API guide, add uses `addProjectV2ItemById` with `projectId`/`contentId`, and single-select update uses `updateProjectV2ItemFieldValue` with `projectId`/`itemId`/`fieldId` and `value.singleSelectOptionId`. Verify actual integration schemas instead of treating these names as MCP tool signatures. Add and update must be separate calls.

## Mutable attempt/checkpoint history

Record for **each** attempt: operation key, unique attempt key, start/end timestamp, manifest version/integrity, auth/target recheck, sanitized request/hash, status, returned identities, errors, and dependencies blocked. Suggested statuses: planned, in_progress, succeeded_unverified, verified, uncertain, failed, blocked, recovered, skipped_reverified. `in_progress` after interruption needs reconciliation, not automatic replay.

Before dependent calls save each resolved placeholder: prerequisite attempt + verified response property/value/type/scope; insertion slot; resolved payload/hash. Retain original template unchanged. Verification records contain requested/observed material, scope/identity, read timestamp, completeness/pages/errors, missing/unexpected/duplicates and evidence references. Never retain secrets or an unnecessary full repository dump.

## Recovery/final summary

| Operation | Attempt history | Observed outcome/IDs | Verification/completeness | Next approved action or decision |
|---|---|---|---|---|
| `<operation key>` | `<attempt references>` | `<separate Issue/Project/item identities>` | `<verified/partial/uncertain/blocked and evidence>` | `<none/re-read/review; no silent retry>` |

For uncertain create, record approved marker, repository/time/state bounds, pages read, exact material comparison and candidate identities; title is not a key. For uncertain add use Project + Issue identity; for Status use exact item + field/option and report attribution uncertainty. Local writeback failure is a separate outcome, not a failed Issue creation. Report actual retained paths and actions only after writes occur.
