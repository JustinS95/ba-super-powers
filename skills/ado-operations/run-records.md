# Durable run records

Read with [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md). These are library-owned semantic records, **not** an ADO API, tool schema or executable validator. Use the project's compatible record encoding; do not invent a tool to validate it.

This file owns the record dictionary, statuses, integrity invariants, typed binding representation and examples. [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md#no-write-plan-and-approval) owns authorization and immutable approval policy; [ADO Operations](SKILL.md) owns the execution sequence. Record validation does not grant action authority.

## Input manifest

Resolve an authorized collision-safe durable run folder under [COMMON's destination policy](../../references/COMMON.md#destination-and-retention). Conventional names are `input-manifest.json` and `write-results.json`; an optional final report is not a substitute for either. No arbitrary three-file cap applies when recovery evidence needs supporting records. Apply [manifest immutability](../../references/ADO_MUTATIONS.md#no-write-plan-and-approval) and [retention](../../references/ADO_MUTATIONS.md#retention-and-report), including local sync.

Record:

| Level | Required semantics |
|---|---|
| Run | Schema version, root/run ID, exact non-secret org/project/connection identity and scope, extraction completeness, source versions, mappings/policy sources, approved destination/retention, approval reference/time and exact authorized operation set, exclusions |
| Lineage | Manifest content hash, unique attempt ID, known prior resume attempt when resuming, optional parent/boundary lineage; no reuse across different manifests |
| Operation | Unique key, action, source identity/local UUID when adopted, remote ID or planned mapping, exact type and immediate parent identity, boundary, dependencies, baseline revision/local hash, current/intended paths, approved fields/formats/relations and material delta, intended payload/content hash, preservation baseline and verification expectations |
| Scope evidence | Expected integer IDs, direct-child identities and directional relation tuples; missing/unexpected/duplicate arrays; limits, pages and unresolved items |

For example, an adopted registry might use the key `create:<project-id>:<source-uuid>:<immediate-parent-uuid>`; a comment can use `comment:<project-id>:<item-id>:<run-id>:<approved-entry-id>`. Literal placeholders are illustrative, not generated UUIDs. The key must distinguish multiple intended operations on the same item. Allocate any new local UUID once while planning, using an available standard generator, and check uniqueness; retain it on every attempt. A source without UUIDs needs another confirmed stable source identity, not a title-derived fake UUID.

For each field retain presence separately from value: absent is not null, empty string is not absent, and `0` and `false` are populated values. Capture each rich-text field's format independently. Relation expectations are final directional multisets (type + exact target identity), not counts or arbitrary sorting of semantically ordered content. If no relation delta is approved, compare with the captured baseline. Direct children include type, ID and immediate parent; do not count grandchildren.

## Typed binding records

For an [approved late-bound reference](../../references/ADO_MUTATIONS.md#approved-late-bound-references), record the declaration with the immutable input and its resolution with the checkpoint. These are semantic requirements in the project's compatible encoding, not new schema keys:

| Record | Required semantics |
|---|---|
| Declaration | Prerequisite operation key, exact returned property and reference type, expected target/scope, permitted insertion location, approved template/hash and attachment/source set/hashes, dependency map and restricted binding rule |
| Resolution | Verified prerequisite result/evidence, actual returned value and type/scope checks, safe escaping for the insertion context, binding provenance, resolved payload/content and hash persisted before submission |

Validate each resolution against its declaration, including that the rest of the approved template is unchanged. Missing, ambiguous or out-of-scope values block the dependent operation under the linked authorization policy.

Example: an approved child-create template declares insertion of the verified `parent-create` result's remote item ID into its parent-reference location, with exact project/type scope. Checkpoint that parent's create-stage verification and typed ID binding before submitting the resolved child payload. A new destination or wording cannot be substituted through that slot. If parent links are a later approved stage, the binding supplies identity, not proof of the final relation; see the recovery walk-through below.

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
