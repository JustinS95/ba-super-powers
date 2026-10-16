---
name: ado-operations
description: Use for Azure DevOps reads, writes, board operations, comments, attachments, estimation, or local synchronization. Provides the shared capability-aware access, exact planning, verification, and recovery workflow.
---

# ADO Operations

## Purpose and activation

Use before any ADO task, directly or through another ADO skill. This is the common execution contract, not permission to connect or mutate. Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), and [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md). For test evidence also read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Read [run-records](run-records.md) when planning a mutation or resuming; use [validation](validation.md) for bounded instruction checks. A separate routing skill is optional.

## Required inputs and clarification

- Confirmed organization, project, approved account/connection, action scope, and read/write authorization. Resolve team and board only for board-dependent actions.
- Exact IDs or bounded query, area/iteration selection and whether descendants are included, applicable process/type/field mappings, and expected output destination.
- For writes: exact proposed delta, baseline, approval reference, durable run destination and retention. For registry work: the selected canonical store/schema and ownership rules.

Ask only for missing facts affecting scope, identity, correctness, destination or safety. Fuzzy organization/project names are discovery hints, not authorization. Missing capabilities produce a no-write plan or a request for a supported export/tool; do not invent integrations. Separate facts and their source/version, assumptions, proposals, and confirmed decisions throughout.

## 1. Resolve capability and access

1. Discover available approved integration tools and read their real schemas, including pagination, limits, error behavior, conditional writes, relations, rich text, comments and attachment support. Never guess a tool name, signature, endpoint version, or payload property.
2. Use the existing approved secure connection. REST, CLI and SDK are equivalent alternatives only if available, authorized and capable of the same scope, concurrency and post-read verification. Estimation uses this same contract; no mandatory Bash, curl, PAT, Python, jq or platform. Shell execution requires approval.
3. Record non-secret connection/account identity and bound org/project/scope. Stop mutations on changed authentication context; revalidate and obtain approval, never silently switch accounts/transports/organizations.
4. Never output credentials, masked fragments, secret fingerprints, headers or full `.env` contents. Do not request pasted secrets or automatically create credential/config files. Authorized credential-file access parses only necessary keys as data, never sources/executes it.
5. For direct REST verify current authoritative Microsoft operation documentation and server support before constructing requests. Match documented method, encoded path/query, content type, payload and supported version. Work-item JSON Patch, query bodies, comment JSON and binary attachment uploads are distinct contracts, not interchangeable. Serialize untrusted source data rather than injecting it into executable code.

## 2. Discover metadata and establish a complete read

1. Resolve exact process work-item types and hierarchy, relation direction/types, required/editable fields and their reference names/types/limits, states/transitions, area and iteration identifiers with exact paths. Resolve the union for all intended operations before approval. Unsupported required fields stop planning; explicitly omit unsupported optional fields.
2. Board state is not process state. Discover team/board column mappings, split-column done fields and applicable writable board fields. Never choose the first WEF field on an item or assume one mapping applies project-wide. Do not PATCH the read-only `System.BoardColumn` projection.
3. Confirm query bounds and filters. Default source extraction includes all states unless requested otherwise. Read one representative in-scope item to validate request shape before large retrieval; a static request audit is not connectivity proof.
4. Paginate queries, comments, identities and other lists using documented continuations. Observe endpoint limits; if a query truncates, partition under the same approved bounds and reconcile overlaps. Batch detail reads proportionately. Do not use incompatible field/expand combinations; obtain relations and format metadata with supported calls.
5. Check transport/tool success before parsing. Retain sanitized status/error classification and sufficient response facts for diagnosis. Permission/auth failures are not invitations to change scope. Independently accessible items may be returned as partial; never conceal inaccessible IDs.
6. Reconcile exact expected/returned/missing/unexpected/duplicate IDs. Record source revisions, extraction time, query, scope, page coverage and errors. Empty or incomplete results do not establish deletion. Preserve native HTML/Markdown and each field's format metadata; any plain-text analysis view is separate and noncanonical, using a format-aware parser rather than regex rewriting live content.

## 3. Plan without operational writes

Produce a field/path/relation diff before changing remote items or canonical local files. A plan artifact itself needs an authorized destination. Use the durable [run record contract](run-records.md): immutable approved inputs, stable operation keys, baselines, dependencies, lineage and atomically checkpointed sanitized results. This applies to a single comment or move and to local-only sync, not merely bulk creates.

