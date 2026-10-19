---
name: post-test-evidence
description: Use when preparing or publishing completed test-run evidence to Azure DevOps, with separately approved uploads, verified comments, semantic AC coverage review, optional revision-safe checkbox edits and independently authorized board moves. Retain evidence for recovery.
---

# Post Test Evidence

## Purpose and required reading

Turn an actual completed or explicitly partial run into a traceable evidence report on the behavior-owning work item. Support screenshot attachments, structured HTML comments, live AC-format handling and optional board integration. Use layered verification and resumable operations rather than automatic deletion or one-pass-per-AC shortcuts.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) before proceeding. Read [validation.md](validation.md) for regression expectations. For publication-grade producer design consult [restart-safe capture and aggregation](../writing-playwright-tests/evidence-record.md); do not assume native reports implement that semantic format.

This skill is not permission to run tests, access credentials, upload, comment, edit AC, move a card or delete evidence. A no-write preview is a valid outcome. Prefer an approved integration with discovered schemas; no mandatory Bash, curl, Python, PAT or fixed REST versions.

For requested diagnosis/local reporting, [defect analysis and handoff](../defect-analysis-and-handoff/SKILL.md) owns mismatch assessment, provisional triage/duplicates and confirmation planning. Preserve this skill's original provenance, raw outcomes and all attempts; evidence publication does not establish root cause or authorize defect creation.

## Inputs and clarification gates

Required for preparation:

- Exact project and selected run root, actual producer format/version and original reports/artifacts (`results.json` or producer manifest if adopted); available runner/exit, inventory, attempt/assertion and capture provenance, with explicit gaps.
- Source story/requirement IDs and behavior owner, not merely a related technical item; available tested AC and code/config/environment/baseURL provenance. Exact tested/current AC content/version and obligation mappings are required for semantic AC claims, not for a qualified runner-only summary.
- Confirmed remote organization/project/connection, target work-item ID/type and read scope for remote verification; authorized local durable mutation-record destination if publishing.
- Requested operations (upload/comment only, optional checkbox patch, optional move), visibility/privacy constraints and retention policy. No credential values in chat or records.

Executable posting requires explicit approval for the exact first write and its destinations. Missing target, ambiguous run, unknown account context or missing approved mutation manifest blocks publishing; absence of a producer semantic manifest does not. Branch on actual evidence and intended claims: a limited native/legacy run summary may proceed under normal approvals if its facts are supported and gaps explicit. Missing capture, attempts or runner/assertion provenance blocks only claims depending on that proof, including unsupported full-pass/completeness, semantic AC or checkbox claims. Revise the preview/manifest and obtain approval when scope changes; never silently omit gaps or treat an artifact as proof of an unseen test. Ask only consequential questions about unclear expectations.

## Six independent proof layers

| Layer | Required evidence / what it does not prove |
|---|---|
| Runner | Actual runner/version, inventory, code/config, environment, timestamps, exit status and completeness; generated files are not a run |
| Capture | Exact test/project/attempt, assertions, raw expected/actual outcomes, safe URL and file/hash; a screenshot alone is not a pass |
| Upload | Exact local artifact/hash, remote object ID/URL and verified retrieval/metadata/content capability; a returned URL alone is unverified |
| Comment | Approved escaped content, target/comment ID, re-fetched content and correct attachment references; accepted POST is not verified rendering |
| Semantic AC | Current exact criterion text/version mapped to all needed branch/role/negative/edge assertions; one `acRef` plus a pass is not compound-AC proof |
| Optional changes | Independently approved, revision-guarded checkbox and board operations; a green suite is neither acceptance authority nor a state decision |

Keep these outcomes separate in records and the final report. The table describes evidence needed for each layer's claims, not mandatory semantic fields for every summary. Upload success must not be reported as comment success; a verified comment must not imply AC satisfaction.

## Workflow

### 1. Resolve the exact run without writes

