---
name: ado-board-blocker-analysis
description: Use to analyze active and blocked items on a selected ADO board for behavior-grounded block or unblock proposals, including dependency evidence, partial-work checks, and approved batch handoff to move/comment skills.
---

# ADO Board Blocker Analysis

## Purpose and prerequisites

Analyze a bounded snapshot for work that cannot proceed or whose original impediment may be resolved. Produce proposals first, not automatic board maintenance. A blocker must identify unavailable behavior/outcome or an approved prerequisite; technical evidence may diagnose it without inventing a FE/BE story split or ownership.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md). Compose [ado-move-board-item](../ado-move-board-item/SKILL.md) only for approved moves; it owns physical movement and composes the comment skill. No mandatory routing or unrelated skill chain.

## Inputs and clarification

Require confirmed org/project/connection/read authorization, team/board, exact area/iteration/ID scope, eligible work-item types and active/blocked placement definitions, project blocker policy and current evidence. Ask for ambiguous board/column semantics or scope before querying/moving. Discover actual board/columns, process states and split-column done mapping; “Blocked” is a semantic role to confirm, not a hardcoded state or column name. Missing team/board configuration may be discovered within approved read scope but is not automatically persisted.

Analysis is chat-only unless a durable report is requested. Execution requires an authorized durable manifest/results folder even when moves/comments are otherwise remote-only.

## Workflow

1. **Resolve metadata and scope.** Select the actual team/board and type/area/iteration bounds using exact identifiers/full paths and supported schemas. Identify active candidates not currently in the confirmed blocker placement (Set A) and currently blocked candidates (Set B), using configured state/column eligibility, not hardcoded Active/In Progress/Done names.
2. **Read complete evidence.** Retrieve fields, native formats, revisions, directional relations and paginated comments for both sets. Fetch relevant predecessor/related/reference targets' current fields, behavior/AC, state/placement, evidence and comments within approved scope. Reconcile exact expected/returned/missing/unexpected/duplicate IDs and comment coverage. Unknown/inaccessible evidence is not clear/unblocked; partial snapshots get explicit limited findings.
3. **Separate hierarchy from dependencies.** Parent/child links provide immediate-parent context only. Determine predecessor/successor direction from actual relation metadata; do not treat every link/reference as blocking. Related links require causal evidence; neither related nor hierarchy alone proves a prerequisite.
4. **Evaluate all five signal classes.** Use the priority order below to select a primary signal, but retain corroboration, contradictions and other unresolved blockers. Do not stop investigation at the first keyword or incomplete predecessor state.
5. **Apply the partial-work test to every proposed block.** Identify which approved outcomes/tasks can still be implemented, tested or otherwise progressed independently. Under the default proposal rule, if meaningful work remains possible, classify as partially impeded FYI, not a full Blocked move. If a confirmed project blocker policy differs, show that policy and the differing classification explicitly. Unknown workability is a question, not a confident full block.
6. **Evaluate Set B against original blockers.** Reconstruct every original blocking condition, current approved prerequisite and evidence. A terminal predecessor name, done flag, merged/deployed comment or one resolved condition does not prove the required behavior is available in the relevant environment or that all blockers are resolved. Match completed work to the specific needed outcome/prerequisite; read current contradictory comments and remaining nondependency constraints. If original cause or current availability cannot be established, propose investigation rather than a move.
7. **Present one batch.** Separate proposed moves into blocker placement, proposed moves out (exact selected target), partial-impediment FYIs and unknown/no-action items. Include item IDs/revisions/placement, signal/evidence references, unavailable behavior, partial-work result, original/remaining blockers, confidence, exact target column/side/state effects and exact proposed comment/mention payload. Let the user approve/edit/skip entries; no action for skipped/FYI items.
8. **Execute only approved deltas through move skill.** Build durable manifest with move/comment entries and dependencies, exact targets, payload hashes, baselines and approval reference. Revalidate source/item/dependency evidence and metadata before execution; changed material/target/risk requires rebase/reapproval. Pass unchanged authority to the move skill rather than asking repeatedly. Comment only after verified move; do not implement movement or posting inline here.
9. **Reconcile results.** Return proposal/skipped/unknown counts separately from verified moves/comments, with exact IDs/status/evidence and remaining decisions. Partial/uncertain actions remain explicit; no rollback or recursive cleanup. Retain manifests/results/recovery data, not just a success count.

## Five-signal hierarchy

| Priority | Evidence to examine | Required causal check |
|---|---|---|
| 1. Explicit predecessor | Approved dependency relation, current predecessor behavior/AC/evidence and state | Which needed prerequisite is unavailable now? Incomplete state alone is insufficient if prerequisite is already usable; terminal state alone cannot unblock |
| 2. Related work impediment | Related item blocked/abandoned/removed or unavailable | Does this actually prevent the dependent outcome? A bad related state is not sufficient |
| 3. AC/source reference | Exact item IDs or uniquely resolved capability references in approved AC | Is the reference a required unavailable prerequisite, or context/example? Ambiguous feature names need confirmation |
| 4. Comment-based signal | Author/time/comment ID and full context for “waiting on,” “blocked by,” “cannot proceed,” etc. | Is it current, unnegated and unresolved, and does it prevent all meaningful progress? Keywords alone are hints |
| 5. Testing/workability inference | Evidence that approved work/testing requires a capability/environment not available | Label inference and confidence; do not invent dependency or behavior. Independent implementation/testing makes it partial, not full block |

## Confidence and output template

High confidence needs current direct evidence of the specific unavailable/now-available prerequisite with complete relevant coverage. Medium means corroborated but incomplete availability evidence; low means ambiguous/inferred signal. Confidence is not approval, and terminal state alone never supplies high confidence. Unknown contradictory evidence should remain unresolved rather than hidden by a score.

For each proposal include: `item ID/title/revision; current -> exact target placement; primary/corroborating signals; source IDs/versions; behavior/prerequisite; partial-work test; all remaining blockers; confidence/limitations; exact comment; approve/edit/skip`. A comment may state “Moved to [exact column] — [verified reason] / Blocked by / Expected resolution” or “Moved out of [column] — [specific original cause resolved] / Evidence / Remaining constraints.” Approval must cover actual wording and any notifications; do not claim a move before it verifies.

## Checks, examples and limits

Check all five signals, hierarchy exclusion, current causal evidence, partial-work tests for all block candidates, specific behavior verification for unblocks, all remaining blockers, exact board metadata/targets, source completeness, batch authority and distinct comment results.

- **Happy path:** All approved outcomes depend on an unavailable certified dataset. Current evidence confirms no independent work remains; propose exact blocker placement and note expected resolution. When dataset availability is demonstrated, check other constraints before proposing a specific exit placement.
- **Edge case:** A predecessor is closed but its required capability is not deployed to the approved environment. Keep the dependent blocked/unknown; do not unblock from the state name. A comment blocks only one of several independent ACs: record partial impediment without a Blocked move.
- **Insufficient input:** Blocked items have no recorded original blocker and linked comments are inaccessible. Report missing evidence and investigation questions, not a full-board clean bill or automatic unblock.

The skill proposes workflow decisions; it cannot infer environment availability, ownership, business rules or project state semantics absent evidence. Analysis approval alone is not write approval.
