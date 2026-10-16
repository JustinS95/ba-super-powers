---
name: synthesize-requirements
description: Use when turning work items, meeting notes, transcripts, designs, or existing documents into a traceable desired-state requirements document organized by functional area.
---

# Synthesize Requirements

Transform mixed source material into a coherent description of desired behavior. The result is not a retelling of individual stories: readers should understand the supported end state while retaining source-level provenance, conflicts, and unresolved decisions.

## Shared contracts and inputs

Read [COMMON.md](../../references/COMMON.md) and [PROJECT_CONTEXT.md](../../references/PROJECT_CONTEXT.md). Before any authorized ADO access, also read [ADO_MUTATIONS.md](../../references/ADO_MUTATIONS.md); source analysis alone is not fetch or mutation authorization.

Inputs: at least one substantive source (work-item export, transcript, notes, document, design evidence, or user description), scope, and intended use/audience. Ask for missing source instead of synthesizing from memory. For unknown audience/purpose, ask if it changes correctness or framing; otherwise state a reasonable presentation assumption and offer a provisional draft. Do not demand configuration files for standalone writing.

## Statement classification

Classify substantive source statements before synthesis; split mixed statements rather than treating technical language as an approved requirement.

| Classification | Treatment |
|---|---|
| Business requirement / application behavior | Include supported actor capabilities, rules, feedback and outcomes |
| Observable/verifiable business-state outcome | Include the externally testable outcome, not an assumed mechanism |
| Mandated external integration contract / public API product surface | Include necessary exact contract details only with authoritative version/location and requirement traceability |
| Internal implementation detail / engineering convention | Exclude from desired-state requirements by default; retain classified provenance or engineering follow-up |
| Investigation / unresolved internal design | Track as investigation; do not block otherwise settled behavior |
| Proposal / ambiguous implication / conflicting statement | Mark unconfirmed; preserve alternatives and decision needed |

Routes, payloads, DTOs, HTTP statuses, schemas, migrations, repositories, services, and storage mechanisms are not business requirements merely because they occur in a task or acceptance criterion. Conversely, do not erase a required public contract just because it is technical. Identify the authority that makes it binding.

## Workflow

### 1. Establish purpose and scope

Identify system/feature, audience (team reference, stakeholder review, audit, onboarding), current versus desired state, and source boundaries. Resolve optional glossary, confirmed exclusions, stakeholder roles, and phase/module context from selected project documents. Preserve source facts separately from presentation assumptions.

### 2. Inventory before synthesizing

Create a source inventory: stable source reference, type/title, version/date, supplied path/URL, completeness, relevant sections/IDs, scope and authority/approval status. Record retrieval errors and missing fields; do not pretend an incomplete export covers the whole backlog.

For work items, retain actual type, state, stable local/remote identities when present, revision, and immediate-parent relations. Follow the project's actual hierarchy, not an assumed universal Epic/Feature/Story tree or historical phase policy. Keep parent-child, related, and dependency links distinct. Flag missing parents and cycles without fabricating ancestors. Preserve adopted schemas/legacy mappings read-only unless migration is explicitly approved.

For each substantive statement, record its locator, classification, interpretation, and destination requirement/open item/context entry. This inventory supports reconciliation of items not promoted to requirements.

### 3. Synthesize by functional area

Group across sources into areas such as state transitions, notifications, access boundaries, or data inputs. Preserve hierarchy as context, not the document's primary organization. Combine equivalent requirements without losing their multiple source references; separate superficially similar rules with different actors or conditions.

Write stable requirement references with actors, triggering conditions, supported behavior, observable result/feedback, and exceptions where specified. Use matrices for action/availability/effect and permissions, bullets for transition rules, and prose for context. Avoid vague “appropriate,” “fast,” or “secure” claims unless defined by a sourced measurable criterion; flag absent definitions instead of inventing targets.

### 4. Draft and reconcile

Use the default output below, adapting to a requested document standard. Classify technical content before inclusion. Reconcile every significant source statement to a requirement, explicit exclusion, internal-design context, duplicate mapping, or open item. An unsupported implication is not implementation-ready behavior.

### 5. Surface open items and risks

List conflicts, incomplete items, unresolved decisions, ungrouped material, migration/integration/dependency concerns, and engineering investigations. Identify confirmation needed and known owner, or TBD. Never silently prefer the newest/detailed source absent an agreed precedence rule. This is source synthesis, not an unsolicited full gap analysis; optional recommendations remain separate.

### 6. Deliver or update

For a standalone file, resolve the confirmed requirements category and exact destination under COMMON. Select/read an existing canonical document before a requested update; preserve unaffected sections, stable references, and change history. New information does not itself authorize overwriting an arbitrary prior document. Save only the requested BRD when synthesis is intermediate to it.

## Default output structure

**Header:** title, document date, source/coverage summary, scope, intended audience/purpose, Draft/Provisional/approved status as evidenced, and author only if supplied. Document date is not source date or approval date.

1. **Executive Summary**: 2-3 sourced sentences explaining the problem, actors, and supported desired end state, not a list of story titles.
2. **Scope**: In Scope; Out of Scope limited to explicit exclusions. If none are documented, say so, rather than implying everything else is excluded.
3. **User Roles and Personas**: source-supported roles and their context; no invented permission inheritance.
4. **Desired State**: numbered functional areas; stable requirement references, observable rules and outcomes, tables/bullets as useful. Unknown business behavior remains visibly unresolved.
5. **Orphaned / Ungrouped Items** (if any): source, item, missing parent or grouping issue, impact. Missing hierarchy does not necessarily prevent functional grouping; record these as separate issues.
6. **Traceability and Source Inventory**: include or link the inventory; map requirement references/areas to exact source IDs/version/locators and decision status. Retain classified material not promoted to requirements with its disposition.
7. **Open Items and Risks** (if any): item, conflicting/absent detail and source, impact, required decision/recommended action, confirmed owner or TBD.

## Updating an existing document

1. Read the selected baseline in full and inventory new/changed/withdrawn source material.
2. Identify affected functional areas; show proposed requirement, traceability, and open-item changes proportionately.
3. Apply only the authorized update, preserving unrelated content and stable IDs. Do not remove historical provenance silently when a rule is superseded; record its replacement/status in the chosen history convention.
4. Update source coverage and last-updated note accurately. Do not mark an open item resolved without evidence.
5. Keep the selected canonical path; ask before a material rename or scope split. Report exact saved path and remaining conflicts.

## Examples and quality checks

- **Happy path:** two sources describe the same submission rule and confirmation message. Combine under “Submission,” map both sources, and retain their qualifiers; do not repeat whole stories.
- **Mixed technical source:** “Store in table X and show Submitted.” Retain “show Submitted” as behavior, table X as internal context unless an authoritative external contract requires it.
- **Conflict:** one document permits reviewers to edit, another forbids it. Record both locators and the decision needed; do not manufacture a compromise role.
- **Insufficient source:** a title “Improve validation” provides no rule. Include a definition gap, not invented field lengths or error text.

Check inventory completeness, functional grouping, testable language, source-level traceability, classification, exclusions, actual hierarchy, unresolved decisions, destination/collisions, and absence of invented rules. Approval, deployment, and test execution are not established by this document. See [validation.md](validation.md) for proposed bounded trials and authoring-check status.