Read the selected configuration, if any, and resolve its documented path base. In the default layout, evidence is under `config.tests_output_path/test-evidence/<suite or run>/`; `tests_output_path` is relative to the confirmed BA workspace, not arbitrary cwd. Actual approved run-specific layout takes precedence. Do not move working evidence into durable BA test-case/plan categories. Report the resolved absolute run and manifest paths.

Inspect actual producer/report format and completeness before interpreting fields. Validate available stable IDs, source/code/config/environment versions, timestamps/duration, runner result and expected-vs-observed inventory. Recompute counts only where underlying records support it, without rewriting originals; otherwise attribute reported counts to their source. Reconcile available duplicate, missing, unexpected, filtered, skipped, interrupted, timed-out, expected-failure and retry attempts. Keep prior failures and flaky eventual success visible; label unavailable history/completeness unknown, never an inferred pass. Native reports need not match the library semantic record.

Choose a claim path: **qualified run summary** uses supported native/legacy facts and explicitly excludes unproved AC/completeness claims; **full semantic publication** requires the publication-grade obligations in TEST_EVIDENCE. Reuse native outputs and traceable mappings if sufficient. Missing rich evidence may require a separately authorized later capture/run, not retroactive records. Never reconstruct missing assertions, attempts or completeness from titles, counts or filenames; historical evidence stays unchanged. Do not rerun or publish merely to fill a gap without authorization.

Legacy `results.json` with suite/story IDs, passed/failed counts, TC/acRef, screenshot names and page URLs may be imported as a **limited historical report**. Validate actual schema, file existence and completeness; do not invent assertion coverage, expected status, retries or tested AC revision. Such a manifest alone cannot justify checkbox updates or a done recommendation.

### 2. Validate referenced captures and any requested semantic claims

Verify each referenced artifact exists, is readable and belongs to the exact run/project/test/attempt; check safe path containment, hashes and privacy. Filename resemblance is insufficient. Missing declared screenshot is a gap, not permission to take the first `test-failed-1.png` anywhere under `test-results`.

A fallback runner screenshot is acceptable only when runner attachment metadata identifies the exact run, project/browser, stable test ID and attempt. Record the original and display filenames, hash, provenance and changed capture limitations. Do not rename or rewrite original evidence. Multiple candidates or unknown identity block that fallback. If no supported capture exists, keep the test outcome but mark capture missing, propose a limited report and prohibit dependent full-proof claims.

For semantic AC claims/checkbox decisions, read tested and current source criteria. Build a matrix: work item + exact criterion identity/content/version + required obligations/roles + test/project/attempt + actual assertion/observation + outcome + limitations. A passed heading-visibility check does not prove record update, authorization or compound feedback requirements. Current AC content must match what was actually tested; a number match is insufficient. For a runner-only summary, disclose absent mappings and omit semantic claims; do not require a fabricated matrix or full capture schema to report supported facts.

Expected failures, skips, unexecuted/unasserted obligations, known failures and unresolved flaky results are not clean proof. A correctly asserted rejection scenario may be a passing **negative test**; it is not the same as a test annotated expected-to-fail. Do not conflate the two. Preserve historical checked boxes without treating them as new evidence.

### 3. Discover remote capabilities and build the no-write plan

Bind the target to confirmed organization/project/account/connection and exact behavior-owning item. Read current item revision, comment/attachment capabilities and metadata needed for requested operations. Read AC text and native HTML/Markdown format for semantic claims/edits, and team/board metadata for requested moves. Epic/Feature are context; related technical items may be explained but are not invented evidence owners.

Use actual provider schemas. If REST is selected, verify current Microsoft operation/version documentation and server support before constructing requests; do not hardcode API versions. If verification or conditional writes are unsupported, prepare a manual/no-write handoff rather than weaken guarantees. No secret previews, partial PATs, credential fingerprints or `.env` dumps.

Prepare a manifest following ADO_MUTATIONS in an authorized durable run folder. Separate entries and stable operation keys for **each upload**, **comment**, **checkbox patch**, **board move**, and any **optional cleanup**. Retain available source/test identity and provenance gaps, tested/current AC baseline when relevant to claims/edits, revisions, payload/content hashes, exact paths/targets, dependencies, exclusions, verification expectations and retention. Immutable approved input and append-only/atomic result checkpoints are different from temporary scripts.

