---
name: ado-ready-for-work-analysis
description: Use to assess selected intake items on an ADO board against confirmed readiness criteria and actual prerequisite availability, then propose an approved batch of exact board moves without treating dependency closure as sufficient readiness.
---

# ADO Ready for Work Analysis

## Purpose and prerequisites

Identify candidates to begin work from the project's confirmed intake placement, then propose promotion to its confirmed ready placement. Readiness is not release approval, assignment, scheduling or an automatic consequence of no open predecessors.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md). Use [ado-move-board-item](../ado-move-board-item/SKILL.md) for approved movement; it owns movement and dependent comments.

## Inputs and clarification

Require confirmed org/project/connection and read authorization, team/board IDs, approved area/iteration/ID/type scope, exact source/target placements, confirmed project definition of ready (DoR) and supporting evidence. Resolve actual board column/split-done/state mappings rather than assuming New, Ready, Closed or Done names.

Ask for missing source/target semantics, DoR, prerequisite availability or ownership of readiness decisions. Offer a dependency-status-only report if broader readiness policy is absent, clearly not a “ready” finding. No predecessor links means no dependency evidence, not proof of readiness; manual triage or configured independent-work criteria may establish readiness without predecessors.

Analysis is chat-only unless a report is requested. Approved moves/comments require durable mutation manifest/results and authorized destinations, not a disposable local success note.

## Workflow

1. **Resolve exact board/scope.** Discover selected team's boards, actual column identifiers/names, split sides/done fields, process type/state mappings and eligible intake items. Confirm exact area/iteration identifiers/full paths and descendant policy. No first-team/first-board selection or automatic config persistence.
2. **Fetch intake snapshot.** Retrieve only the confirmed source placement and approved types/scope, plus identity/revision, native description/AC/formats, directional relations and needed comments/evidence. Use complete paging/batching and reconcile exact expected/actual/missing/unexpected/duplicate IDs. A partially read candidate is unknown, not ready.
3. **Separate relation kinds.** Parent/child context is not a predecessor. Resolve actual dependency direction and relevant predecessor items; related links and AC references require confirmed causal interpretation, not automatic promotion/blocking. Detect cycles, missing targets, stale contradictory evidence and out-of-scope constraints.
4. **Check needed behavior, not names alone.** For each approved prerequisite identify the specific outcome/resource/access/environment required to begin this item. Compare current predecessor description/AC, evidence and comments against it. Configured terminal process state may support the check but never proves availability alone; a removed/abandoned item may not satisfy anything. An unfinished predecessor can only satisfy an available prerequisite when confirmed policy/evidence permits it, not by agent inference.
5. **Handle no predecessors explicitly.** Classify “no dependency evidence; broader readiness assessment/manual triage required.” Do not silently omit these items. If project DoR supports independent work, apply those confirmed criteria and record the decision; absence of a link itself still proves nothing.
6. **Apply nondependency readiness constraints.** Check the actual confirmed DoR, with source/version for each criterion. Possible discovery categories include testable agreed behavior/AC, unresolved scope decisions, required designs/data/access/environment, approvals, external constraints and ownership/capacity if that project's policy requires them. These are prompts, not universal business rules. Do not invent mandatory estimates/assignees/FE-BE roles, treat UI/API terms as ownership, or declare ready while known material blockers remain.
7. **Classify per item.** Use ready candidate (all required criteria evidenced), not ready (specific unmet criterion), or unknown/not evaluated (missing evidence/policy/partial read). Preserve no-predecessor counts and reasons. Record satisfied prerequisite evidence, remaining constraints, assumptions and decision owners; neither “all predecessors closed” nor a green test count is a readiness verdict.
8. **Present one no-write batch.** For each candidate show item ID/title/revision, current and exact proposed target column/side and any state effect, predecessor evidence, DoR criterion results and sources, confidence/limitations, exact proposed comment/mentions and approve/edit/skip options. Also summarize not-ready/unknown/no-predecessor items with reasons. No candidates means report findings and stop, not a silent successful promotion count.
9. **Execute approved entries only.** Save exact manifest with baselines, source/prerequisite revisions, metadata, move/comment operations, payload hashes, dependency keys and approval reference. Revalidate current evidence before writing; drift affecting readiness/target/payload stops for explicit rebase approval. Compose move skill with existing scoped authority and no secret handoff; its comment action follows verified movement. Skipped items get no action.
10. **Report actual outcomes.** Distinguish readiness analysis from verified moves and comments. Reconcile every planned action and no-action, unknown/unmet criteria, IDs/revisions, exact target placement, comment IDs/statuses, evidence and retained run paths. On partial failure retain results/recovery data; do not undo a verified move because its note failed or clean up by default.

## Expected output and checks

Return a scoped readiness matrix with source completeness, exact prerequisite/DoR evidence, no-predecessor handling, current/proposed placement and decision queue. After authorized execution return manifest-backed move/comment outcomes separately. Check board metadata, dependency direction, behavior availability, nondependency constraints, unknowns, exact unchanged batch authority, concurrency and honest statuses.

An approved comment can say: “Ready candidate verified against [DoR version]: [criteria/evidence]. Prerequisites available: [specific behaviors with item/evidence references]. [Exact approved decision].” Do not use “all predecessors complete, therefore ready” as boilerplate. Wording describing completed movement belongs only after movement verification.

## Examples and limitations

- **Happy path:** Every required predecessor capability is evidenced in the selected environment and all confirmed DoR criteria are satisfied. Propose exact ready placement and grounded comment, then move only approved items.
- **Edge case:** All predecessors have terminal states, but required test data/access is unavailable. Classify not ready under the confirmed DoR and show that constraint; no promotion. An item with no predecessor can be a candidate only through evidenced independent-work criteria, never merely link absence.
- **Insufficient input:** No DoR is provided and “Ready” maps to two columns/boards. Return dependency-status findings plus targeted policy/target questions; do not choose a board or claim readiness.

No universal readiness policy, process state taxonomy, environment availability, scheduling authority or runtime transport is bundled here. Missing evidence remains visible; analysis is not permission to move.
