# Durable run records

Read with [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md). These are library-owned semantic records, **not** an ADO API, tool schema or executable validator. Use the project's compatible record encoding; do not invent a tool to validate it.

## Input manifest

Resolve an authorized collision-safe durable run folder. Conventional names are `input-manifest.json` and `write-results.json`; an optional final report is not a substitute for either. No arbitrary three-file cap applies when recovery evidence needs supporting records. Never overwrite an approved manifest; changes require a new version/run and approval. Keep sanitized baselines through agreed retention, including local sync.

Record:

| Level | Required semantics |
|---|---|
| Run | Schema version, root/run ID, exact non-secret org/project/connection identity and scope, extraction completeness, source versions, mappings/policy sources, approved destination/retention, approval reference/time and exact authorized operation set, exclusions |
| Lineage | Manifest content hash, unique attempt ID, known prior resume attempt when resuming, optional parent/boundary lineage; no reuse across different manifests |
| Operation | Unique key, action, source identity/local UUID when adopted, remote ID or planned mapping, exact type and immediate parent identity, boundary, dependencies, baseline revision/local hash, current/intended paths, approved fields/formats/relations and material delta, intended payload/content hash, preservation baseline and verification expectations |
| Scope evidence | Expected integer IDs, direct-child identities and directional relation tuples; missing/unexpected/duplicate arrays; limits, pages and unresolved items |

For example, an adopted registry might use the key `create:<project-id>:<source-uuid>:<immediate-parent-uuid>`; a comment can use `comment:<project-id>:<item-id>:<run-id>:<approved-entry-id>`. Literal placeholders are illustrative, not generated UUIDs. The key must distinguish multiple intended operations on the same item. Allocate any new local UUID once while planning, using an available standard generator, and check uniqueness; retain it on every attempt. A source without UUIDs needs another confirmed stable source identity, not a title-derived fake UUID.

For each field retain presence separately from value: absent is not null, empty string is not absent, and `0` and `false` are populated values. Capture each rich-text field's format independently. Relation expectations are final directional multisets (type + exact target identity), not counts or arbitrary sorting of semantically ordered content. If no relation delta is approved, compare with the captured baseline. Direct children include type, ID and immediate parent; do not count grandchildren.

## Results and checkpoint integrity

Results retain manifest hash and run/boundary lineage. One operation has one current status plus append-preserved attempt history, rather than losing prior attempts. Each attempt includes timestamp, status/error classification, submitted payload hash, returned ID/revision if any, safe evidence references, actual material and preservation comparison, reconciliation and next permitted action. Atomically persist after each attempt and after verification. A write that succeeds but cannot be verified remains `succeeded_unverified`; do not promote by narrative.

Useful statuses: `planned`, `dry_run`, `in_progress`, `succeeded_unverified`, `verified`, `recovered`, `uncertain`, `failed`, `blocked`, `skipped_reverified`. Document any extra status in the chosen record schema rather than guessing it is supported. An analysis-only `dry_run` means no operational writes, not that an authorized manifest artifact was never saved.

Validate these invariants before first write, at checkpoints, before resume and final reporting:

- Manifest immutable/hash matches; approval covers every exact action and exclusion, scope and destination. Every operation key is unique and every result belongs to that manifest/boundary.
- Source and destination IDs are typed correctly; no duplicate remote mappings or local UUIDs; immediate-parent and dependency graph acyclic.
- Resume points to retained history of the same run/hash/boundary. Latest checkpoint is structurally readable and complete; interrupted atomic writes are not accepted as checkpoints.
- Each intended action has a result, including blocked pending dependents; no extra action can hide outside the approved set.
- Terminal records have evidence for that status. Current identity/revision/hash/material are reverified before skip. Drift is not a reason to regenerate the manifest in place.
- Compare exact expected/actual/missing/unexpected/duplicate IDs, directional relation tuples and direct-child identities, plus approved mutable and captured protected fields. A count match or same title is insufficient.
- Final totals derive from these records and partition the action set without double-counting attempts. Remote create, relation, attachment, comment, local identity writeback and timestamp outcomes remain distinct.

## Minimal recovery walk-through

An approved parent create times out. Mark its attempt uncertain and block its child/link operations. A complete scoped search yields one item matching source operation marker, type, material, parent/run provenance and exclusions. Re-fetch it, verify identity and material, checkpoint recovered ID/revision, then permit children. If the create intentionally omits the parent relation until a later stage, compare the approved create-stage baseline and manifest prerequisite mapping, not an impossible final-parent relation; the final parent remains a separate required verification. Two matching candidates or incomplete search visibility stop recovery. Never execute a child using an unverified guessed parent ID.

If ADO create is verified but local identity writeback fails, retain the remote ID and report partial. Resume re-verifies that ID and source UUID/hash, then retries only the approved writeback. It never creates another item to compensate for a failed local write.
