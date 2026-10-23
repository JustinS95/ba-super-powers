---
name: writing-user-stories
description: Create or refine behavior-focused user stories, feature descriptions, acceptance criteria, and optional task handoffs with coverage checks and connected-scope review.
---

# Writing User Stories

## Purpose and activation

Use for new stories, meaning-preserving refinement, behavioral slicing, or turning supplied requirements/design findings into a coherent story set. Stories define independently verifiable business or application value, not internal construction instructions.

Read [COMMON](../../references/COMMON.md) first. Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) when project conventions, tags, ownership, hierarchy, or a canonical store apply. Before ADO access/publishing read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md); before GitHub access/publishing read [GITHUB_MUTATIONS](../../references/GITHUB_MUTATIONS.md). Drafting is not authorization for those actions. No mandatory entrypoint or discovery-skill chain applies.

## Inputs and clarification

Obtain the requested outcome, actors, supplied requirement/design sources and versions, scope/exclusions, and known decisions. For refinement, obtain the existing text and preserve its baseline. Resolve project glossary, phase/module ownership, public contracts, tags, task and hierarchy policies only where relevant. Design requirement objects may include a requirement ID, design URL, and identified components; retain these references.

Ask grouped, targeted questions when unknowns affect scope, rules, access, validation, or outcomes. Do not infer required fields, email/phone restrictions, duplicate handling, permissions, timing, pagination, or default role propagation. A design demonstrates visible content, not necessarily hidden business rules or every error state. Distinguish fact, assumption, proposal, and confirmed decision.

Unknown core behavior blocks readiness of the affected story, not unrelated work. Offer a clearly labeled provisional draft with known AC and scoped Open Questions. Never disguise a TODO or proposed rule as accepted AC. Tiny requests need only proportionate source review and local checks.

## Workflow

### 1. Establish coverage before adding scope

Read supplied sources and relevant approved project context. For an adopted canonical store, resolve its actual location and compare connected existing stories semantically, including Summary and AC. Do not scan an entire unrelated repository by default or create configuration to enable drafting. If coverage sources are unavailable, report coverage as **unknown**, not new.

Report each requirement with source/location and one classification:

| Result | Meaning | Action |
|---|---|---|
| Covered | Existing AC covers the supplied behavior | Cite the story/AC; do not duplicate |
| Gap | Existing story is the right home but misses specified behavior | Propose the exact additions; no unapproved edit |
| New | Compared scope contains no matching behavior | Draft a story |
| Unknown | Comparison evidence is incomplete | Name missing scope/evidence; draft provisionally if useful |

Example: `REQ-4 (brief §2) -> GAP in S-12, AC-2: propose retaining the confirmed rejection reason for authorized reviewers.` Do not turn unconfirmed behavior into a coverage gap.

### 2. Classify content and resolve grouping

Include actor, trigger, business rule, application action, resulting state/data, visible content, access boundary, feedback and failure outcomes where confirmed. Keep internal endpoints, DTOs, migrations, repositories, storage choices and layer splits in engineering artifacts. Exact routes, statuses or fields are allowed when necessary to a sourced public product contract or externally binding obligation; explain the obligation. This is not a ban on technical vocabulary.

Identify the project's actual hierarchy, if any. For an adopted `Epic -> Feature -> Story/Spike -> Task` hierarchy, each item identifies its immediate parent, never its grandparent. Do not invent an Epic or a second story just to populate a Feature. Write a feature's Summary, Business Value, aggregate acceptance outcomes and genuine Open Questions when requested or required by that store.

### 3. Draft coherent behavior slices

Use [templates and examples](templates.md). Give each story a plain title, `As a / I want to / so that`, brief context, Business Value and numbered checkbox AC. Link design/source references and map requirements to AC. Write every cross-reference (decisions, other stories and AC, data keys, review findings) as a link to its target with its meaning beside it, per COMMON's [resolvable references](../../references/COMMON.md#resolvable-references). Use [writing-acceptance-criteria](../writing-acceptance-criteria/SKILL.md) for criterion composition or deeper AC review when needed.

Sizing checks:

- A label, section heading, icon strip or button within a component is usually AC on the parent capability, not a separately valuable story. Ask whether it can be delivered and verified without its parent component.
- Consolidate repeated existence/label/behavior criteria about the same element without hiding independently testable branches.
- More than roughly ten AC triggers a consolidation/slicing review, not a mechanical cap or instruction to delete scope.
- Named subsections and multiple actors/actions are split signals. Split only where each resulting behavior is independently useful, deliverable and testable; do not split by UI/backend ownership by default.
- Keep steps that serve one coherent user task together. Multiple record states or actors do not alone prove separate value.
- A technical foundation without observable value is a task, spike, ADR or implementation record. An independently testable authorization-administration capability may be a story.
- Order core workflow before refinements. Validation, errors, edges and access restrictions belong with the behavior they qualify unless they independently justify another increment.

