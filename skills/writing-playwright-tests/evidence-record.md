# Restart-safe evidence design

Read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) first. This document defines a **library-owned semantic record**, not fields guaranteed by a Playwright API, JSON Schema or provider tool. Adapt the installed runner's documented reporter/hooks into this record; do not paste an assumed hook implementation.

## Identity and durable records

- Persist a run envelope before workers start: unique run ID, suite label, approved source inventory, primary/related story identities and AC content/version/hash, environment/baseURL (sanitized), code/configuration/version evidence, start time and expected test/project inventory. An example suite label is `Story-427-archive-draft`; it is not unique enough alone for repeated runs.
- Key attempt files by run + project/browser + stable test ID (including parameterized case identity) + repeat index + retry/attempt. Include worker identity as provenance, not sole stable key. Prevent path traversal, filename collisions and stale cross-run reads. Use isolated attempt paths and atomic writes; never overwrite earlier attempts with the latest retry.
- Record actual and expected status separately: passed, failed, timed out, interrupted, skipped and other runner-supported outcomes remain distinct. Retain failure/error, duration, assertion outcome/coverage, role/fixture identity, safe URL, timestamps and capture paths/hashes. A test passing despite expected failure is unexpected success, not ordinary acceptance proof.
- Assertion/AC mappings name exact required obligations and expected observations. Do not infer assertion success from test title or `acRef` alone. Reporter outcomes must agree with the actual executed code/assertions; static metadata is not runtime assertion evidence.

## Capture lifecycle

Capture key assertion states and safe URL in the test while its page is alive. For failure diagnostics use a supported test-scoped hook/fixture with access to the still-live page; verify lifecycle against installed APIs. `afterEach` does not universally lack page access, nor is a page always available after setup failure. No capture in worker-level `afterAll` should assume a test-scoped page remains alive.

Persist URL/capture identity promptly before an assertion that might throw when useful; this does not guarantee capture if navigation/setup already failed. Record missing capture explicitly. Screenshots do not imply assertion success. Failure capture must not mask original assertion errors or turn failures into passes. When context/page has closed, retain runner trace/report evidence and report capture unavailable rather than fabricate it.

Flush attempt outcome from a supported reporter and/or per-test hook even after errors; preserve runner artifacts as independent recovery evidence if a worker dies before flushing. Capture error and test error are separate outcomes. Redact secrets/private query strings and prohibit unsafe evidence retention.

## Aggregation after workers stop

Use a runner-level completion reporter or explicit post-run aggregation reading durable records after all workers finish. A worker's `afterAll` may run repeatedly after restarts and cannot reliably finalize a whole run. Do not use module/describe-scope counters, result arrays, or start timestamps as cross-worker truth. A describe-scoped variable is recreated in a new worker too.

Reconcile expected test inventory to runner collection and attempt files by exact IDs: missing, duplicate, unexpected, filtered, skipped, interrupted and setup-failed entries. Missing records are **unknown/incomplete**, not automatically failed assertions or passes. Derive run timing from the durable runner envelope, not one worker's clock initialization. Preserve all attempt outcomes, known-failure annotations and runner exit status. Failure then success is flaky; expected failure and skipped are not ordinary passes. Report these counts separately, with collection completeness and any aggregation errors.

If killed before finalization, retain the incomplete run with resumable status; do not manufacture a final passing `results.json`. Aggregation reads only the selected run, never all matching files in a shared folder.

## Handoff and legacy compatibility

An adopted `results.json` may remain the aggregate filename under the approved run evidence path. Its semantic content must retain the run/attempt/assertion information above or link to immutable underlying records. Keep the original suite/story/date/duration/test metadata where useful, but document the actual record format/version and consumer compatibility rather than silently changing a producer schema.

Legacy files with only `passed`/`failed`, `tcId`, `acRef` and screenshot names may be posted as explicitly limited historical runner reports after validation. They lack sufficient proof of retries, expected status, collection completeness and full AC coverage. Never fill absent fields with plausible invented values; block semantic AC updates until sufficient evidence is supplied.

Provide `post-test-evidence` the exact run root, manifest, runner report, attempt inventory, sanitized capture index and AC/assertion matrix. Publishing must use its own approved mutation manifest; execution output does not authorize uploads or checkbox changes. Retain local evidence until dependent verification and agreed retention complete; no automatic cleanup.
