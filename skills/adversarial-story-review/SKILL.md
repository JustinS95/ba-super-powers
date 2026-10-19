---
name: adversarial-story-review
description: Challenge connected stories, features, tasks, decisions, hierarchy and dependencies for conflicting actors, access, record ownership, lifecycle, security and scope claims.
---

# Adversarial Story Review

## Purpose, activation and authority

Use for contradiction review of a story set, consequential refinements, cross-module behavior, legacy replacement, or dependency/hierarchy consistency. Review a connected specification rather than proofreading each story in isolation. Surface competing interpretations; never silently choose one or create new business rules to reconcile them.

Read [COMMON](../../references/COMMON.md) and, for project context/identities/hierarchy/tags, [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). Read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) before any ADO access; use supplied exports where adequate. Read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) if assessing claimed test proof. This is analysis, not authorization for edits, investigation on live systems, tests, moves or publishing.

## Inputs and proportionate clarification

Start with target stories and source versions, requested review depth, relevant project conventions and decisions, and available related artifacts. For local refinement preserve a baseline. Ask only for missing connected scope or authority that affects the conclusion. A single criterion can receive a compact local review; a shared access/data/lifecycle change needs connected comparisons. Do not require a universal entrypoint, registry, four empty matrices or a full-library scan for a tiny ask.

Record unavailable artifacts and incomplete exports. An inaccessible related story makes that boundary unreviewed, not consistent. Distinguish fact/source claim, inference, proposal and confirmed decision. Unknown matrix cells stay **Unknown**. Missing rules may be a specification gap rather than a contradiction.

## Workflow

1. **Define the review boundary.** Expand targets through immediate parents, relevant siblings, related/dependency-linked work, and shared actors, records, states, links or contracts. Cross feature/module boundaries when claims connect. List included sources, versions/locations, exclusions and unavailable scope. Resolve actual project hierarchy/path conventions; no mandatory phase layout.
2. **Inventory statements before reconciling.** Extract title/filename, Summary, Description, Business Value, AC, Tasks, Open Questions, metadata, features, spikes, decisions, ADRs and relevant project context. Preserve quotations or faithful summaries and file/line or equivalent stable locations.
3. **Classify contracts.** Separate business-visible behavior, binding public/external obligations, and internal engineering conventions. Cite authority/status for a binding contract. Internal routes, DTOs, envelopes, statuses or persistence can conflict across technical records without becoming mandatory ordinary AC. Technical tasks cannot expand approved behavior.
4. **Build applicable matrices below.** Use operation-level access rows and repeated-concept record rows; do not fill unknowns with plausible defaults. For irrelevant dimensions state why not applicable.
5. **Compare four levels.** Within a story; across same-feature stories; across connected features/modules; against approved project/contract decisions. Check reachable preconditions, shared ownership, scope and task parity. More detailed/newer wording is not automatically authoritative.
6. **Review hierarchy, dependency graph, phase and legacy parity.** Apply the specific checks below; do not equate parentage, association and sequencing.
7. **Present findings before edits** unless those exact changes are already authorized. Include severity, competing claims with provenance, impact, confidence/evidence limits, classification/owner and recommended resolution or investigation. Recommendations are proposals, not new rules.
8. **Ask decisions in dependency order.** Identity/ownership before lifecycle, lifecycle before UI, shared contracts before local wording. Use neutral options and explain consequences. Route observable existing-system facts to an authorized investigator rather than asking a stakeholder to guess them.
9. **Record and propagate confirmed decisions.** Produce a proposed change map for every affected story, task, parent feature, spike, question, title, filename, tag, location and relation. Apply only authorized edits. Preserve stable identities; do not normalize unrelated history. Remove superseded questions/blockers only when resolved by evidence.
10. **Re-review affected connections.** Refresh matrix rows/edges; search scoped artifacts for stale wording, unresolved copies, obsolete titles, duplicate coverage and prose/machine disagreements. Report checked versus unreviewed scope honestly.

## Actor and access matrix

