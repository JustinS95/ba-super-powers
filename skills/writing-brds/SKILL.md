---
name: writing-brds
description: Use when producing or updating a Business Requirements Document with business objectives, scope, functional and non-functional requirements, traceability, constraints, and decisions.
---

# Writing BRDs

Produce a formal business requirements artifact that explains what is needed, why, for whom, and under which constraints. Support business sponsors, product owners, delivery teams, QA, compliance, and other stated audiences; do not assume every BRD is only for developers. A draft becomes authoritative only through the project's actual approval process.

## Contracts and required inputs

Read [COMMON.md](../../references/COMMON.md) and [PROJECT_CONTEXT.md](../../references/PROJECT_CONTEXT.md). Use [synthesize-requirements](../synthesize-requirements/SKILL.md) when substantial source extraction/grouping is needed; reuse already sound synthesized content rather than redoing it or creating a second document for format alone. Any authorized ADO access also requires [ADO_MUTATIONS.md](../../references/ADO_MUTATIONS.md).

Inputs: initiative/feature scope, substantive source material, intended audience/purpose, and any selected BRD template or baseline. Sources may be transcripts, work items, designs, prior requirements, or user descriptions. Assess missing objective, users, boundaries, constraints, and authority before writing. Ask targeted questions for load-bearing gaps; honor requests for provisional drafts by exposing unknowns. With no source, request it or provide a clearly empty template, not invented business context.

## Workflow

1. **Assess sources**: inventory source type, title/ID, version/location, completeness and approval status. Resolve selected glossary/context without assuming optional project configuration exists.
2. **Establish framing**: identify business problem, source-supported outcome, audience, scope, stakeholders and actual decision authority. Measurable targets require sources; do not invent ROI, dates, service levels, or compliance obligations.
3. **Organize requirements**: reuse or synthesize functional areas. Retain stable requirement references, conditions, observable outcomes, known exception/access boundaries, classification and provenance. Keep internal architecture separate; exact external/public contracts require authoritative references.
4. **Draft** using the structure below or the user's formal standard. Keep the functional core once; reference it from summaries and traceability rather than duplicating entire requirements.
5. **Review decisions and open items**: carry forward source conflicts and synthesis risks. Identify which assumptions need confirmation before implementation and which are harmless framing choices. Owners/priorities remain TBD unless confirmed, or explicitly proposed.
6. **Deliver/update**: state draft/partial status and coverage. For an authorized canonical update read the baseline and change only affected content, traceability and decisions. Save only requested artifacts under COMMON; intermediate synthesis does not require its own file.

## Default BRD structure

Use these sections as a substantive default, adapting to audience/template rather than adding empty sections or duplicate prose purely for format.

**Header:** BRD title; document date/version; Draft/Provisional/approved status with evidence; scope; audience/purpose; source inventory/reference; actual author if supplied; revision note for updates. Never impersonate a preparer or approver.

### Business Objective

2-4 sentences describing the problem, affected users, business rationale, and expected outcome. Distinguish confirmed success measures from unknown targets or proposals. Features belong in Scope/Functional Requirements, not as a substitute for the “why.”

### Stakeholders

| Role | Confirmed name/group | Involvement / decision authority |
|---|---|---|
| Source-supported role | Supplied identity or not provided | Stated involvement; authority only if confirmed |

Unknown stakeholders are not invented. If none are supplied, state the limitation.

### Scope

- **In Scope:** major sourced capabilities/behaviors and affected boundaries.
- **Out of Scope:** explicit exclusions; otherwise “No explicit exclusions documented.” Do not treat absent detail as agreed exclusion.

### Functional Requirements

Numbered functional areas with stable requirement IDs, actor/condition, observable behavior/outcome, supported exceptions and feedback. Use behavior matrices or transition tables when clearer than prose. Cross-reference exact source locators and decision status. Do not organize as a transcript or backlog dump.

### Non-Functional Requirements

Include relevant sourced performance, security, accessibility, device/browser support, retention, reliability, or other quality constraints. State measures and test conditions only where supplied. A relevant but unspecified target is an open question, not a fabricated “2 seconds,” retention duration, or standards version. Access rules must be sourced regardless of which section contains them. Avoid exhaustive irrelevant N/A lists.

### Constraints and Assumptions

Separate binding sourced constraints (organizational, regulatory, time, external contract, or technical) from unconfirmed assumptions. Give assumptions references and confirmation impact; do not embed them silently as requirements. State “none documented” rather than “none exist.”

### Traceability and Decisions

Map requirement IDs to source/version/location and relevant objective, decision, or externally mandated contract. Reuse the same canonical traceability table if already embedded; do not duplicate it. Record confirmed decisions with authority/date when known, alternatives rejected only if documented, and unresolved decisions separately. A filled template is not sign-off.

### Open Questions and Risks

| Ref | Question / risk | Source / affected requirement | Required decision / next action | Owner / priority |
|---|---|---|---|---|
| Stable ref | Actionable uncertainty | Exact locator and impact | Confirmation needed | Confirmed values or TBD |

Omit this section only when no open items were identified, not merely because the source lacks detail.

## Examples and review

- A complete synthesis already covers workflow behavior: reuse it as the functional core, adding only objective, constraints, stakeholders, decisions and missing traceability. Do not generate a separate requirements document unless requested.
- A sponsor asks for a BRD from a one-paragraph idea: produce a labeled outline/provisional BRD if requested, mark objective metrics and scope undecided, and ask focused questions. Do not present it as implementation-ready.
- A design shows an admin button but no access rule: list the observation as design evidence and access as an open decision, not “Admins only.”

Before delivery verify business rationale, audience fit, explicit scope boundaries, source-supported/testable requirements, relevant measurable NFRs or visible gaps, assumption/decision separation, traceability, open-item ownership unknowns, and approval status. Saving uses the confirmed requirements category, existing naming conventions (for example `BRD_<Initiative>_<Date>.md`), collision checks, and exact-path reporting. A BRD does not establish testing, release readiness, or stakeholder acceptance by itself.
