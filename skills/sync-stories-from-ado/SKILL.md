---
name: sync-stories-from-ado
description: Use to reconcile a selected canonical local story store with Azure DevOps using stable identities, complete scoped reads, two-sided baselines, three-way conflict review, and approved resumable local changes.
---

# Sync Stories from ADO

## Purpose and activation

Bring approved remote changes into the project's existing local store without overwriting local work, changing identity or treating query absence as deletion. Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), [ado-operations](../ado-operations/SKILL.md), and [merge and recovery](merge-and-recovery.md). This skill reads ADO and mutates local files only; remote changes require separately scoped approval.

## Inputs and clarification

Require confirmed org/project/connection and read authorization, exact area/iteration/ID/query bounds and hierarchy depth, selected canonical local root/schema, configured field ownership/type/hierarchy/path mappings, last agreed two-sided baseline (remote revisions/material and local hashes/material), and approved durable run destination/retention. Resolve actual configuration selected by the user; compatibility filenames such as `team.yaml` are optional, not permission to create them.

Ask if canonical root, schema, authority for conflicting fields, scope or baseline is unknown. Missing registry does not block other ADO skills, but this sync needs an explicitly selected store. No baseline means bootstrap comparison/review, not “remote wins.” A complete remote read is still not authorization to overwrite local changes.

## Workflow

### 1. Read scope and build both indexes

1. Obtain a source snapshot through [fetch-ado-work-items](../fetch-ado-work-items/SKILL.md) under the exact approved bounds. Include configured types, immediate parents/direct children, native Description/AC formats, tags, assignments and relevant estimates/relations/revisions. Do not filter removed states silently; distinguish removed, inaccessible, out-of-scope, missing and genuinely deleted with evidence.
2. Record page/query completeness and exact expected/actual/missing/unexpected/duplicate IDs. Fetch ancestor/link targets only with authorized scope; unresolved external nodes remain review mappings. An empty/partial query cannot establish a delete set.
3. Scan the selected local store as data. Index existing remote mappings and stable local identities, not filenames, titles, Git status or dates. Include unknown/untracked files in collision protection; local-only items without remote mapping are untouched unless individually approved.
4. Preserve adopted schema. For a configured UUID registry, `id` is immutable local UUID, `ado.work_item_id` is positive integer remote ID, `parent` is immediate parent's local UUID and `related`/`depends_on`/`blocks` are local UUID lists. Read legacy aliases only through an explicit compatibility mapping; reading never authorizes migration or changing key names.
5. Validate duplicate local UUIDs, duplicate remote mappings, multiple parents, missing parents, invalid types, cycles, unresolved links and case/normalization-sensitive path collisions. Resolve containment including symlinks/junctions and Windows path behavior. Never infer project/hierarchy from phase folders or require one universal Epic-to-Task layout.

### 2. Compare without writes

1. Compare local current, remote current and last verified two-sided baseline per field/path/relation, using [merge rules](merge-and-recovery.md). Record both local content hashes and remote revisions; revisions alone do not reveal local edits.
2. Distinguish remote-only change, local-only change, equal concurrent change, conflict and no-change. Preserve locally owned fields and custom sections. If both sides changed differently or ownership is unclear, show competing values with provenance; do not overwrite or silently auto-merge.
3. Preserve exact native source wording and format, including technical details. A source-copy sync is not a requirements rewrite or approval. Flag possible content-policy conflicts with item/field/excerpt/path and source revision without altering them. If existing local representation cannot retain HTML/format metadata, propose a reversible schema/representation decision; do not silently regex-strip or convert it.
4. Resolve parent/relation targets through the stable index. For new local records allocate one UUID using an available standard generator, check uniqueness and place it in the immutable plan once; every retry retains it. A UUID registry is project-selected, not mandatory for all stores. Never fabricate local UUIDs for unresolved remote targets.
5. Resolve exact tags through configured vocabulary/ownership; preserve historical local tags. Unknown additions or conflicting removals require review, not case/spacing normalization. Preserve locally managed owners/estimates/dates unless explicitly owned by this sync.
6. Determine actions: create, update, approved path move, relation update, no-change, preserve-local-only, conflict, unresolved/out-of-scope review, or proposed deletion review. Missing remote items are review-only. Even proven deletion requires explicit exact-path approval and child/link preservation review; no recursive directory deletion.

### 3. Present exact manifest and obtain scoped approval

