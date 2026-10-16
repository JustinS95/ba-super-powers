---
name: ado-move-board-item
description: Use to execute an approved move of selected work items on an exact team board, with discovered column/done/state mappings, concurrency checks, verification, and optional separately tracked comments.
---

# ADO Move Board Item

## Purpose and prerequisites

Own physical card moves, directly or composed from blocker/readiness analysis. Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md). A board move is not an inference of business readiness, release authorization, or permission to change process state.

## Required inputs and clarification

Require confirmed organization/project/connection, team and board IDs, exact item IDs/types, current revision/placement, exact target column (including split doing/done intent if applicable), approved delta, durable manifest destination, and optional approved comment. Confirm item eligibility on this board; do not universally restrict moves to one hardcoded story type.

Discover missing boards/columns within approved read scope and ask the user to select among ambiguous choices. Search terms such as “Ready” or “Blocked” are hints, not exact targets. Reuse a composed caller's valid unchanged approval/metadata; do not request credentials or repeat the same gate. A new board, target, state effect or payload needs reapproval.

## Workflow

1. **Read actual team board metadata.** Discover boards, selected board details, column IDs/names, type/state mappings, split-column behavior, writable field/action mappings and restrictions. Do not assume a board named Stories, a first returned team, or project-wide WEF consistency.
2. **Disambiguate fields.** Match applicable writable Kanban column and optional done field to this exact team/board/type. Multiple `WEF_*_Kanban.Column` fields on one item may belong to different boards; never select the first name match. `System.BoardColumn` is a read projection, not a writable replacement. Validate tool capabilities against its real schema or documented operation.
3. **Capture baseline and no-write diff.** Fetch item identity/project/type/revision, actual board placement, process state, relevant fields/relations and protected material. Show target column ID/name, writable fields, split done value and any documented state effect. If the transport requires a state change, include its exact delta in approval; otherwise preserve state. Do not confuse split-column done with global completion.
4. **Plan distinct outcomes.** Record one move action per item, and optional comment actions depending on each verified move. Save immutable approved manifest and durable checkpoints even for one move. Comments are not automatically authorized by “move the card.” Preserve exact approved comment text and resolved mention identities.
5. **Execute guarded move.** Revalidate connection and item baseline. Use a supported revision/conditional update on the exact mapped fields or supported board action. For direct REST verify method/version/payload documentation; use the documented work-item patch media type when that mechanism is chosen. Do not send an unguarded guessed WEF patch.
6. **Re-fetch and verify board context.** Verify correct stable ID/type/project, target placement on the selected board, split done value, intended state/preserved state and captured protected fields/relations. A response echo or `System.BoardColumn` alone may be ambiguous across boards. If board projection is delayed, use bounded rechecks and remain unverified until supported evidence establishes placement. Failure/uncertainty blocks that move's comment.
7. **Post optional approved note.** Compose [comment-on-ado-item](../comment-on-ado-item/SKILL.md), Mode B, passing target, approved content, non-secret connection/identity provenance, manifest operation/dependency and approval reference. Never pass secrets in a handoff or reimplement comment mechanics. A failed comment does not undo a verified move.
8. **Checkpoint/report each outcome.** List exact item IDs, original/target board placement, resulting revision, move status and comment ID/status separately. Independent approved moves may proceed only if manifest dependencies and error policy permit; auth-context drift stops mutations. Resume re-verifies terminal placement/material before skipping, not merely an old ID.

## Checks, examples and limitations

Check exact metadata/target approval, field-to-board applicability, concurrency guard, state/column/done distinctions, preserved material, verified move-before-comment, durable results and no silent rollback/cleanup. Metadata can be reused within the same verified team/board/type/version context, not blindly across the project.

- **Happy path:** A batch approves three cards to an exact verified column with notes. Move/re-fetch each card; post its approved note only after verification. Report both outcomes per card.
- **Edge case:** An item has two WEF column fields. Resolve selected board metadata; if mapping cannot be proven, block rather than guessing. A comment timeout after a verified move is uncertain; reconcile the comment without repeating the move or blindly posting again.
- **Insufficient input:** “Move it to Done” with two boards and split columns requires selection of item, board, column/side and any state effect. Return a no-write proposal until resolved.

This skill cannot manufacture a missing writable mapping or concurrency capability. When unavailable, propose an exact manual action and verification checklist; do not claim execution.