| Story/source | Operation | Persona/capability | Actor policy | Record/tenant scope | Visible/protected fields | Allowed/denied outcome and feedback | Assignment effect | Binding contract if applicable |
|---|---|---|---|---|---|---|---|---|
| File:line | Named operation | Actor and outcome | Confirmed policy/Unknown | Boundary/Unknown | Fields | Prevented action, unchanged state where specified | Access/routing/notifications/none/Unknown | Source and necessary exact detail |

Keep organizational role, permission claim, tenant boundary, assignment, queue routing, notification routing and field visibility distinct. Assignment may route work without granting access. Role wording does not prove a permission. Review all supported operations, not just one row per story.

Permission administration covers confirmed identifiers, exclusions, assignability, intended scope and verified default-role propagation/migration need. Consuming stories own runtime authorization and observable denial. Do not infer Read for mutations or unconfirmed conjunctive/alternative claims; unsupported operations gain no scope. Do not infer migration requirements. Include exact routes/statuses only for a justified public/external contract or explicitly technical comparison, not as ordinary AC mandates.

## Record and source-of-truth matrix

| Field/concept | Canonical owner | Displaying/consuming entities | Snapshot/reference | Update operation | Allowed updater | Synchronization/precedence | Conflicting sources |
|---|---|---|---|---|---|---|---|
| Concept | Owner/Unknown | Entities | Rule/Unknown | Action | Policy | Rule/Unknown | File:line pairs |

Examine repeated identity fields, person versus organization-specific membership data, linked-record statuses, definition versus completed submission, and finalization versus temporary edit lock. Independent mutation on multiple entities needs an explicit synchronization, precedence or immutability rule; do not invent one. Preserve distinct records until a decision supports consolidation.

## State and lifecycle matrix

| Record | Initial state | Transitions/triggers | Terminal states | Archive/visibility | Lock/finalization | Queue entry/exit | Search inclusion | Reopen | Sources |
|---|---|---|---|---|---|---|---|---|---|
| Type | State/Unknown | Confirmed rules | States | Rule | Rule | Rules | Rule | Rule | Locations |

Check status spelling/meaning, linked-record propagation, archive effects, locks, queue/search membership and unreachable AC. A list that excludes future records cannot simultaneously verify future-record colors in that list under the same conditions. Different conditions may explain apparent conflict; check before declaring contradiction.

## Link and security matrix

| Workflow/source | Shared/recipient-specific | Link-bound identity | Authentication/verification | Reuse | Resume | Expiration | Revocation | Viewed event | Tracking level |
|---|---|---|---|---|---|---|---|---|---|
| Workflow | Mode/Unknown | Identity/anonymous/Unknown | Mechanism/Unknown | Rule | Rule | Rule | Rule | Definition | Send/recipient/Unknown |

Check that security/analytics claims are supportable by the identity model. A shared anonymous URL alone cannot reliably attribute Viewed to a particular recipient. Recipient tokens or verification are possible proposals, not automatic requirements. Do not invent expiry, single-use behavior or revocation policy.

## Hierarchy, identity and tags

Use the adopted canonical store, if any. In a UUID registry, `id` is immutable local identity; `ado.work_item_id`/URL are separate remote mappings. Parent is the immediate local parent's ID. Relations are local UUID lists under this adopted contract. Detect duplicate IDs, duplicate remote mappings, missing parents, hierarchy cycles, invalid type transitions and path collisions. Compare remote hierarchy only when a complete authorized snapshot is available. Approved legacy alias mappings are read compatibility, not migration permission. Plain stories need no fabricated UUIDs.

Review supplied exact tag policy on targeted files: preserve pre-edit tags, reject unapproved additions and case/spacing normalization; do not treat phase/feature/role slugs as tags. Report proposed corrections rather than auto-correcting or auditing untouched legacy neighbors. A phase/module map is authoritative only when supplied/approved; absent mappings remain decisions. Proposed moves must include parent/path metadata, duplicate destination coverage and affected relations, not just a filename move.

## Dependency graph mechanism

Use canonical notation: **A -> B means predecessor A must precede successor B**. Thus B `depends_on` A and A `blocks` B express the same directed edge. Reciprocal representations of that edge are consistent; B `blocks` A as well would introduce an opposite edge.