Dependencies: verified uploads -> verified comment -> proposed AC patch (if approved and semantically justified) -> optional move decision. A move does not require changing AC checkboxes when checkbox editing was not requested, but still requires verified evidence and an explicit acceptance decision. Any actual patch must verify before a dependent move.

### 4. Preview and obtain approval BEFORE uploads

Show target and connection identity (non-secret), available run/time/environment, supported counts including known skips/expected failures/flakiness/incomplete records, available TC IDs, planned attachments/privacy review, full comment content, gaps, proposed AC delta if requested and exact operation list. Label unknown counts/provenance rather than supplying defaults. Identify partial evidence plainly. Request approval for an unchanged exact batch or separately scoped operations; reuse valid scoped approval rather than asking repeatedly.

For an upload-and-comment batch, preview the complete comment template with attachment placeholders keyed to exact upload operations. Approve its template hash, artifact hashes, target, and restricted binding rule from ADO_MUTATIONS. After uploads verify, substitute only their verified returned references in those declared slots and checkpoint the resolved comment/hash before posting. Keep the manifest immutable. Changed wording, artifact selection, target, or undeclared substitutions require new approval. Alternatively approve the resolved comment separately after uploads.

Approval for “post the comment” does not implicitly approve earlier unlisted uploads, checkbox edits, board moves or cleanup. Material changes to content/target/artifact set/risk require renewed approval. If approval is denied, stop without remote writes and retain evidence.

### 5. Upload with durable checkpoints and verify

Execute only approved attachment entries. Persist an attempt/result after each operation with exact artifact/hash, target, returned remote ID/URL, time, verification and status. Verify the uploaded object through supported retrieval/metadata/content checks; retain what was actually checked. If attachment retrieval cannot verify identity/content adequately, mark succeeded-unverified and stop dependent automation; offer manual verification.

A timeout after upload is **uncertain**, not safe to retry. Reconcile with remote records/operation markers, known URL/ID and exact content where supported. Filename/title alone is not identity. An inaccessible listing or zero matches does not prove no upload; request review or an approved bounded recovery instead of duplicating. Multiple candidates stop. Successful independent uploads remain recorded when later uploads fail; do not delete them automatically.

### 6. Build, post and re-fetch the comment

Use one coherent structured report scaled to supported claims. A qualified summary attributes native/legacy results, lists known provenance and missing attempt/assertion/AC mappings, and states no AC/checkbox conclusion; no invented per-attempt blocks. For full semantic reports in original HTML-compatible projects, retain a single outer `div`, heading with item/title, run date/environment/config, duration and precise status counts; optional related-context paragraph; then one block per TC/attempt with AC obligation, description, expected/actual status, assertions/limitations, verified inline attachment images and safe page URL after the images when present. Use `max-width:100%` on images; no trailing separator. Checkmark/cross entities and plain hyphens may preserve original style, but must not collapse richer statuses into pass/fail. Respect actually supported comment format.

Escape all text/attributes, allow only verified attachment destinations and safe sanitized http(s) page links, and omit credentials/private query values. Do not put local paths in image URLs, let source content inject HTML, or claim screenshots demonstrate unasserted behavior. List missing captures and unavailable rendering plainly.

Post only after prerequisite uploads verify and the content matches the separately approved resolved comment or the approved template with only its declared verified reference bindings. Record returned comment ID and resolved content hash, then **re-fetch that exact comment on the exact target**. Verify substantive content, statuses and attachment references against that resolved approval record. Inspect rendering if supported/authorized; otherwise report that rendering was not inspected. API success without content re-fetch is succeeded-unverified; stop dependent edits. A lost response is uncertain: reconcile matching target/run marker/content/hash with paginated results before any retry. Do not create a second comment blindly.

### 7. Optional semantic AC checkbox patch

