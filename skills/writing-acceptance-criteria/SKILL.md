---
name: writing-acceptance-criteria
description: Write, review, or refine testable acceptance criteria with evidence-based behavioral coverage, authorization boundaries, and public-contract traceability.
---

# Writing Acceptance Criteria

## Purpose and activation

Use for composing or improving AC on a story, feature, configuration change, background process or public API obligation. AC defines what must be true, not how to build it. The core test is: **Can a tester derive setup, action and expected outcome from the criterion and its explicit references without inventing a rule?** Testability does not excuse contradiction with connected requirements.

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) for relevant project policy. Before ADO access/updates read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md). When evaluating test results or proposing checkbox changes read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Do not execute tests, check completion boxes, save or publish automatically.

## Required inputs and clarification

Use the story/capability, actor, confirmed requirements and source versions/locations, known decisions, relevant design/public contracts, and current AC baseline for refinement. Obtain applicable access, lifecycle and data scope where needed. Missing business rules become targeted questions or a clearly labeled incomplete draft, not invented “standard” validation. Scope blockers to the criteria that depend on them.

Separate facts, interpretations, proposals and confirmed decisions. If the only input is “loads quickly,” ask for an approved measurable threshold and conditions; do not invent five seconds. If a phone/email field is shown, do not assume numbers-only rules, mandatory entry or particular validation mechanics.

## Workflow

1. **Extract behavior and provenance.** Map source requirements to current/proposed criteria. On refinement preserve accepted meaning, stable references and baseline; identify proposed additions/removals separately.
2. **Classify statements.** Ordinary AC specifies actor, trigger, business rule, visible response, data/state outcome, access, feedback or failure. Internal routes, DTOs, repositories, migrations and fixed layer choices belong in engineering records. Exact technical details may be essential for a public product or externally mandated contract: cite source/version/location and why necessary. Do not erase binding technical obligations merely because they contain technical words.
3. **Choose a suitable pattern.** Prefer condition/action/outcome; static configuration need not force a trigger. Use the patterns below or the project's established Given/When/Then form.
4. **Check applicable coverage.** Use the coverage prompts below; mark each covered, not applicable with rationale, or unresolved with owner. These are questions, not permission to invent requirements or meet arbitrary criterion quotas.
5. **Consolidate carefully.** Merge repeated element/label/behavior detail, but retain distinct test branches and traceability. More than roughly ten AC triggers sizing review; split only into independently useful behavior with [writing-user-stories](../writing-user-stories/SKILL.md), never by layer or count alone.
6. **Compare consistency.** Check persona, description, tasks, source-of-truth, lifecycle and connected stories/contracts. Use [adversarial-story-review](../adversarial-story-review/SKILL.md) for connected or consequential changes. A local wording fix need not trigger an exhaustive chain.
7. **Return criteria and findings.** Include source-to-AC mapping, changed meaning (if any), coverage limitations and scoped questions. Unknowns are not ready AC. Authorized persistence follows COMMON; remote operations follow ADO_MUTATIONS.

## Formatting and patterns

For new Markdown drafts use sequential numbered unchecked criteria; preserve existing project format and checks on refinement. Never mark a criterion passed merely because it was written.

```markdown
- [ ] 1. When [precondition/action], [observable outcome].
- [ ] 2. [Actor] can/cannot [operation] when [condition], with [confirmed effect].
- [ ] 3. [Field/record] displays/retains [specified data] when [condition].
- [ ] 4. [Setting/picklist] includes [confirmed option] on [scoped location].
- [ ] 5. When [background event], the application [behavior] and [verifiable result].
```

These are alternative patterns, not five mandatory AC. Do not inject HTML checkbox controls. For ADO handoff preserve current field format; new content format depends on verified server/integration capability. Do not assume Markdown transport fields, or convert populated HTML without explicit approval. This skill does not prescribe a REST payload.

## Coverage prompts by behavior

