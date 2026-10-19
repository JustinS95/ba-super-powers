---
name: writing-test-plans
description: Use when planning risk-based, multi-phase UAT or end-to-end validation across components or stakeholders, with environment, data, roles, traceability, entry/exit gates and executable manual procedures.
---

# Writing Test Plans

## Purpose and shared contracts

Create a coordinated validation plan for a workflow spanning phases, systems or stakeholders. Use phase organization, the three-part data architecture (Groups A/B/C below), baseline checks, external validations and reproducible cases without duplicating giant SQL/payload blocks. For an isolated story use `writing-test-cases` instead.

Read [COMMON](../../references/COMMON.md) and [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). Read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) if defining automated execution/evidence and [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) before any separately requested ADO action. Planning does not authorize running a plan, calling APIs or changing data.

## Required inputs and clarification rules

- Workflow requirements/AC and their authoritative versions; related feature, architecture, implementation, prior-plan and public/external contract material relevant to scope.
- Intended validation objective (UAT, regression, smoke, integration), boundaries, risk priorities, participants/owners and approval authority.
- For an execution-ready plan: confirmed non-production environment/baseURL, release/configuration, role accounts via secure references, data setup/reset strategy, authorized side effects and cleanup, and applicable dependencies.
- Actual schema/migrations/dialect and approved API contracts/fixtures **only when** SQL/API mechanics are needed. UI-only plans do not require a database or invent migration checks.
- Authorized destination if saving. Missing configuration does not prevent a standalone draft.

Read the relevant source documents in full before drafting their procedures; do not follow unrelated links indiscriminately. Record conflicting/deprecated endpoint or schema references with source/version, owner and impact. Do not declare one current without authority. Unknown URLs, column names, API fields, UI paths, limits or workarounds block affected runnable steps. A labeled planning draft may retain explicit unresolved placeholders; do not present it as ready for UAT.

## Workflow

1. **Inventory and bound.** Record source versions, workflow actors/states, requirement/AC obligations, approved hierarchy and actual execution dependencies. Parent links establish context, not execution order. Establish plan version and selected output before writing.
2. **Prioritize risk and select techniques.** Identify critical journeys, authorization/data-integrity/integration risks, likely failures and impact; state why each test phase is prioritized. Use the strategy guidance below to choose coverage targets and reduction limits. Propose risk acceptance and exclusions for the accountable owner, not as an automatic decision.
3. **Define governance.** Assign setup, execution, external validation, defect triage, cleanup and acceptance owners. Define entry/exit/suspension/resumption criteria with measurable evidence and decision owner. Do not invent a mandatory pass percentage or severity policy.
4. **Define the environment.** Confirm test target, build/configuration, integration substitutes and known differences from production. Include schema/migration checks only where relevant and supported. Capture baseline balances/counts/statuses needed for later delta verification; never assume zero. Record environment readiness and credential reference names, not values.
5. **Build shared data before cases.** Use Groups A/B/C below and one consistent placeholder dictionary. Plan isolation, collision checks, generated-value capture, retention and exact scoped restoration. Preserve negative-case independence from happy-path state. Where feasible, plan distinct saved/attempted values to expose missing or unwanted saves; leave exact bindings and alternative observations to `writing-test-cases`, not a universal numeric baseline.
6. **Sequence phases.** Begin with Prerequisites and Setup; follow actual workflow transitions. End with a clearly labeled Edge Cases phase when applicable, or explicitly document why no supported cases exist. Edge cases needing special state get their own fixture/setup. Identify dependencies and restart/reset checkpoints rather than falsely promising every end-to-end phase is independent.
7. **Draft procedures.** Use the case and atomicity rules below. Map each phase/case to source obligations and risk. Specify expected observable outcomes, evidence and external confirmations; implementation success alone is not business acceptance.
8. **Review and save.** Resolve blocking gaps or label affected procedures blocked. Check all references/placeholders against their definitions and verify mechanical claims against supplied schema/contracts. Save only after local review; no mandatory chat-first stage. Return plan, traceability and readiness/gaps, not fabricated execution results.

## Coverage strategy and technique selection

