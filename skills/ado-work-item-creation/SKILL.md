---
name: ado-work-item-creation
description: Use to create or update reviewed Azure DevOps work items and approved child tasks from selected local sources, with exact hierarchy mappings, no-write comparison, staged verification, and separate local identity writeback.
---

# ADO Work Item Creation and Update

## Purpose and activation

Publish reviewed work-item content, update stable remote items, or reconcile an explicitly approved hierarchy migration. Preserve identity, immediate parents, native formats, tags, tasks and supporting evidence. This skill does not authorize publication merely because story text or a local file was approved.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), [ado-operations](../ado-operations/SKILL.md), and its [run records](../ado-operations/run-records.md). Read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) if publishing test evidence. Use real approved tool schemas; REST/CLI/SDK must meet the same concurrency and verification contract.

## Inputs, modes and clarification

Require selected reviewed source paths/versions, confirmed org/project/connection and write scope, configured schema/type/hierarchy mappings, intended fields/relations, approved target paths and durable run destination. Resolve team identities, area/iteration and tag policy when used, not via invented defaults.

Choose the relevant mode:

- **Standard create/update:** reviewed content and any actual approved child tasks. A stable remote ID means update that item after scope/type/identity validation, even when renamed, moved or Git-new. No remote ID means a create candidate, not proof that none exists. Check prior manifests, source identity and collision evidence first.
- **Hierarchy reconciliation/migration:** exact current-to-target mappings and preservation baseline; no content rewrite, task section, estimate, screenshot, assignee or retirement operation unless included in this scope. Show collisions, exclusions and no-actions explicitly.

Ask about unknown type mapping, parent, required assignment, scope, conflicts or source authority before approving a write. A project need not adopt a UUID registry; if it has, preserve local `id` separately from positive integer `ado.work_item_id`, with immediate local-parent UUID and UUID-only relationship arrays. Never migrate legacy keys or impose a new schema as an incidental write.

## Workflow

### 1. Resolve sources, metadata and ownership

1. Read selected files before editing; index stable source identities and remote mappings. Detect duplicate local IDs, duplicate remote mappings, missing parents, cycles, invalid types, path collisions and unknown/untracked work. Git status/title/path is not create/update identity.
2. Map every local type explicitly to an exact metadata-supported ADO type. Do not derive types by capitalization, singularization, folder name or a hardcoded five-type list. Record mappings in the manifest, not duplicate canonical frontmatter fields.
3. Resolve the union of required/editable fields for every exact type, process rules/transitions, limits, relation direction/types and exact area/iteration identifiers/full paths before whole-run approval. Use explicit user value, then one authoritative configured default, then a unique exact metadata match consistent with scope. Conflicts or multiple candidates stop; no first result, substring, current-date sprint or local-folder inference.
4. Resolve assignments through PROJECT_CONTEXT's exact-email, scope/provenance and identifier-type policy. UI/API words do not assign frontend/backend roles. Use explicit approved ownership or configured approved defaults; leave unassigned only where permitted. Do not write identity caches automatically.
5. Preserve exact historical tags and configured vocabulary. Show additions/removals as explicit deltas; without vocabulary propose additions for approval. Unknown additions require review, not normalization into a guessed taxonomy.

### 2. Prepare and review material without rewriting it

1. Validate source titles as unambiguous nonempty scalars against discovered target limits. If markup/plain-text preparation is needed, propose the exact prepared title before hashing/approval. Never silently truncate or apply a presumed universal length limit.
2. Review Description and AC for actors, observable outcomes, business rules, access boundaries, validations and errors. Trace technical requirements to an explicitly technical artifact or authoritative public/external contract. Flag internal implementation choices or invented business rules for review; do not silently rewrite approved source or reject a story merely for mentioning an API. Use proportionate story/AC review, not a mandatory unrelated skill chain.
3. For existing items fetch revision, fields, independent rich-text formats, relations and direct children. Preserve native HTML/Markdown per field. A format conversion needs its own approved comparison and supported value/format update; do not regex-strip canonical HTML. For new content select a supported native format deliberately and verify its metadata.
4. When task-enabled, structurally parse only the configured Tasks section or structured task records, excluding fenced examples and unrelated sections. Validate each actual task's stable identity, immediate parent, approved scope, role/ownership and applicable effort. Do not invent FE/BE/QA/review tasks. If existing tasks have no stable mapping, surface exact parent-scoped candidates and obtain a mapping decision; normalized titles may aid discovery but cannot prove identity.
5. Establish one-to-one coverage: each approved local task maps to one intended Task operation and one verified returned Task ID, with missing/unexpected/duplicate/ambiguous mappings explicit. Do not match by role label or operate on all descendants of a parent.
6. Effort rules are process/project-specific. Use confirmed estimates and editable field metadata; do not impose QA percentages, peer-review hours, state names or special Remaining Work exceptions. An omission differs from clearing or zero; record exactly what is sent. Compose [ado-estimate](../ado-estimate/SKILL.md) only if estimation is requested or an actual required value is missing.

