---
name: ado-operations
description: Use for Azure DevOps reads, writes, board operations, comments, attachments, estimation, or local synchronization. Provides the shared capability-aware access, exact planning, verification, and recovery workflow.
---

# ADO Operations

## Purpose and activation

Use before any ADO task, directly or through another ADO skill. This is the common execution contract, not permission to connect or mutate. Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), and [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md). For test evidence also read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Read [run-records](run-records.md) when planning a mutation or resuming; use [validation](validation.md) for bounded instruction checks. A separate routing skill is optional.

This skill owns capability/access discovery, read composition, routing and execution sequencing. ADO_MUTATIONS owns authorization, mutation/concurrency/recovery and retention policy; run-records owns concrete fields, statuses, invariants and binding representation. Compose only the task capability needed below; reads do not require a mutation manifest.

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

1. Produce a field/path/relation diff before changing remote items or canonical local files. Resolve any plan/record destination under [COMMON](../../references/COMMON.md#destination-and-retention). Show creates, updates, moves, links, uploads, comments, local writebacks, optional timestamp edits, exclusions and no-actions separately; titles/counts explain the plan but are not identity keys.
2. Apply [no-write plan and approval](../../references/ADO_MUTATIONS.md#no-write-plan-and-approval), populating the [input manifest](run-records.md#input-manifest) before requesting exact scope/delta approval. This applies to one comment/move and local-only sync as well as bulk creates. Carry an unchanged approved batch through composing skills rather than introducing another approval gate.
3. Identify dependency boundaries. For unavailable prerequisite IDs/URLs, use only [approved late-bound references](../../references/ADO_MUTATIONS.md#approved-late-bound-references) with [typed binding records](run-records.md#typed-binding-records); otherwise pause for approval of resolved content after prerequisites finish. Do not use placeholders to leave payload decisions open.

## 4. Execute and verify bounded stages

1. Before the first write, apply [execution and checkpoints](../../references/ADO_MUTATIONS.md#execution-and-checkpoints) and validate the [record invariants](run-records.md#results-and-checkpoint-integrity) against current inputs, connection and baselines. Block unsafe writes when required conditional guards are unavailable; drift goes to the conflict/rebase boundary, not a silent payload adjustment.
2. Select only operations with verified prerequisites: parent create and create-stage verification → children → approved links → final relation/direct-child verification. Resolve declared bindings and checkpoint their validated payload before sending. Use the task skill below for operation-specific mappings and verification, not counts/returned IDs as a substitute.
3. After each attempt, checkpoint its result; after each re-fetch/comparison, checkpoint verification before releasing dependents. Use the [results dictionary and invariants](run-records.md#results-and-checkpoint-integrity) for statuses, material/preservation evidence and exact identity/relation reconciliation. Keep independent effects separately tracked; do not mark an upload/comment/field/board/local-writeback dependency complete from another stage's success.

## 5. Recover, resume and report

1. On partial failure or uncertain create/comment/upload, stop dependent operations and apply [retry and resume](../../references/ADO_MUTATIONS.md#retry-and-resume). Use its action-specific reconciliation evidence before considering retry; insufficient proof stays uncertain, not safe-to-repeat. Route missing integration evidence to review or a no-write recovery proposal.
2. To resume, load the retained approved manifest and latest valid checkpoint; validate [lineage and terminal-result invariants](run-records.md#results-and-checkpoint-integrity), then reverify prior successes before skipping them. Continue only remaining approved operations, never recreate successes to repair dependent failures. See the [recovery walk-through](run-records.md#minimal-recovery-walk-through) for parent-stage and local-writeback boundaries.
3. Reconcile every planned operation and independent side effect to evidence-backed status and exact IDs/paths under [retention and report](../../references/ADO_MUTATIONS.md#retention-and-report). Return remaining dependencies and next permitted actions; retain recovery records. Cleanup or rollback is not implied by completing or stopping this workflow.

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
