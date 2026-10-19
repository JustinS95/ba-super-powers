# Static evidence-mode scenarios

Hypothetical inputs and expected decisions, not executed tests. Review with [SKILL.md](SKILL.md), [publication-grade record](evidence-record.md), [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) and [consumer scenarios](../post-test-evidence/validation.md).

| Input | Expected decision |
|---|---|
| Ordinary request adds Archive tests to an established suite with approved fixtures, auth, selectors and installed-version conventions | Project-native default. Add meaningful observable assertions and design traceability using existing specs/reporters/traces/attachments/retries/failure diagnostics. No new semantic record, reporter, aggregation or helper required. Return generated/not run. |
| Native report identifies run, inventory, raw statuses, retries and attachments; user wants those runner facts summarized | Native evidence is sufficient for those supported claims. Preserve original provenance and limitations; publication intent alone does not require rich capture. No AC conclusion implied. |
| Same report lacks runtime assertion/AC mapping; request is to certify every compound AC and check boxes | Evidence is insufficient for that claim. Publication-grade capture/mapping needed; inspect whether existing native output plus exact code/assertion provenance fills gaps before adding instrumentation. No inferred AC success or automatic rerun. |
| User explicitly requests publication-grade per-attempt AC evidence before generation | Plan exact AC obligations, assertions and versioned sources, every attempt and safe capture lifecycle. Reuse sufficient native output; add only missing capture/aggregation using verified APIs. No execution/publication authority. |
| User wants only a comment saying what the native report recorded, with no checkbox claim | Qualified summary may proceed through post-test-evidence approval/verification. Disclose missing semantic mappings; do not demand full schema or invent mappings. |
| Historical report has six passed, zero failed, no retry/assertion/completeness data | Attribute counts to that report, retain originals and label limits. No clean-first-attempt/full AC claim, retroactive records or reconstruction from titles/counts/screenshots. Future run/capture needs separate approval. |
| Publication-grade run uses multiple workers, worker restart and failure then successful retry | Preserve native exit/results and every attempt; isolate collision-safe attempt/repeat/project keys and durable writes. Any needed aggregation happens after workers stop, reconciles inventory and marks missing data unknown. No worker-local shared array or retry overwrite; eventual success is flaky. |
| Capture fails, page closes, or rich data is absent; authoring was approved but no run/posting was approved | Keep failure/native diagnostics and report capture gap. Do not suppress failures, run/rerun, upload, comment, check AC, move state or clean evidence. Propose scoped next action only. |

## Review boundaries

Check frontmatter, local links, mode/claim consistency and preserved auth/selector/fixture/runtime safety mechanically when authorized. These walkthroughs establish instruction consistency only; automated checker, host loading, typechecking, runner capture and ADO integration remain unexecuted unless separately evidenced.
