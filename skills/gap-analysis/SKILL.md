---
name: gap-analysis
description: Compare evidenced current state, approved future state, and requirements or story coverage to identify capability gaps, partial coverage, undocumented behavior and unresolved evidence.
---

# Gap Analysis

## Purpose and activation

Use for process deltas, current/future capability comparisons, requirements completeness, story coverage audits or legacy replacement parity. Keep three questions separate: **what the current system/process does**, **what the target requires**, and **what the documentation/stories cover**. A missing story is not proof of absent functionality.

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) for project scope, phase map, tags, hierarchy or canonical-store conventions. Read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) before any ADO access, and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) when using test results as proof. No automatic operational investigation, persistence or publishing follows from analysis.

## Inputs and clarification

Obtain analysis topic/boundary, the comparison dimension, current evidence (docs, process maps, transcripts, exports, observed behavior), target requirements with status/version, and relevant scope/exclusions or decisions. For coverage audits obtain the actual story/spec set and completeness limits. Read only relevant project context; use approved phase/module mappings rather than guessing.

If either state is unclear, ask focused questions or offer an explicitly provisional inventory. An undefined target prevents definitive gap conclusions, not useful documentation of what is known. Distinguish approved requirements from aspirations/proposals and inferences. Do not invent a target, metric, validation rule, access model or priority to fill the table.

## Workflow

1. **Bound and inventory sources.** Record versions/dates, scope, requirement IDs/locations, unavailable evidence and conflicts. Agree precedence or retain conflicting claims. A newer source is not automatically authoritative.
2. **Document current state.** List evidenced capabilities/process steps, actors, records, exceptions and known constraints. Distinguish observed behavior from documented claims and inference. “No evidence supplied” is not “does not exist.”
3. **Document target state.** List approved required outcomes and exact scope; separate proposals, explicit exclusions, public/external obligations and internal prerequisites. Do not interpret missing target text as approved retirement.
4. **Map each target item.** Compare semantically to current evidence and, separately, requirements/story/AC coverage. Use full, partial, absent-with-evidence, unknown or contradictory coverage; cite supporting locations and specific missing behaviors. Titles/keyword matches alone do not prove coverage.
5. **Classify and assess impact.** Use the types below. Distinguish capability absence, coverage/documentation absence and insufficient evidence. Propose priority with business/dependency rationale; use approved project definitions where supplied. Missing impact information stays unknown.
6. **Review connected scope.** Check actors/access, records, lifecycle, links, relevant legacy pages/actions/navigation, tasks and prerequisites where they affect conclusions. Use [adversarial-story-review](../adversarial-story-review/SKILL.md) for contradictions, not a mandatory chain for every small comparison. Preserve definition/submission/operational-record distinctions and source provenance.
7. **Present findings and proposed next steps.** Recommendations may accompany the first report, clearly labeled proposals. Stakeholders decide target scope/retirement/priorities; engineering may investigate existing facts or choose internal implementation. Do not “resolve” gaps by silently adding rules.
8. **Return the analysis.** Include no-gap results honestly. Default to response output. Save only at an authorized destination per COMMON; check existing canonical analysis and collision/version intent first. An explicit update uses a baseline and scoped diff; a distinct immutable analysis uses a collision-safe new version. Do not create duplicate shadow canonical stories or configuration to save one report.

## Gap types and next-step ownership

| Type | Evidence threshold / interpretation | Proposed next step |
|---|---|---|
| Missing capability | Approved target plus evidence that current behavior lacks it | Behavior story/BRD change with source trace |
| Partial capability | Current behavior meets only specified parts of target | Identify missing outcome precisely; amend appropriate artifact |
| Requirements/story coverage gap | Approved requirement missing/partial in reviewed documentation | Propose exact story/AC/BRD addition, not claim system absence |
| Undocumented behavior | Evidence shows current behavior but reviewed docs omit it | Confirm whether it belongs in target/documentation; not automatically a new story |
| Evidence gap | Current behavior or coverage cannot be established | Named investigation and required evidence; no definitive absence claim |
| Conflict | Sources disagree on behavior/scope | Decision/investigation with competing sources and impact |
| Scope/retirement question | Current capability is not included in approved future scope, or exclusion implications unclear | Confirm retention, migration/decommission and impacts; never silently retire |
| Engineering prerequisite | Internal delivery support is absent/undecided without a missing independent product outcome | Technical task, dependency, ADR or investigation linked to approved behavior |