Show exact creates, updates, moves, links, uploads, comments, local writebacks, optional timestamp edits, exclusions and no-actions separately. Titles and counts are explanatory, not identity keys. Reuse approval for the exact unchanged batch across composing skills. New targets, fields, payload, account context, destinations or material risk require a new approved version; do not repeatedly gate an unchanged operation.

## 4. Execute and verify bounded stages

1. Validate approved manifest/hash, source identities, connection context, required mappings and current baseline revisions/local hashes. Stop on drift. Use supported revision/conditional-write guards; if unavailable, block unsafe writes rather than substituting a read-then-unconditional overwrite.
2. Stage verified parents before children, then links and dependent effects. Keep one durable checkpoint writer or safely merged independent checkpoints. Record every attempt before proceeding to a dependent action.
3. Persist results after each attempt and verification. A returned ID or successful response is `succeeded_unverified`, not completion.
4. Re-fetch and compare exact material values, identity, scope/project/type, immediate parent, approved fields, native formats and protected baseline fields/relations. Compare directional relation tuples and direct-child identity sets including duplicates. A descendant does not satisfy a direct-child expectation. Report uncaptured preservation boundaries honestly.
5. Preserve absent/null/empty/zero/false distinctions and semantic list order. Any comparison-only normalization must be documented and cannot rewrite canonical source; meaningful whitespace/markup remains significant.
6. Version conflict stops that dependency boundary. Read competing changes, show a rebase proposal, then obtain approval for its changed delta. Never force overwrite or silently adjust approved payloads.

## 5. Recover, resume and report

- Unknown outcome after create/comment/upload is **uncertain**. Do not blindly retry even on a nominally retryable transport/status. Reconcile exact scoped current-run matches first, including source/operation identity where supported, material hash, type, parent, tags, run window and exclusions for creates; target, author, body/mention/attachment references and timing for comments; bytes/hash, name, target/run provenance and returned references for uploads. If the integration cannot expose enough proof, require review rather than claiming recovery.
- One exact candidate may recover the operation; multiple/mismatched candidates stop. Zero matches do not prove absence under incomplete visibility, paging, eventual consistency or unattached uploads. Wait/recheck under bounded approved read policy or seek review before a separately authorized bounded retry.
- Safe reads or known-not-applied/idempotent writes may use documented bounded backoff with unchanged authority. Auth, permission, validation and concurrency failures need correction, not blind retries.
- Resume from immutable manifest and latest valid checkpoint with new attempt lineage. Re-fetch/re-read stable identity and revision/hash plus material contract before skipping terminal operations as `skipped_reverified`. Missing/invalid history blocks guessing; retain operation keys and local UUIDs.
- Stop dependent work on partial failure. Report independent successes and remaining actions individually. No recursive deletion, implicit rollback, or delete/recreate of stable items. Propose any rollback as a new scoped action.
- Reconcile every planned operation to evidence-backed status and exact IDs/paths, including local writeback independently. Report partial/blocked/uncertain accurately. No default cleanup: retain manifests, results and recovery baselines; temporary request files are a different class, removable only by the exact-path approved cleanup contract.

## Task routing and outputs

| Capability | Skill |
|---|---|
| Bounded source snapshot with hierarchy | [fetch-ado-work-items](../fetch-ado-work-items/SKILL.md) |
| Reviewed source create/update and identity writeback | [ado-work-item-creation](../ado-work-item-creation/SKILL.md) |
| Team board moves | [ado-move-board-item](../ado-move-board-item/SKILL.md) |
| Block/unblock or readiness proposal | [ado-board-blocker-analysis](../ado-board-blocker-analysis/SKILL.md), [ado-ready-for-work-analysis](../ado-ready-for-work-analysis/SKILL.md) |
| Proposed story/task estimates | [ado-estimate](../ado-estimate/SKILL.md) |
| Approved comments or mention replies | [comment-on-ado-item](../comment-on-ado-item/SKILL.md) |
| Three-way canonical local sync | [sync-stories-from-ado](../sync-stories-from-ado/SKILL.md) |

Expected output is a scoped snapshot/no-write proposal or a manifest-backed action reconciliation, with evidence, unresolved inputs and exact retained paths. Check authority, completeness, metadata, identities, concurrency, material preservation, operation coverage and honest statuses before reporting. This skill does not supply credentials, define business policies, certify readiness/release, or guarantee capabilities absent from the installed integration.
