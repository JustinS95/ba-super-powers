---
name: writing-test-cases
description: Use when deriving repeatable manual test cases and acceptance-criteria coverage from approved stories or requirements, or explicitly requested technical validation cases with authoritative engineering oracles.
---

# Writing Test Cases

## Purpose and activation

Translate approved behavior into self-contained tests a second tester can execute and judge consistently. Also support explicitly requested technical validation cases under the observable behavior boundary below. Use for story-level or related feature-level manual cases; use `writing-test-plans` for coordinated multi-phase UAT and `writing-playwright-tests` for automation. Authoring is not execution or permission to create remote test records.

Before working, read [COMMON](../../references/COMMON.md) and, when project configuration, source identities or hierarchy are involved, [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). No mandatory entry skill or universal chat-first gate applies.

## Inputs and clarification

Required: selected source stories/requirements, their AC and source version/location, requested test scope, and an authorized output destination if saving. Obtain environment, actor roles, prerequisite data and approved business limits wherever they affect reproducibility. Existing manual cases and implementation material may supply navigation/setup, not new business rules.

For internal technical cases, require an explicitly requested technical validation objective plus a supplied authoritative, applicable engineering specification, ADR, API contract or schema with exact version/location as the oracle. A story/AC is not required where none applies; trace the objective and engineering obligations instead. Missing objective or oracle blocks the affected technical verdict (or permits a labeled provisional draft without an asserted verdict), not independent business cases.

- Read each relevant selected source in full. Identify behavior-owning story and precise criterion content, not just a title or AC number. Split compound AC into identifiable obligations while preserving the original text.
- An unresolved Description “Open Questions / Items to Address” block signals provisional AC. Ask which criteria are approved, whether to skip affected stories, or whether the user wants a labeled partial draft. Permission to draft provisional tests does not make assumptions approved requirements.
- Unknown error text, field limit, timing, role rights, navigation or setup is a question, not license to invent it. Block only affected executable cases; list the missing fact and owner.
- Separate requirement-derived cases from **exploratory heuristics/proposals**. Input fields alone do not establish validation policy. Missing negative or permission rules are coverage questions, not pass/fail oracles.

## Workflow

1. **Establish provenance and destination.** Inventory sources, stable story/requirement IDs, versions, immediate-parent context if adopted, and exclusions. Follow existing identity schema; never substitute a remote numeric ID for a local UUID. Resolve a durable `test-cases` category or configured equivalent and collision/update policy before saving.
2. **Build an obligation matrix.** Map every in-scope AC and compound branch to one or more stable TC IDs. Trace technical objectives/engineering obligations separately when applicable. Technical-only assertions do not count as business AC coverage; a dual-purpose case needs independently traced behavioral assertions for that coverage. Mark missing, provisional, not applicable and out-of-scope coverage with rationale. One test per story is not enough; one test per AC is only a starting point.
3. **Derive coverage from the source.** Use the technique guidance below to turn obligations into data classes, rule combinations or state paths, then bind them to TC IDs. Include primary success, required validation/rejection, permitted and denied roles, specified boundaries, empty states and observable feedback where supported. For rejected operations observe blocked action, preserved state and permitted data visibility as applicable. Propose additional heuristics separately.
4. **Specify setup and data.** State role/login state, record ownership/status, configuration and navigation starting point. Identify exact synthetic fixture or deterministic setup; do not use “data exists” or “choose the first record.” Give each created entity a collision-safe run/test identifier. Reference approved role account/secret names, never values. Record baseline state when checking changes. Where feasible, choose saved baseline values different from attempted values so a missing save or unwanted save is observable; use source-valid data, not a universal baseline such as 3. If distinct values are not feasible, specify another supported observation or disclose the gap.
5. **Draft atomic actions and observations.** Use the case format below. Each numbered step has one action and a corresponding expected observation; separate navigation, entry, submission and verification. A case may contain several steps but must have one coherent objective and reproducible setup, not hidden dependence on another test passing.
6. **Review, then deliver.** Perform the quality checks before saving; no mandatory full draft in chat. Preserve selected canonical IDs on updates. Report exact saved paths and changes, or label chat-only output. Do not mark execution results during design.

## Practical technique selection and derivation

Use only techniques that illuminate the selected behavior; do not require every technique for every story. Reuse an existing plan's strategy and exclusions, or record a short rationale here when no plan is needed. Plans own risk/selection rationale; cases own the detailed derivation and data bindings.

