---
name: ado-estimate
description: Use to propose calibrated story estimates or approved child-task effort for selected ADO/local items, explain uncertainty, and apply only team-confirmed field or file changes with baseline verification.
---

# ADO Estimate

## Purpose and activation

Support single-item requests such as “estimate #123,” an explicit batch, or a bounded “my open stories” selection. Produce an AI heuristic for team discussion, not a commitment or universal conversion of points to hours. Story sizing and task effort are separate measures.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md). Estimation uses the same approved transport, metadata discovery, concurrency, manifests and verification as every ADO action; there is no separate CLI/auth exception.

## Inputs and clarification

- Exact IDs or approved query bounds, source content/revisions, hierarchy context, existing estimates and selection/exclusion policy.
- Team's estimation unit, allowed scale, reference items with known estimates and comparable delivery context, rounding/rollup policy and applicable type-to-field mappings.
- For task hours: actual approved tasks with stable identity/immediate parent, scope, team's effort units and estimation conventions. Resolve canonical file/schema only if local input/writeback is requested; a registry is not mandatory for live sizing.
- For applying: exact fields/paths, baseline revisions/hashes, team/user confirmation and authorized durable run destination.

Ask for missing scale or calibration, not a fabricated point value. Offer a qualitative relative-size/uncertainty draft when calibration is absent. Empty title/description/AC is insufficient evidence, not automatically one point. “Me” requires exact confirmed identity/account scope, not a display-name guess or automatic `.env` edit.

## Workflow

1. **Select and reconcile.** For named IDs use those stable IDs, including `ado.work_item_id` when present in a configured registry. Never title-query a replacement for a mapped ID. For “my open items,” resolve the exact identity using PROJECT_CONTEXT, query only the confirmed scope and configured eligible states/types. State, team-board column and split-column done flag are different signals; use project eligibility rules, not hardcoded terminal names or “done flag always means done.” Show excluded/ambiguous items and why. Paginate and reconcile expected/detail IDs before sizing.
2. **Read full evidence.** Retrieve description, AC, native formats, current size, task/dependency context, revisions and reference-item content. Preserve original wording. Note ambiguity, missing criteria, partial snapshots and current estimates rather than overwriting their provenance.
3. **Calibrate by type.** Apply configured policy: story-like items may use relative points; task effort may use hours/days; feature/epic sizing may be prohibited, independent or rollup-only. Do not hardcode a hierarchy or field such as StoryPoints. Resolve exact editable numeric field/type/unit before an apply proposal. A rollup is a report unless the team explicitly approves a rollup write; avoid parent/child double counting.
4. **Estimate behavior scope.** Compare with approved reference items: workflows/outcomes, roles/access boundaries, validations, failure/empty/edge cases, lifecycle/state combinations, dependencies, testing effort and uncertainty. Internal endpoint/DTO counts or UI/API wording do not determine business size or FE/BE ownership. Technical detail is valid for an approved technical task or traceable public contract, not a reason to invent tasks.
5. **Explain uncertainty.** Give proposed scale value or interval, comparable references, assumptions, confidence and unresolved decisions. Where team policy separates base and contingency, show both and the policy; otherwise describe uncertainty without mandatory numeric buffers. Never impose point=hour, fixed QA percentages, universal half-hour rounding, peer-review defaults or automatic extra points for ambiguity. Suggest splitting only as a proposal grounded in independent outcomes.
6. **Present reasoning before summary.** Show every selected item with current value, proposed value/unit/field, source revision, scope factors, calibration and confidence; then a summary table. Label totals by compatible unit; do not add points and hours. Team confirmation may adjust or reject values. Revise only affected entries and obtain approval for their changed delta; reuse unchanged batch authority.
7. **Estimate approved child tasks only when requested.** Read the actual bounded Tasks section/structured child records outside fenced examples, honoring the existing schema. Match by stable child identity within immediate parent; role labels alone are not unique. Independently assess QA/review effort unless an explicit team policy says otherwise. Do not invent FE, BE, QA or peer-review tasks. Story and task estimates can be reviewed together without a ritual second gate; each write must still be explicit.
8. **Apply only approved deltas.** Create the durable manifest for remote fields and/or local task-hour changes as distinct actions, with baselines and operation keys. Recheck revisions/local hashes; conditional update exact approved fields only. Local updates use structural parsing, preserve checkboxes/text/frontmatter/unrelated hours and schema, write atomically and re-read. No regex-by-role bulk replacement or automatic downstream push. On drift stop/rebase with approval.
9. **Verify and reconcile.** Re-fetch exact numeric value/unit/field, item identity/revision and protected material, or re-read exact local task mapping and hash. Record each result, exclusions, conflicts, uncertain/partial outcomes and retained paths. Do not claim “N updated” based only on accepted API requests.

## Output and quality checks

Return reasoned estimate blocks, summary, evidence/reference provenance, confidence, decisions needed, exclusions and an exact no-write apply diff. After authorized execution add manifest-backed per-action verification. Confirm source completeness, compatible scale, task identity, no invented policy/tasks, explicit team confirmation and preservation of all non-estimate content.

## Examples and limits

- **Happy path:** Team uses a confirmed relative scale and a five-point reference. A comparable story with fewer role branches is proposed at three points, medium confidence because one error outcome is unresolved. Approval covers only that story's discovered sizing field; task hours remain unchanged.
- **Edge case:** Two QA tasks share a role label. Resolve their distinct stable task IDs; do not update both from a single role match. A closed task's editable effort fields depend on process metadata, not a built-in company-specific exception.
- **Insufficient input:** A blank story without references is “not estimable”; request behavior/AC and scale, or offer qualitative scope questions. Do not silently assign one point or hours.

AI estimates are heuristic, not empirical team velocity, delivery dates or staffing commitments. No runtime tool capability, project scale or calibration is bundled into this skill.