- Inventory nodes by stable identity. Extract edges from local `depends_on`/`blocks`, explicit prose prerequisites, task sequencing and available ADO predecessor/successor relations. Label each edge with its source and representation; do not invent remote direction mappings.
- Normalize into predecessor/successor pairs for analysis only, preserving provenance. Confirm a true delivery/verification prerequisite; non-blocking association belongs in `related`.
- Check reversed direction, duplicate representations, contradictory reciprocal edges, self edges, directed cycles (including longer cycles), dangling endpoints and prose/machine mismatch. The same edge represented twice is not a cycle; report redundancy only if it violates the adopted storage policy.
- Keep hierarchy independent: parent/child is not proof of a dependency. Flag hierarchy-as-dependency edges lacking a genuine prerequisite, not every legitimate parent-related prerequisite automatically.
- Report the cycle path or conflicting edge pair, source and impact, with a proposed canonical correction. Do not silently delete/flip relations. Mark graph completeness limited when related nodes are unavailable.

## Legacy, contract and task parity

Inventory relevant legacy pages, actions and navigation, then compare confirmed target scope. Separate templates/definitions, completed submissions and resulting operational records. Missing legacy behavior is a possible regression, not automatically approved retirement. Deferred decomposition remains a visible gap, not placeholder AC. Inspect only supplied evidence or separately authorized environments.

Compare public contracts with authoritative source versions; compare internal technical contracts in their technical records. Task actors, access, data scope and QA branches must match AC. Frontend/backend tasks must not retain rival security interpretations. A disputed story must not have tasks that silently select a disputed implementation. Renames/refinements require task and traceability review.

## Finding, decision and readiness outputs

Use a compact finding record or table:

```markdown
### F-01 — [Topic]
Severity: [Proposed critical/high/medium/low; rationale]
Sources: [Version and file:line or stable locations]
Competing claims: [A versus B, or known claim versus missing evidence]
Impact: [Access/data/lifecycle/security/scope/delivery consequence]
Classification and owner: [Decision/investigation owner; unresolved if unknown]
Recommended resolution: [Proposal, neutral options, or evidence needed]
Readiness: [Affected scope blocked/provisional/ready within reviewed scope]
```

Severity is impact-based advice unless project policy fixes it: potential serious unauthorized access/data loss or a core blocked outcome may be critical/high; wording ambiguity without behavioral impact may be lower. Do not fabricate release priorities.

Classify ownership as stakeholder/business decision, legacy application investigation, legacy data investigation, architecture/contract decision, design decision or internal implementation detail. Investigations specify the question, owner and required evidence; this skill does not perform unapproved live queries.

For each decision ask: affected sources and competing statements; why it matters; neutral options and consequences; owner; evidence required. Record:

| ID | Decision or precise investigation question | Classification | Owner | Affected artifacts | Evidence/reference | Status |
|---|---|---|---|---|---|---|
| D-01 | Confirmed rule or open question | Type | Role/Unknown | Sources | Decision source/date or evidence needed | Confirmed/proposed/pending |

Do not ask context-free “What does Viewed mean?” questions without connected usages.

## Completion checks and limits

Return review boundary, applicable matrices, graph findings, source-linked conflicts with impact/recommendations, decision register/change map, and readiness by affected scope. Confirm:

- Comparisons span all available connected claims, not only isolated files.
- Unknowns remain unknown; no inferred defaults or silently chosen authority.
- Actor/access, ownership, lifecycle and link contradictions are resolved or explicitly assigned; affected unresolved rules are not implementation-ready.
- Confirmed decisions and their obsolete alternatives/questions have been checked across affected artifacts.
- Hierarchy, dependency representations, tasks, tags and naming agree within reviewed scope.
- Re-review performed after actual changes is distinguished from proposed propagation or unavailable-source checks.

No universal “nothing may be saved” gate: an authorized provisional artifact may retain explicit unresolved decisions. Approval/publishing still requires actual authority and applicable mutation checks. A review cannot prove running-system behavior, security enforcement or test success from story text alone.

See [group regression scenarios](validation.md) for observable expected and failure behavior; these are not executed software tests.