Choose techniques to fit evidenced risks, not as a mandatory checklist. Record a compact strategy table: **risk / source obligation → technique → coverage target → phase or case group → reduction/exclusion rationale → residual risk and decision owner**. Keep detailed partitions, values, rule rows and transition-to-TC mappings in the cases using [writing-test-cases](../writing-test-cases/SKILL.md#practical-technique-selection-and-derivation); do not duplicate a second derivation in the plan.

- **Input-domain risk:** use equivalence partitions for confirmed classes; add boundary values where ordered limits exist. Target representatives of each outcome class and the relevant threshold neighborhoods, not arbitrary extreme values. Unknown limits/precision remain questions.
- **Interacting-rule risk:** use a decision table for conditions that jointly control outcomes (for example role + state + eligibility). Target feasible rule outcomes and consequential interactions. Include independent rejection-rule checks where possible, with other conditions satisfied; multiple-invalid rejection does not establish each rule. Keep separately justified interaction checks, not every combination by default. Use `writing-test-cases` for detailed isolation/data bindings. Only merge combinations when the source supports the same outcome regardless of the omitted condition; do not guess error precedence.
- **Lifecycle/history risk:** use state transitions for confirmed states/events/guards. Target critical allowed transitions, specified denials and repeat/sequence paths where history changes behavior. “All states visited” does not establish transition coverage.
- **Combinatorial growth:** preserve explicit AC branches, critical interactions, permission/data-integrity checks and selected boundaries first. Reduce lower-risk combinations with documented representatives or pairwise selection when appropriate. Pairwise is not proof of a three-condition rule or exhaustive coverage; its feasible-pair claim needs a checked mapping. Record feasible omissions separately from source-proven impossibilities, and name who must accept residual risk.

Before declaring the strategy sufficient, check that each priority risk has an observable oracle, coverage target and traceable cases or explicit gap; confirm that reduction has not erased a required outcome or high-impact interaction. Missing business rules can block a target while leaving other phases draftable. Avoid invented pass percentages or blanket claims of complete coverage.

The shared [worked example](../writing-test-cases/worked-example.md) shows one bounded strategy and its detailed derivation, selected/omitted combinations and unexecuted cases. Reuse it rather than copying it into a second example; its toy rules are not project requirements.

## Plan structure

Keep these recognizable sections, adding project-specific sections as needed:

When useful for the audience, place a short everyday explanation of why the tests were selected before detailed risk/coverage tables. Explain the practical purpose without mandating a teaching narrative in every plan.

1. **Overview & Scope:** workflow, objectives, in/out-of-scope systems/roles, source versions, risk table, technique/coverage strategy and acceptance authority.
2. **Test Environment:** target/build/configuration, URLs, dependencies, supported DB/API mechanics, secure account references, readiness and discrepancies.
3. **Shared Test Data:** Groups A/B/C, placeholders, fixture index and reset/retention policy.
4. **Balance Tracking Reference** when financial/inventory/data totals are affected: columns/metrics, authoritative update triggers, verified baseline procedure and expected checkpoint deltas. Otherwise explicitly N/A.
5. **Test Cases by Phase:** setup, workflow, then supported edge/negative/permission cases, with dependency and checkpoint map.
6. **External Validation Checklist:** exact observable confirmation, owner, access dependency, evidence and result slot for checks outside the primary environment. Unverified external behavior remains pending.
7. **Open Items & Known Decision Points:** owner, source conflict/unknown, impact, blocked cases, needed decision/date.
8. **Execution Governance:** roles, schedule/order, entry/exit and suspension/resumption gates, defect reporting/retest process, evidence/reporting and sign-off.

Header: workflow/feature area, version/date, author/reviewer or TBD, related documents with locations/versions and execution-readiness status. Use the project's adopted structure when equivalent information is already present.

## Test data architecture

| Group | Meaning and required details |
|---|---|
| A - Resolve before testing | Approved role accounts, secret reference names, environment IDs and shared configuration/records. State resolver and verification; approved schema-derived lookup may be in a versioned helper fixture. Never copy secrets. |
| B - Chosen synthetic values | Run/test/event-scoped unique identifiers, allowed format/length from the contract, intended usage and verified collision check. Use a separate ID for each distinct simulated event. Deliberate replay/idempotency tests reuse only the specific approved ID and state that intent. |
| C - Captured during execution | Exact placeholder, source case/step, field or observation captured, recording location and consumers. Mark runtime values unresolved until captured. |

Use `[PLACEHOLDER_NAME]` consistently, distinguish required input from generated output, and define every occurrence. A collision check must confirm absence by a verified mechanism; “must return no rows” is suitable only for an approved scoped read query, not an invented schema. Without a supported check/fixture, block that procedure or request one.

## Manual case and atomicity contract

Each case has stable `TC-P1-01`, `TC-P2-01` or `TC-E-01` identity/title; source/AC/version/branch; type (UI, DB validation, API call, UI + DB as applicable); risk; role; preconditions and explicit dependencies; data bindings; numbered action/expected-observation pairs; overall oracle; evidence capture; and scoped cleanup/reset instructions. Initial execution status is Not run.

- One action per numbered manual step. UI procedures start at a known menu/breadcrumb/verified URL and name actual tabs, controls and transitions. “Progress the job” is not a procedure. Unknown controls block the affected executable procedure.
- Never reference another case's incidental payload, hidden state, “same as above,” or an undefined template. Each case/setup block names its complete setup and parameter bindings.
- Instead of inlining large duplicated SQL or payloads, reference an **approved stable fixture** by exact path, immutable version/hash, operation name, all input/output bindings, execution method, expected observation and reset procedure. The fixture must be available to the tester and verified against the actual schema/contract. The plan plus its indexed fixture package is the executable deliverable, not a falsely self-contained single file.
- Small approved mechanics may be inline when needed. No code is required just to explain the plan. If a fixture is missing/unverified, label the step blocked, not “run the previous query.”
- Phase setup follows the same rules. Re-establish edge-case preconditions independently or state a verified reset dependency; don't consume a completed happy-path record silently.
- Separate business assertions from implementation/setup mechanics. DB checks may verify approved data outcomes but must not back-propagate tables/columns into behavior-focused AC. Exact status/payload assertions need an authoritative public/external contract or explicit technical validation objective.

## Schema/API and safety checks

Verify column/object names and dialect against actual approved schema/migrations, including audit/version timestamp names; source titles are insufficient. Verify API method, route, payload schema and service version against approved material. Mark contradictions/deprecations and stop affected execution until resolved.

Baseline and later delta checks use the same scoped identifiers and recorded starting values. Never hardcode environmental record IDs in reusable mechanics. UAT workarounds are exceptional: identify provenance, exact records, authorization, rollback and label **UAT ONLY - NOT PRODUCTION**. That label is not authorization. Do not include runnable destructive SQL, real payments/messages or production effects without explicit scope approval. Avoid broad cleanup predicates; preserve diagnostics and list orphaned synthetic data on failure.

## Deliverable, naming and quality checks

Deliver the plan, AC/risk-to-case matrix, verified fixture index (if used), unresolved decisions and execution-readiness summary. Durable plan names retain `Test Plan - [Workflow Name].md` where adopted. Use authorized `test-plans`/configured category, one coherent workflow per file, confirmed hierarchy only. Inspect existing files; update a selected canonical plan with a scoped diff or create an approved version/date variant. Report exact paths, retain versions and never overwrite unknown work.

Before delivery verify scope/risk/roles/gates; full source and branch traceability; explicit prerequisites and external owners; atomic UI steps and reproducible setup; all Groups A/B/C and consistent placeholders; unique synthetic event IDs/collision checks; schema/contract provenance; baseline/delta consistency; accessible immutable fixtures; safe cleanup; and precise blocked/not-run labels. No unresolved item may silently coexist with an “execution ready” claim for its affected path.

Check strategy-to-case consistency: claimed partition, boundary, decision-rule, transition or feasible-pair targets have detailed mappings; exclusions have reasons and residual-risk owners. A smaller suite is a justified trade-off, not evidence that omitted combinations work.

## Examples and limits

- **Happy path:** a staged receipt workflow gets Setup, Event Received and Receipt Processed phases, each tied to approved outcomes. Capture actual starting inventory, unique synthetic event identity and generated receipt ID; compare authorized deltas, not an assumed zero baseline.
- **Edge case:** source requires duplicate-event rejection. Deliberately replay its isolated event ID, verify approved rejection/unchanged balance, and distinguish that intent from accidental reuse across unrelated events.
- **Insufficient input:** an integration note names a table but no verified schema is supplied. Draft risk/scope/roles and UI cases; block DB procedures, request the schema/version/owner, and do not invent column names or runnable queries.

A reviewed plan is not an executed suite or acceptance sign-off. External behavior, stakeholder approval and unknown mechanics remain explicit limitations.