| Behavior | Examine when relevant and confirmed |
|---|---|
| Read/display | Content/data, access and field visibility, empty state |
| Create/submit | Successful outcome, specified required/invalid inputs, feedback, duplicates/conflicts |
| Edit/update | Initial values, saved changes, cancel semantics, access |
| Delete/deactivate | Confirmed confirmation policy, resulting state, linked-record effects |
| Search/filter | Matching rules, no results, specified limits/sort/pagination |
| Configuration | Exact option and location, selection/retention behavior if in scope |
| Integration/background | Trigger, successful exchange/outcome, failure outcome, access/public contract |

Also consider boundaries, concurrency and time conditions only where relevant. A happy-path-only story warrants a coverage question, not automatically invented error behavior. No numeric minimum is evidence of completeness. Record missing approved requirements separately from merely unexplored scenarios.

## Authorization ownership

Consuming workflow criteria express actor, allowed operation, accessible records, protected data, denied action, unchanged state and feedback where confirmed. Role labels, permission claims, tenant scope, assignment, queue routing, notifications and field visibility are different concepts. Hiding a button alone does not establish prevention of an unauthorized operation.

An independently useful permission-administration story may cover exact confirmed identifiers, excluded operations, assignability and intended operation scope. Propagation/migration requires evidence of existing behavior. Registration does not prove runtime enforcement. Read/create/update/delete can describe operation categories, not invented permission names. Do not add Read to a mutation because the UI first reads; compound claims need confirmation. Unsupported operations receive no AC/tasks/permissions. Exact HTTP outcomes belong only where a sourced external/public obligation makes them necessary, or in a separately technical artifact.

## Good versus bad wording

The “better” examples below assume the supplied requirement confirms every stated behavior. They are not reusable business defaults.

| Weak/over-prescriptive | Better under the stated source |
|---|---|
| The form validates correctly | When the confirmed required date is omitted on submission, the application prevents submission and shows the message specified in design D-2 §3 |
| Admins manage users | An administrator can deactivate the account types named in policy P-1; the account then has the login restriction specified there |
| Add a rejectionReason database column | When a reviewer rejects a request, the reason is retained and visible to the authorized reviewers specified in REQ-4 |
| The record saves | After Save, the changed value is shown when the authorized user reopens the record, as required by REQ-6 |
| The picklist is updated | The Status field on the Request Edit form includes “Pending Approval,” as specified in REQ-8 |
| A PATCH without an internal claim returns 403 | A user outside the confirmed edit scope cannot save changes; the record remains unchanged and the specified denied feedback is shown |

Replace “correctly,” “properly,” “appropriately,” “as expected,” “handles errors,” “looks good” and “fast” with confirmed observable behavior or a precise approved reference. If specifics are unavailable, ask; do not manufacture thresholds or error copy. Existence-only AC is weak when it repeats a component title; describe confirmed content/behavior. Existence is appropriate when adding a static option is itself the requirement.

## Bounded walkthroughs

- **Happy path:** REQ-2 specifies the Priority option “Critical” on Request Edit. Write that exact scoped configuration AC; add saving behavior only if sourced. One complete static criterion is not invalid merely for being short.
- **Edge case:** A source specifies no-results feedback for search. Write the match/no-match branches with source trace; do not add pagination or fuzzy matching absent evidence.
- **Insufficient input:** “Viewer users cannot edit.” Ask which records/actions and denied experience are intended. A provisional restriction may quote the known boundary; do not invent permission names, HTTP responses or Delete scope.
- **Public contract:** A public API contract specifies a status and response field for a known failure. Retain both with source/version and testable preconditions, while excluding internal service/migration design.

## Completion and limitations

Check numbered/consistent formatting; each criterion's setup/outcome and source; no vague or unreachable expectations; lean independent branches; confirmed access and denied behavior; agreement with description/tasks/connected contracts; no hidden semantic changes; explicit unresolved coverage. Return only the requested depth plus significant findings.

AC is a requirements contract, not a test result. References must be available, linked to what they name (COMMON's [resolvable references](../../references/COMMON.md#resolvable-references)) and precise enough for a tester. If they are inaccessible or conflicting, report that limitation and withhold readiness only for affected scope. Checkbox satisfaction requires actual evidence mapped to the current criterion, not a generated test or screenshot alone.
