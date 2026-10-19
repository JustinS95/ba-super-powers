# Story and feature artifacts

These are body templates, not mandatory project metadata schemas. Adapt to an existing canonical format; placeholders are not accepted requirements.

## Story body

```markdown
# Summary
**As a** [confirmed actor],
**I want to** [capability],
**so that** [value].

[Brief context. Source/design reference with version and location.]

# Business Value
[Why the outcome matters; no invented metrics.]

# Acceptance Criteria
- [ ] 1. [Condition/trigger and observable outcome.]

# Tasks
[Only if adopted policy requires/enables tasks.]
- [ ] **[Task title]** (`[approved role or unassigned]`) - [Scope traced to AC.]

# Open Questions
[Only genuine unresolved items; decision owner and affected readiness.]

# Traceability
| Requirement/source | AC | Status/decision |
|---|---|---|
| [Reference] | [Criterion] | [Confirmed/provisional] |
```

Omit empty optional sections. A feature or Epic may use Summary, Business Value, Acceptance Criteria and Open Questions. Aggregate AC should describe confirmed capability outcomes; “all children complete” alone does not define business success or verification.

## Optional registry representation

When the project explicitly adopts the shared UUID registry, validate its actual schema before writing. The identity/relation shape is:

```yaml
id: <generated unique local UUID>
title: <plain title>
type: <approved local type>
parent: <immediate parent local UUID or valid root null>
related: []
depends_on: []
blocks: []
ado:
  work_item_id: null
  url: null
```

Angle-bracket values are illustrative, not valid persisted IDs. State, priority, estimate, owner, tags, dates and tasks depend on adopted policy; do not manufacture values. Example filenames are `_epic-<slug>.md`, `_feature-<slug>.md` and `<story-slug>.md`; paths follow confirmed hierarchy, not a fixed phase convention.

## Bounded examples

**Happy path:** Supplied REQ-1 says an authorized reviewer rejects a request, retaining a reason visible to authorized reviewers. Draft “Reject a request” with AC for that action, retained reason and authorized visibility. Cite REQ-1. Do not require a database column or invent reason length, mandatory validation or notification.

**Edge/refinement:** Existing story bundles submitting a request and independently searching past requests. Propose two behavioral slices if each has value; map every old AC and source to its new home. Do not turn these into frontend/backend stories. Keep a submit button's label with the submission interaction rather than creating a label story.

**Insufficient input:** “Admins manage requests.” Return a provisional capability outline; ask which operations, record scope and outcomes are intended. Do not invent CRUD permissions or deactivation emails. If no canonical store was supplied, allow chat drafting and mark existing-coverage comparison unavailable; ask for the store only when comparison/persistence requires it.

**Public contract exception:** Supplied public contract C-7 §4 explicitly requires a specific response status for a duplicate external reference. Include the exact obligation with that citation in the public API story; do not generalize it to ordinary internal workflow stories or add controller/repository details.