### 3. Build the exact no-write manifest

Show one entry per create/update, parent assignment/reparent, dependency/related link, attachment upload/link, optional comment, local identity writeback and timestamp action. Include source path/hash/identity, current and intended remote ID/type, immediate parent, all material fields/formats, area/iteration, assignee identity provenance, tags, approved task mappings, dependencies, baseline revision/protected values, payload hash and verification expectations. Capture exact final directional relation and direct-child sets, not counts alone.

For migrations also include source/target hierarchy, collision classification (exact, rename, scope/type mismatch, ambiguous), child/link preservation, exclusions and prerequisites for any proposed retirement. No automatic deletion, recursive hierarchy deletion or implicit rollback.

Design links/screenshots are handled only when required by this project's publication contract or explicitly requested. If included, establish authorized local evidence/file/hash before dependent writes, then plan upload and attachment relation separately. A Figma URL alone does not authorize downloads or mandate a screenshot. Missing required evidence blocks its dependent actions; do not invent it.

Save the approved manifest immutably in the authorized durable run folder. Approval covers the exact batch across composition; new payload/target/risk requires a new approved version, not repeated identical gates.

### 4. Execute staged boundaries and verify

1. Recheck manifest hash, connection scope, source/local hashes and remote revisions. Serialize shared checkpoint updates. Use supported conditional writes on updates and relation edits; conflict stops the boundary for explicit rebase approval.
2. Create/update verified parents before children according to discovered hierarchy. Persist every response/attempt before dependent operations. Creation can include an approved parent relation atomically when supported; otherwise keep it a separate dependent action with stage-specific expectations.
3. Re-fetch each item's exact identity/project/type, fields/formats, assignments, tags, scope and preservation baseline before allowing dependent work. A stable returned ID, accepted payload, count match or same title does not establish verification.
4. Apply approved hierarchy/dependency/related relation tuples only after both endpoint identities are verified. Resolve UUID-first in an adopted registry; never put numeric remote IDs or relation objects into local UUID arrays. Deduplicate intended pairs, preserve direction and verify exact final sets including unexpected/duplicate edges and direct-child identities.
5. Upload/link approved evidence as distinct operations and verify returned objects/references/content where supported. Missing capability remains blocked/unverified. Unknown create/upload/comment outcomes follow exact scoped run reconciliation in ado-operations; zero matches under incomplete visibility never authorize blind retry.
6. Checkpoint each attempt and material verification. Partial failure stops dependent work; independent boundaries may proceed only within explicit manifest policy. Do not delete/recreate a stable item or remove successes to simulate all-or-nothing behavior.

### 5. Separate canonical identity writeback

Only after verified remote identity is durably checkpointed, apply the approved local writeback to the matching source identity with unchanged baseline hash. Preserve local UUID, immediate parents, unrelated content/frontmatter/schema and file mode. In an adopted nested schema write `ado.work_item_id` and verified in-scope `ado.url` together atomically, then re-read both. Validate duplicate/aliased identity keys; resolve schema ambiguity instead of regex inserting a second mapping. Preserve an existing supported legacy schema unless a migration is separately approved.

A verified ADO create with failed local writeback is partial: resume re-verifies the saved remote ID/material and retries only the approved writeback, never another create. Reverify all terminal actions against current identity/revision/material before marking `skipped_reverified`.

## Expected output and checks

Return no-write audit/approval diff, exact mapping decisions and unresolved questions; after execution, manifest-derived per-operation statuses, IDs/revisions, field/format/relation/child reconciliation, local writeback results, retained paths and remaining decisions. Check expected/actual/missing/unexpected/duplicate identities, protected values, dependency stages, exact task coverage, source hashes and narrative/result consistency. Pending/blocked/uncertain/unverified/inaccessible work prevents a complete-sync claim.

## Examples and limitations

- **Happy path:** A mapped story is renamed locally and adds one approved child task. Update its existing ID, create only the new task, verify the immediate parent and exact child set, then perform separately approved identity writeback.
- **Edge case:** Create times out before a parent link is applied. Reconcile the approved create-stage source identity/material/run evidence, not title alone; recover a unique verified item, then apply the pending parent link. Multiple matches stop. No local ID is written before remote verification.
- **Insufficient input:** A source has an unknown parent or two possible iteration paths. Produce the unresolved audit without publishing; ask for exact mapping/iteration. Do not choose by folder or sprint date.

The skill does not include executable validators, API versions or universal process rules. Discover installed capabilities and current operation documentation before runtime use; manual/static review is not evidence that a write succeeded.