| Source signal | Technique and concrete derivation | Rule needed before assigning a verdict |
|---|---|---|
| Inputs with the same specified outcome | **Equivalence partitions:** split the domain into valid/invalid classes, give each class a predicate and representative, and map each to a TC. Split further when outcomes differ; check for gaps/overlap. | Approved domain, constraints and outcomes. A field's existence does not imply requiredness, type or format. |
| Ordered thresholds or limits | **Boundary values:** for each confirmed threshold select on, nearest inside and nearest outside values using the domain's actual increment/precision. Deduplicate coincident points and keep an interior representative when useful. | Inclusive/exclusive endpoints, units, precision and rejection behavior. Unknown rounding/time-zone rules block affected numeric/time oracles. |
| Multiple conditions jointly determine an outcome | **Decision table:** list conditions/actions; enumerate feasible combinations, then merge rows only when omitted conditions cannot change the approved outcome. Mark impossible combinations with source-backed constraints. Select representatives and trace every rule row to tests/gaps. | Interacting rules and any outcome/error precedence. If precedence is unknown, assert only a supported common outcome or ask; do not invent the first error. |
| Behavior depends on current state or history | **State transitions:** list known states, events, guards and outcomes; map valid transitions and explicitly prohibited attempts to tests. Add sequence/repeat checks when history matters. | Approved state/guard model and observable outcomes. A missing arrow is a question, not automatically a forbidden transition. |
| Many factors multiply the candidate set | **Risk-based combination reduction:** retain critical outcomes, rule interactions, permission denials and boundaries; identify what is sampled/omitted and why. Pairwise selection can supplement coverage of lower-risk factors, not replace higher-order rules or named obligations. | Feasible factor values/constraints and risk rationale. Do not call a handpicked subset pairwise without checking all feasible value pairs. |

For each selected technique retain a small derivation table (class/boundary/rule/transition ID, source obligation, representative or path, TC IDs, gap/rationale). Distinguish **infeasible**, **out of scope**, and **feasible but not selected**. Never call an untested combination covered merely because each factor appeared elsewhere. If inputs are insufficient, derive the known portion and list blocked classes/rules with the question and decision owner.

Test each approved rejection rule independently where possible: violate that rule while satisfying the other conditions, and bind the isolated setup to its TC. Rejection with multiple invalid conditions does not prove that each rule works. Record constraints preventing isolation as gaps; retain separately justified interaction checks without requiring tests for every combination.

See the shared [worked example](worked-example.md) for a decision table, partitions/boundaries, transitions, explicit combination reduction and fully bound manual cases. Its hypothetical rules are not project policy.

## Case format

Use descriptive Markdown headings and these fields, adapting presentation to existing project templates without losing information:

When useful for the audience, introduce the selection with a short everyday explanation of what the tests check and why those checks matter, before detailed coverage/derivation tables. Keep it proportionate; a teaching narrative is not required in every artifact.

| Field | Required content |
|---|---|
| ID / title | Unique sequential `TC-001` within the artifact; do not restart per story; preserve existing IDs on updates |
| Story or technical objective / source | Stable local identity and remote mapping when adopted; behavior-owning story or explicit technical objective; authoritative source path/exact version |
| AC or engineering obligation reference | Exact criterion or engineering obligation identity/text location/version and branch covered; mark story/AC N/A with reason when none applies, never invent one |
| Basis / type | Approved behavioral requirement, authoritative engineering oracle for an explicit technical objective, or labeled heuristic; Functional, Negative, Permission, Edge Case, Technical (additional tags allowed); distinguish behavioral and technical assertions in dual-purpose cases |
| Preconditions | Role, authentication state, ownership, exact record state, environment prerequisites and independent setup |
| Test data | Inputs/fixtures, their provenance, expected generated values and capture instructions; no secrets |
| Steps | Table: step number, one concrete action, expected observable result |
| Expected result | Overall pass/fail oracle, including unchanged state for rejection where required |
| Cleanup | Exact created records/restoration steps, authority needed and diagnostic retention on failure; N/A with reason |
| Execution | Not run by default; empty actual result/status/evidence fields for the tester |

