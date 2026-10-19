# ADO transport, mutation, and recovery contract

Before any ADO work read this file, [COMMON.md](COMMON.md), and [PROJECT_CONTEXT.md](PROJECT_CONTEXT.md). All ADO skills share this contract, including estimation and local synchronization.

This file owns authorization/exact scope, mutation, concurrency, recovery and retention policy. [ADO Operations](../skills/ado-operations/SKILL.md) owns capability discovery, access/read composition, routing and execution sequencing; [durable run records](../skills/ado-operations/run-records.md) owns the concrete semantic fields, statuses, invariants and binding representation. These are complementary responsibilities, not separate approvals.

## Capability-aware access

Use [capability and access discovery](../skills/ado-operations/SKILL.md#1-resolve-capability-and-access) and [metadata/read composition](../skills/ado-operations/SKILL.md#2-discover-metadata-and-establish-a-complete-read) for the requested operation. Prefer an existing approved connection; REST/CLI/SDK alternatives must be available, authorized, and meet the same scope, concurrency and verification guarantees. Missing capability means a no-write plan or supported tool/export request, not guessed tools or a separate estimation transport.

Bind the run to confirmed organization, project, account/connection, and read/write scope. A changed authentication context stops mutations until revalidated and approved; never fall back to another organization/account. Do not print credentials, partial secrets, auth headers, `.env`, or token fingerprints. Use existing secure authentication; do not ask users to paste secrets into chat. Any authorized credential-file access parses only required keys as data, never executes the file.

Resolve required process metadata before write planning; record unknowns rather than assuming `User Story`, a StoryPoints field, fixed title limits or terminal state names. Direct REST requires current Microsoft operation/version documentation and actual server support; this library does not define API payloads/versions. The linked discovery workflow supplies request construction and response handling mechanics.

## Read integrity

Bound scope explicitly by approved IDs/query/area/iteration; paginate comments, queries, and identities as supported. Reconcile expected/returned ID sets, duplicate returns, inaccessible/missing items, and limits. Retrieve batches proportionately. Empty results do not prove deletion. Label snapshots with time, scope, revisions, extraction errors, and completeness before downstream analysis. Preserve native Markdown and HTML source/format metadata; derive a separate plain-text analysis view only when needed.

## No-write plan and approval

Build the comparison without changing operational files or remote items. Before a mutation, save the approved input manifest in an authorized durable run folder. The plan itself is a permitted artifact write only when its destination is authorized. The manifest is immutable once approved. A single operation can use a compact record; a batch needs one entry per action and explicit dependency boundaries.

Use the [input manifest dictionary](../skills/ado-operations/run-records.md#input-manifest) for exact operation identities, baselines, approved deltas/hashes, dependencies, exclusions, verification and retention evidence; use [results and checkpoint integrity](../skills/ado-operations/run-records.md#results-and-checkpoint-integrity) for attempt history and statuses. Record field mappings and unknowns before approval, not mid-write. Preserve absent/null/empty/zero/false distinctions. Read-only snapshots do not require a mutation manifest.

Approval covers exact targets, actions, fields, destinations, and risks. A changed manifest starts a new approved version/run. Unchanged scoped approval carries through composition. No action implied by a proposed analysis, approved story text, Git-added file, or cached ID.

### Approved late-bound references

Some values cannot exist before an approved prerequisite runs, such as attachment URLs for a comment or a newly created parent's remote ID. The immutable manifest may authorize **typed placeholders**, each identifying the prerequisite operation key, exact returned property, expected target/scope, and permitted insertion location. Approve the full content template and its hash, the exact attachment/source set and hashes, the dependency map, and this restricted binding rule before execution. Placeholders cannot defer decisions about wording, business rules, recipients, destinations, or which artifacts to include.

Bind only verified outputs of those exact approved prerequisites. Validate returned reference type, target/scope and safe escaping; record each binding's provenance plus the resolved payload/content and hash in the durable checkpoint **before** sending it. Keep the original approved manifest/template unchanged. Only declared substitutions are covered by the original approval; missing/ambiguous references or any other material difference stop the dependent action for clarification/new approval. Without approved binding rules, obtain separate approval of the fully resolved content after prerequisites finish.

Use [typed binding records](../skills/ado-operations/run-records.md#typed-binding-records) to represent and validate these substitutions; that representation does not extend their authorization.

## Execution and checkpoints

1. Validate manifest scope, approved hash, current authentication context, all required field mappings, source identities, and baseline revisions/hashes before the first write.
2. Use a durable unique operation key (for example action + project + source UUID + immediate parent). Stage parents before children and links; only execute operations whose prerequisites are verified. Keep a single writer for shared results or use independently merged checkpoints.
3. Persist sanitized results atomically after each attempt and verification using [results and checkpoint integrity](../skills/ado-operations/run-records.md#results-and-checkpoint-integrity). A successful response or returned ID without verification remains `succeeded_unverified`.
4. Re-fetch after success. Verify correct project, type, stable identity, parent, approved changed fields, preserved fields/format, directional relations, and direct-child sets where in scope. IDs/counts alone are not proof. Compare exact expected/actual/missing/unexpected/duplicate identities and relation tuples; descendants do not satisfy direct children. Verification is stage-aware: if an approved create omits a parent relation until a later link stage, verify its create-stage baseline and prerequisite mapping first; final parent/relation verification remains required after linking.
5. On update use the integration's supported revision/conditional-write check. A conflict stops that boundary; re-fetch, show competing changes, and obtain approval for a rebased delta. Never force overwrite.
6. Preserve field format and unrelated markup. For new text choose supported format deliberately. Changing HTML to Markdown requires separate approval and comparison; do not regex-strip live content. Normalize only for comparison (such as line endings), not silent rewriting.

If supported conditional-write guards are unavailable, block unsafe updates rather than substitute read-then-unconditional overwrite. Document comparison-only normalization; preserve semantic list order and meaningful whitespace/markup. Report uncaptured preservation boundaries rather than claiming they were verified.

## Retry and resume

- A timeout/transport loss after any non-idempotent action is **uncertain**, not failed. Reconcile before retrying create, attachment upload, or comment posting.
- For uncertain create, query within the approved scope/run window and compare exact type, immediate parent, source identity/operation marker where supported, material fields/hash, tags and exclusions. Title alone is never an idempotency key. One exact candidate can be recovered; multiple candidates stop. Zero candidates do not prove no create if visibility is incomplete/eventually consistent: wait/recheck or request review before an explicitly authorized bounded retry.
- For uncertain comments compare target, author, native body/hash, mentions, attachment references and run timing; for uploads compare bytes/hash, name, target/run provenance and supported object evidence/returned references. Unattached uploads may not be enumerable: inability to find them does not prove absence. Re-fetch and verify one exact candidate before checkpointing recovery; multiple/mismatched candidates or insufficient proof stop for review.
- Retry safe reads or known-not-applied/idempotent actions only with documented limits/backoff and unchanged authority. Authentication, permission, validation, and revision failures require correction, not blind retries. No automatic transport/account switch.
- Resume from the immutable manifest and latest valid durable checkpoint with new attempt lineage. Re-fetch/re-read stable identity, revision/hash and material contract before skipping terminal operations as `skipped_reverified`; reverify prior successes, do not recreate them. Preserve original operation keys, local UUIDs and approval scope. Invalid or missing checkpoints block resume, not justify guessing.
- Partial failure stops dependent steps. Record independent successes and remaining work; propose any rollback as a new scoped action, never implicitly delete/recreate stable items. Creates, relations, uploads, comments, field/board changes, local identity writeback and optional timestamp edits are separately tracked outcomes, even when composed in one approved batch.

## Retention and report

Retain input manifest, results, material baseline/diffs needed for recovery, and evidence references according to agreed retention. Sanitize diagnostics before retention; never retain secrets. Temporary requests may be cleaned only under the shared exact-path policy, after required recovery facts persist. Local sync is a mutation too: manifests are not temporary and no recursive cleanup is implied.

Final reports reconcile every planned action to verified/partial/blocked/uncertain status, IDs, paths and evidence. No unexplained count discrepancies, unsupported success claims, or automatic rollback/deletion.