Show all create/update/move/conflict/review/no-action counts by actual type, plus exact paths, stable identities, immediate parents/direct-child mappings, changed fields/formats/relations, local and remote baselines, unknown work, proposed deletes, collision findings and content-review flags. Do not hide skipped items or summarize away conflicts.

Save immutable approved input manifest and checkpoint results in an authorized **durable** run folder, including for local-only sync. Use [run records](../ado-operations/run-records.md), with stable operation keys, UUIDs, payload hashes, dependency boundaries, attempts and approval reference. Plans/results/baselines are not disposable requests. Reuse exact unchanged batch authority; changed payload/target/path/risk needs a new approved version. A no-write comparison changes no canonical files.

### 4. Apply approved local operations in stages

1. Revalidate approved manifest/hash, all relevant remote revisions and local source/destination hashes immediately before the affected write boundary. Stop drift, present a rebase and obtain approval; do not regenerate an active manifest.
2. Stage actual verified parent records before child records, then relationship resolution. Retain source wording, format, identity and all captured protected fields. Create/update only listed paths using structural parsing and atomic same-directory replacement, preserving file mode and unrelated content. Unexpected duplicate keys/parse failures stop, not invite regex repair.
3. Perform approved path moves only after containment, destination nonexistence/ownership and identity/hash checks. Never overwrite another UUID/ADO ID/type or unknown file. A directory move must enumerate exactly affected files; do not move/delete unlisted descendants implicitly.
4. In an adopted UUID registry write immediate-parent and relationship UUIDs only after targets verify. Unresolved remote references stay in the review/mapping record; do not insert numeric IDs, URLs or fake UUIDs into UUID arrays.
5. Checkpoint each create/update/move/relation attempt and read-back verification. Re-read exact identity, type, immediate parent, native content/format, tags, relation sets and protected baseline. Reconcile direct children, not descendants or counts alone. Interrupted/uncertain local file writes require exact path/UUID/remote ID/type/hash reconciliation before recovery; do not create a second file.
6. Resume from retained approved manifest and latest valid results with new attempt lineage. Re-read current identities/hashes and revalidate remote revisions/material before skipping terminal entries. Preserve original operation keys and new-record UUIDs. Missing/corrupt checkpoints stop resume.
7. Run available approved scoped structural validation for exactly modified/created paths, based on the existing schema; never claim an absent validator ran. Record manual/static checks separately. Failure or path-set mismatch blocks completion and timestamp advancement.

### 5. Commit sync baseline logically, not by Git

Only after all required approved actions and validation reconcile, checkpoint a new two-sided baseline for the exact scope, containing the verified local hashes/material, remote revisions/material and mapping versions. Treat baseline persistence as a tracked operation. If the project uses `last_synced_at`, update it only as an explicitly approved, hash-guarded config-cell change after successful full-scope reconciliation; do not invent the key. Partial runs retain per-operation evidence and prior full-success timestamp/baseline; never use a timestamp to disguise unresolved conflicts or missing items.

## Expected output and checks

Return the three-way no-write diff, conflict/decision queue and exact approval manifest; after authorized execution return per-operation verified/partial/blocked/uncertain statuses, IDs/UUIDs/paths, content/hierarchy/relation checks, preserved local-only/unknown work, unresolved references, deletion reviews, validation/baseline/timestamp outcomes and retained run paths. Keep results and recovery baselines through agreed retention. Cleanup is optional, exact-path approved and never recursively removes canonical stories, children, manifests or unrelated plans.

Check completeness, both-side drift, stable identities, adopted schema, parent/link direction, collisions/containment, protected content, every planned action, scope-specific baseline and accurate status. Sync does not certify imported wording as approved business requirements.

## Examples and limitations

- **Happy path:** Remote AC changed while local synced fields match baseline. Propose only that native-format AC update, preserve local notes/UUID, verify both revisions/hashes, write and read back, then checkpoint the new baseline.
- **Edge case:** A mapped file was renamed locally while its remote title changed. Preserve the stable UUID/remote ID, show the path/title ownership conflict and proposed mapping; do not create a duplicate by filename or overwrite the local rename.
- **Insufficient input:** The first sync has no baseline and finds divergent local/remote text. Produce bootstrap decisions per field/item and request authority. Neither remote source presence nor a recent change date chooses the winner.

No local sync, deletion or executable validation is performed merely by loading this skill. Missing source completeness, schema, baseline, safe atomic-write capability or approval yields a partial plan, not permission to overwrite.
