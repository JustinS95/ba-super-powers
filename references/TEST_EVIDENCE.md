# Test execution and evidence contract

Read for generated automated tests or posted evidence, together with [COMMON.md](COMMON.md). Read [ADO_MUTATIONS.md](ADO_MUTATIONS.md) before publishing to ADO.

## Separate proof layers

1. **Runner result:** actual runner output, exit code, framework/version, environment/baseURL, code revision, configuration, timestamp/run ID and test inventory.
2. **Capture:** test/attempt-specific assertion outcomes, errors and evidence files. Screenshots illustrate a state; they do not establish assertions or full AC satisfaction.
3. **Upload:** each attachment's exact local file/hash, remote ID/URL, target and upload verification.
4. **Comment:** approved escaped content, target/comment ID, re-fetched content and attachment references. API success alone is not verified presentation. If rendering cannot be inspected, say so.
5. **Semantic AC satisfaction:** current AC text/version mapped to all needed test cases, role/negative/edge branches and assertions. An `acRef` string and one passed test do not prove a compound criterion.
6. **Optional AC patch/board move:** separately approved deltas, revision checks and verification. A green suite is not release approval or a workflow-state decision.

## Evidence modes and claim scope

**Project-native is the default for ordinary test authoring.** Reuse installed suite conventions and existing reporters, traces, results, attachments, retries and failure diagnostics. Preserve available native provenance/artifacts and disclose missing mappings; the full semantic fields below, a custom reporter and custom aggregation are not mandatory. Native reports may be durable evidence for supported runner/observation claims without constituting full semantic AC proof.

**Publication-grade applies when explicitly requested or needed for rich semantic AC/per-attempt capture claims or checkbox decisions.** A limited run-summary publication alone does not trigger this mode. Assess actual outputs against intended claims: reuse/adapt native outputs when sufficient; add capture or aggregation only to fill material gaps, using verified installed-version capabilities. The proof layers above remain distinct in both modes; only claims relying on a layer require its proof. Ask about unclear expectations only when consequential.

Missing evidence blocks unsupported full-pass/completeness, semantic AC or checkbox claims, not an accurately qualified summary under normal upload/comment approvals. Do not reconstruct absent assertions, attempts or completeness from titles, counts, filenames or static metadata, invent retroactive records, or modify historical evidence. A later capture/run needs separate authorization. Neither mode authorizes execution or publication.

## Publication-grade semantic evidence record (library-owned, not a Playwright API schema)

These are semantic obligations for full semantic coverage publication, not required runner fields or a universal test-authoring format. Native outputs and traceable supporting mappings may supply them; retain originals and document actual consumer compatibility.

Record run ID, suite/project, environment, baseURL, code/config versions, start/end time, runner exit status, collection completeness, primary/related story identities and revisions, and a test inventory. Each test attempt records stable test/AC refs, project/browser, worker/retry identity, expected status, actual status (including skipped/interrupted/timed out/failed/passed), assertions/coverage, errors, duration, safe page URL, and attachment paths/hashes. Strip tokens and private query values from URLs.

Preserve native exit status/results and every attempt. Where supplementary records are needed, persist them on disk with collision-safe run/project/test/retry keys, not a shared in-memory `afterAll` array. Use the available runner reporter/hooks correctly for the installed version; capture page evidence while the page is alive and flush outcome data even on failure. If aggregation is needed, read durable records after workers stop. Detect missing/duplicate records and interrupted runs; do not convert them to passes. Preserve retry history: eventual success after failure is flaky, not a clean first-attempt pass. Expected failures and skips remain explicit, not counted as ordinary passed assertions.

Legacy `results.json` may be imported only after checking its schema and completeness. If it has only passed/failed counts or no assertion coverage, retain those limitations; do not manufacture missing fields or claim full verification.

## Safe testing and data

Generating tests is not executing them. Confirm installed framework/environment, approved test accounts by role, authentication strategy, known selectors, fixture strategy, permitted side effects and cleanup before execution. Do not install packages, log into accounts, bypass MFA, touch production, execute destructive SQL, or trigger real payments/messages without explicit authorization. Use isolated synthetic data and unique run/test identifiers. Data mutation/cleanup is scoped to records the test created; never delete by a broad pattern. Failure cleanup must retain diagnostic evidence and report orphaned test data.

AC uses approved requirements. Technical test mechanics derive from actual implementation/schema/public contracts, not invented routes, columns or selectors. Unknown locators/schema/auth produce blocked generation or labeled non-executable scaffolding. Prefer observable assertions with bounded waits over arbitrary sleeps. A guessed selector must not appear as ready-to-run code. Check input behavior from the actual component; do not universally assume `fill()` fails or typing is required.

## Publish, resume, and retain

Plan uploads, comment, AC edits, moves and cleanup as distinct manifest entries with dependencies. Require approval before the first upload, not only before the comment. Reconcile uncertain uploads/comments to avoid duplicates. Verify uploaded objects/references and re-fetch the posted comment before dependent edits. If this capability is unavailable, mark unverified and stop dependent automation.

Before checkbox edits re-fetch AC text, format, revision and map evidence to the current criterion content, not number alone. Check only fully demonstrated criteria; partial, skipped, expected-failure or unasserted coverage remains unchecked and is explained in the comment, not silently appended to requirement text. Preserve existing checks, wording, numbering and HTML/Markdown. If the checkbox representation cannot be edited safely, propose a manual update rather than rewriting the field.

Retain evidence and manifests through upload/comment/AC/move verification and the agreed retention window. Cleanup is optional, never default. Only exact authorized generated paths may be removed after dependent work completes; preserve recovery records. A partial upload, failed comment, revision conflict or denied move leaves evidence intact and a resumable status report.