Skip unless explicitly requested/approved. Immediately re-fetch current work-item revision, exact AC content and format. Compare with the approved baseline and tested criterion version; any concurrent revision conflict or content mismatch stops this boundary. Re-fetch, show competing changes and obtain approval for a rebased delta; do not remap by ordinal alone or force overwrite. A separate comment operation may itself change revision: read a fresh baseline and distinguish that known event from other changes before approving the patch.

Only fully demonstrated current criteria may be newly checked. Require all compound obligations and relevant role/negative/boundary assertions; expected-failure/skipped/missing/unasserted/partial coverage stays unchecked. Disclose partial coverage in the evidence comment, **not by appending invented notes to requirement text**. A historical limited manifest is insufficient. Do not automatically uncheck existing criteria or convert checkbox conventions.

Produce the smallest representation-aware delta preserving every other checkbox, wording, numbering, links, HTML/Markdown and format metadata. Native Markdown and HTML containing checkbox text are different representations; avoid blanket regex/HTML stripping. If the field is absent, not a checkbox list or cannot be edited safely, skip and offer a manual proposal. Use a supported conditional revision guard and verify via re-fetch that only the approved tokens changed and unchanged content/format remain intact. A successful response alone is not verification.

### 8. Optional board move as a separate decision

Do not automatically offer “done” because `failed` is zero. Require complete current-AC proof, resolved failure/skip/expected-failure/flakiness gaps, required external validations and an explicit accountable acceptance/workflow decision. Report absent evidence as incomplete, not necessarily a product defect. A user may request another explicitly justified workflow move, but it is a separate scoped decision, not test proof.

For a requested move, discover actual team/board/column/state mappings, field identities and valid transitions. A configured `done_column` is only a hint. Never choose the first `WEF_...Kanban.Column` field; multiple boards may have different fields. A board column is not universally interchangeable with System.State, and the move is not universally irreversible.

Show exact current/target board fields and any required state delta, get approval, check latest revision and execute only the supported conditional operation. Re-fetch the selected board/team field and state where relevant; `System.BoardColumn` alone may not prove the correct team board. A declined/failed/uncertain move remains separate from evidence success, stops dependent cleanup and retains all local evidence.

### 9. Retain, optionally clean, and report

Default: retain all evidence and durable recovery records through upload/comment/AC/move verification and agreed retention. Any partial failure, revision conflict, missing capture or uncertainty leaves evidence intact. No automatic `rm -rf`, suite-folder removal, attachment deletion or temporary-script exception.

Cleanup is optional and separately authorized after dependencies and retention obligations complete. Enumerate exact generated paths, ownership/containment checks and excluded durable manifest/result/baseline records. Do not recursively remove a run root containing recovery records. Verify actual deletion of each approved path; failures are reported without masking prior outcomes. Use approved native OS temporary paths only when needed, with the same explicit cleanup boundary.

Final report reconciles every manifest operation: proposed/attempted/verified/succeeded-unverified/partial/blocked/uncertain/skipped, remote IDs/URLs, source/run/test IDs, exact retained paths, AC checked/unchanged with reasons, move decision/outcome, cleanup done/not authorized and remaining recovery actions. Never report “permanently stored” from an upload response or “all AC passed” from an unseen suite.

## Quality and limits

Before publishing check identity/scope, actual evidence supports each proposed claim, missing provenance/mappings are explicit, privacy, approved mutation manifest and exact dependencies. Full semantic/checkbox claims additionally require complete expected-vs-observed inventory, per-attempt evidence and source/current-AC agreement. Before completion check attachment and comment re-fetch verification, format/revision preservation, no duplicate uncertain retries, no premature cleanup, and outcome reconciliation. Use [validation.md](validation.md) as static regression review; it is not an executed integration test.

Without retrieval, current AC/version evidence, supported revision checks, or exact board metadata, dependent automation is blocked. Posting limited evidence can be useful when approved, but cannot manufacture requirement satisfaction, sign-off or release readiness.