Explicit navigation paths and UI names come from supplied implementation/screens or approved observation. Unconfirmed paths remain a blocker, not plausible fabricated labels. Approved stable fixture files may be linked with exact path/version and bindings; never say only “same data as TC-003.”

## Observable behavior boundary

Default to what an actor sees, can do, receives, or changes. API use inside the product does not justify checking an internal route, status code or table. Exact contract assertions may use a supplied authoritative public API/external contract without a separate technical-objective approval for those public behavior checks. Internal technical assertions instead require an explicitly requested technical validation objective and the authoritative applicable engineering oracle/version described above; implementation hints or guessing from source code alone are insufficient. Technical setup may come from approved implementation material, but neither setup nor engineering assertions may rewrite story/AC into implementation requirements.

Keep technical case basis and assertions distinct from business AC coverage. A technical case can also support behavior when it includes independently sourced, traced behavioral assertions; technical-only checks establish only their engineering obligations, not business acceptance.

Do not invent exact toast wording, list position or a five-second SLA to make an example precise. Use exact strings/timing only if sourced; otherwise specify the approved semantic outcome and flag any missing deterministic oracle.

## Expected deliverables

- Scope/source/version inventory and unresolved decisions.
- Test cases with reproducible data/setup/cleanup and unexecuted status.
- AC-to-test obligation matrix (where applicable), separately traced technical objectives/engineering obligations, supported coverage categories, uncovered/provisional branches and separate exploratory suggestions.
- Selected technique rationale (or plan link), derivation-to-TC mapping and justified combination exclusions/residual risk; do not report an unsupported coverage percentage.
- Durable Markdown artifact when requested. Use the `Test_Cases_[StoryTitle or FeatureName]_[YYYYMMDD].md` naming convention where adopted, one coherent group per file. Actual hierarchy/configuration controls nesting, not assumed project phases. Inspect collisions; update only a selected canonical target or use an approved new version.

## Quality checks

- Every approved in-scope AC obligation has a test or explicit gap; no compound criterion is claimed covered by a label alone.
- Internal technical assertions have an explicit objective and authoritative applicable engineering oracle with exact version/location; technical-only assertions are excluded from business coverage, and any dual coverage has independently traced behavioral assertions.
- Recheck partition predicates and boundary increments; decision-table rows agree with source outcomes and cover the stated feasible domain; transition claims match confirmed guards. Selected cases exercise the claimed rows/values/paths, and omitted combinations remain visible.
- Check that rejection rules have isolated tests or explicit isolation gaps, not only multiple-invalid cases; interaction checks have their own rationale. Saved/attempted values differ where feasible, or an alternative observation/gap explains how save behavior can be judged.
- Unique IDs; source/version/role/data references resolve; positive, negative, permission and boundary coverage is included when supported, otherwise gaps are disclosed.
- Two testers can establish identical preconditions, follow one action per step and reach the same verdict from the specified observations.
- No unsourced business rule, guessed navigation, hidden shared state, vague “works,” or secret is present.
- Setup/cleanup respects authorized environment and created records. Destructive/production operations are blocked without specific authorization.
- Paths, linked fixtures, placeholders and canonical update/version choices are consistent. “Not run” is distinct from pass.

## Bounded examples

- **Happy path:** approved AC says an owner can archive an open draft and sees it in Archived. Derive a Functional case with a synthetic open draft owned by that role, explicit sourced navigation, archive action, and observable destination/status checks; capture its ID for cleanup.
- **Edge/permission:** if AC explicitly restricts archive to the owner, add a non-owner case verifying rejection and unchanged draft. If it specifies a length boundary, test that boundary and adjacent values. Do not invent either restriction.
- **Insufficient input:** “validate the name” has no defined valid/invalid classes. Return the affected AC as blocked, ask for approved constraints, and optionally propose exploratory input categories without expected pass/fail claims.
- **Internal technical objective (hypothetical):** the user requests internal API conformance to supplied approved Contract v2.1, §4, which requires HTTP 409 for a duplicate key. Trace a Technical case to that objective/section, with story/AC N/A if none applies. A handler returning 409 in source code alone is not an oracle. Without the objective or authoritative contract/version, block that technical verdict while retaining independent business cases; 409 alone does not establish business AC coverage.

## Limitations

Cases specify intended checks, not verified behavior, test execution, release readiness or complete coverage of unstated risks. Remote publishing and execution require separately authorized workflows.