For refinement, preserve original meaning, source coverage, stable IDs and accepted boundaries. Present material scope changes separately as proposals, including what was removed, added, merged or split and why. Maintain source-to-replacement mapping for slices.

### 4. Keep authorization and ownership explicit

Consuming workflow AC owns allowed operations, accessible records, visible/protected data, denial, unchanged state and feedback as confirmed. Registration alone does not prove enforcement. Role, permission, tenant, assignment, work routing and notification routing are distinct.

Permission-administration scope uses only confirmed identifiers, exclusions, assignability and intended operations. Include propagation/migration only after existing behavior is verified. Read/create/update/delete are descriptive operation categories, not permission names. Do not add Read to a mutation merely because a UI reads first; confirm compound permissions. Unsupported operations gain no permissions, tasks or QA scope.

Use explicit approved team mappings for ownership; UI/API words do not determine a person's role. Unknown assignees remain unresolved or unassigned according to policy, not invented defaults.

### 5. Derive optional tasks

If the adopted task policy enables tasks (for example `story_format.use_tasks`), place `# Tasks` after AC using the project's syntax. Derive tasks from the approved behavior; do not mandate a frontend/backend pair. Include QA/peer review only as required or explicitly proposed. Peer review remains unassigned where that policy requires it. Technical tasks may document implementation choices separately but cannot add business scope or settle disputed behavior. Trace each task to AC; update task actors, authorization and QA boundaries after refinement.

### 6. Review, then offer the authorized handoff

Review local wording, testability, lean AC, source coverage and meaning preservation. For connected or consequential changes, use [adversarial-story-review](../adversarial-story-review/SKILL.md): applicable actor/access, record/source-of-truth, lifecycle and link/security rows, plus dependency and cross-module comparisons. Unresolved contradictions prevent readiness only for affected scope; report them before edits unless the exact edits were already authorized.

Propagate confirmed decisions to affected features, stories, tasks, questions and relations. Remove obsolete blockers only where evidence resolves them. Do not silently rename, move or normalize neighboring work.

Default output is a draft in the response. Local persistence needs authorized exact paths and the baseline/diff checks in COMMON; publishing is a separate action. If authorized, use existing canonical naming/layout, collision checks and approved schema. Preserve historical structure unless migration is explicitly approved. A policy validator is optional and must actually exist; shell use requires approval. Report checks actually run, not an imagined validator pass. No automatic branch, commit, merge or tracker handoff. For requested GitHub publication, use [github-story-publishing](../github-story-publishing/SKILL.md) to review the public payload and prepare the separately approved Issue/Project actions; do not use ADO identities or hierarchy assumptions.

## Canonical-store checks (conditional)

Follow PROJECT_CONTEXT, not an assumed universal registry. If the adopted store uses UUIDs, generate unique immutable local `id` values with an available standard generator and check uniqueness before persistence. Existing IDs survive renames/refinement. `ado.work_item_id` is a separate remote integer or null; local relation lists contain local UUIDs, not remote IDs. Resolve immediate parents, duplicate IDs/mappings, hierarchy cycles and dangling references. Read legacy aliases only through an approved compatibility map; reading does not authorize migration.

If exact tag policy exists, new tags use exact approved values. Snapshot modified tags and preserve their spelling, case and spacing; additions require approved values. Slugs, phases, modules and roles are not automatically tags. Do not normalize historical neighbors. Unknown metadata stays null/omitted as schema permits, not default medium priority, points or owner.

## Expected output and quality checks

Return coverage results, feature/story draft or scoped delta, requirement-to-AC trace, genuine questions with owners, review findings/readiness and optional authorized file/handoff details. Check:

- Behavior and business value are specific; public contract exceptions are sourced.
- All AC derives from evidence/confirmed decisions and has an observable test outcome.
- Every cross-reference links to its target, and nothing cites an artifact the audience can't open.
- No semantic loss, duplicate scope, assumed validation, permissions or metrics.
- Story slices, tasks, titles and relations agree; hierarchy is not dependency.
- Applicable connected review findings, unknown coverage and unavailable sources are visible.
- Destination, identity, tags and metadata follow adopted policy only.

This skill specifies requirements; it does not prove implementation, test execution or stakeholder approval. Missing evidence and unresolved policy remain limitations, not facts supplied by the author.
