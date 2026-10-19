# Project board walkthroughs

Hypothetical data only; names are not required team conventions or fixed GitHub options.

| Input | Expected workflow/output |
|---|---|
| Read selected Project with verified Issue-backed items, PR, draft, one redacted item and paginated field values | Return bounded snapshot with separate item/content IDs and object kinds, Issue state separate from Status, redaction/completeness disclosed; no writes. |
| One Issue-backed item's discovered Status A -> B is approved, narrow baseline unchanged, race accepted and durable paths confirmed | Save attempt, assign only discovered field/option, re-fetch Project/item/Issue identity and Status B, record verified observation. Do not close Issue even if B is named Done. |
| Current Status is already intended B | Reverify and report no-op/skipped_reverified, no mutation call. |
| Approved A -> B; immediate preflight observes C | Stop affected boundary, show A/current C/intended B; ask for rebase approval. No “last writer wins” overwrite disguised as concurrency safety. |
| Baseline unchanged but user requires atomic prevention of concurrent updates | Block write: pre-read is not CAS. Offer no-write plan/manual coordination, without promising a lock. |
| Publishing add returns an item whose automation-set Status is C but approved initial baseline was unset | Checkpoint successful membership, block Status assignment for review; no rollback or recreation. |
| Update times out; read-back observes B | Record recovered observed B with attribution uncertainty. If read-back observes C, stop for conflict review rather than retry/undo. |
| User requests “move #23 to In Progress” without host/repository/Project; two options have similar names | Ask for exact target and intended existing field/option mapping. Issue numbers alone are repository-relative; no first-result choice or new option creation. |
| Option is removed or item archived after approval | Stop; fresh metadata/target review required. Never silently substitute option or unarchive. |

Quality check: every proposed write must identify one exact Issue-backed Project item, one existing single-select Status field, one existing option, its approved old value, durable recovery records and explicit residual-race decision. A complete first page is not necessarily a complete collection.