An internal service, schema, repository, migration, DTO or endpoint is not automatically a user story. Recommend a story only for an independently verifiable actor capability, business rule, application outcome or binding public/external contract. Do not invent implementation architecture from a gap.

### Priority guidance

Use supplied policy first. Otherwise offer **proposed** Critical (evidenced go-live/core dependency blocker), High (significant evidenced business impact), Medium (completeness/improvement with deferrable impact) or Low (minor benefit). Cite impact and dependency assumptions; do not assign a sprint/phase or “must” deadline without authority. Criticality is not derived from the word “missing.” Unknown severity/priority is acceptable pending impact evidence.

## Output structure

Use this structure proportionately; do not fabricate a preparer's identity. If saving is authorized, `Gap_Analysis_<Topic>_<YYYYMMDD>.md` is a descriptive example, not a forced path or universal naming rule. Use the confirmed requirements category/initiative nesting only where established.

```markdown
# Gap Analysis — [Topic]
Date: [Analysis date]
Scope/comparison: [Process/capability/requirements coverage]
Status: [Draft/provisional/reviewed within specified evidence]

## Sources and limitations
[Version/location, authority, completeness, conflicts and exclusions.]

## Current State Summary
[Evidenced current facts; documented claims and inferences labeled.]

## Target State Summary
[Approved requirements separate from proposals and unresolved scope.]

## Coverage and Gap Summary
| Requirement/source | Current evidence | Story/spec evidence | Coverage | Gap/type | Impact | Proposed priority/next step |
|---|---|---|---|---|---|---|
| [ID/location] | [Source or unknown] | [Story/AC/location or unknown] | [Status] | [Specific delta] | [Rationale] | [Proposal] |

## Details
### G-01 — [Topic]
Current state and evidence: [Fact/claim/inference]
Target and authority: [Required outcome/source]
Missing or conflicting behavior: [Exact delta or evidence limitation]
Type and impact: [Classification/rationale]
Recommended next step: [Proposal and appropriate artifact]
Owner/evidence required: [Decision or investigation; unknown if unresolved]
Dependencies/decisions: [References and status]

## Open Questions and Decisions
[Scoped question, owner, affected readiness, confirmed decision reference.]
```

When no gaps are found, state: “No gaps were identified within [reviewed scope] against [target version] using [evidence/date]. [Evidence limitations]. Reassess when scope or evidence changes.” Do not assert universal completeness, invent gaps to populate a table, or force a file write. If all coverage is unknown, report insufficient evidence, not no gaps.

## Requirements coverage audit

For each in-scope area verify:

- Each stated requirement maps to actual behavior/AC evidence, not a matching title alone.
- Primary actors' confirmed workflows are represented; do not manufacture a story per role.
- Required error/exception paths, access boundaries and discovery-identified edge cases have exact AC homes, or are explicit gaps.
- Phase ownership/exclusions follow confirmed sources; uncovered legacy actions are visible parity questions.
- Covered requirements, missing documentation, absent capability and unreviewed evidence remain separate.
- Engineering prerequisites link to outcomes rather than masquerading as new business capabilities.

## Bounded examples

- **Happy path:** Target requires CSV and PDF export; current observed evidence confirms CSV only and an authorized capability inventory explicitly excludes PDF. Report a PDF capability gap with sources, impact question and proposed behavior story. Do not prescribe a rendering library.
- **Edge/coverage:** Current stories cover CSV; no runtime evidence was supplied about PDF. Report a PDF requirements-coverage gap if target requires it, and current capability **unknown**, not absent.
- **Undocumented:** Supplied observation shows queue refresh; target says nothing about it. Flag undocumented behavior/retention question, not automatic refresh AC or an invented interval.
- **Insufficient input:** “Compare our process to best practice” without an agreed target. Inventory current evidence and request target criteria; label suggestions as proposals, not compliance findings.

## Completion and limitations

Check target traceability, full/partial/unknown classifications, facts versus inference, source completeness, scope/retirement decisions, proportionate priority rationale and actionable owners/evidence. Return analysis, proposed next steps, unresolved decisions, actual writes/checks if any, and limitations. This skill neither proves functionality from documentation nor authorizes remediation. See [group scenarios](../adversarial-story-review/validation.md) for manual regression prompts, not executed tests.
