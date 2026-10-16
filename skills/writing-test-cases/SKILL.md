---
name: writing-test-cases
description: Use when deriving repeatable manual test cases and acceptance-criteria coverage from approved stories or requirements, including supported negative, permission, and boundary scenarios.
---

# Writing Test Cases

## Purpose and activation

Translate approved behavior into self-contained tests a second tester can execute and judge consistently. Use for story-level or related feature-level manual cases; use `writing-test-plans` for coordinated multi-phase UAT and `writing-playwright-tests` for automation. Authoring is not execution or permission to create remote test records.

Before working, read [COMMON](../../references/COMMON.md) and, when project configuration, source identities or hierarchy are involved, [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). These contracts replace the original mandatory entry-skill and universal chat-first gates.

## Inputs and clarification

Required: selected source stories/requirements, their AC and source version/location, requested test scope, and an authorized output destination if saving. Obtain environment, actor roles, prerequisite data and approved business limits wherever they affect reproducibility. Existing manual cases and implementation material may supply navigation/setup, not new business rules.

- Read each relevant selected source in full. Identify behavior-owning story and precise criterion content, not just a title or AC number. Split compound AC into identifiable obligations while preserving the original text.
- An unresolved Description “Open Questions / Items to Address” block signals provisional AC. Ask which criteria are approved, whether to skip affected stories, or whether the user wants a labeled partial draft. Permission to draft provisional tests does not make assumptions approved requirements.
- Unknown error text, field limit, timing, role rights, navigation or setup is a question, not license to invent it. Block only affected executable cases; list the missing fact and owner.
- Separate requirement-derived cases from **exploratory heuristics/proposals**. Input fields alone do not establish validation policy. Missing negative or permission rules are coverage questions, not pass/fail oracles.

## Workflow

1. **Establish provenance and destination.** Inventory sources, stable story/requirement IDs, versions, immediate-parent context if adopted, and exclusions. Follow existing identity schema; never substitute a remote numeric ID for a local UUID. Resolve a durable `test-cases` category or configured equivalent and collision/update policy before saving.
2. **Build an obligation matrix.** Map every in-scope AC and compound branch to one or more stable TC IDs. Mark missing, provisional, not applicable and out-of-scope coverage with rationale. One test per story is not enough; one test per AC is only a starting point.
3. **Design coverage from the source.** Include primary success, required validation/rejection, permitted and denied roles, specified boundaries, empty states and observable feedback where supported. For rejected operations observe blocked action, preserved state and permitted data visibility as applicable. Include just-inside/on/just-outside boundaries only when the limit and expected behavior are known. Propose additional heuristics separately.
4. **Specify setup and data.** State role/login state, record ownership/status, configuration and navigation starting point. Identify exact synthetic fixture or deterministic setup; do not use “data exists” or “choose the first record.” Give each created entity a collision-safe run/test identifier. Reference approved role account/secret names, never values. Record baseline state when checking changes.
5. **Draft atomic actions and observations.** Use the case format below. Each numbered step has one action and a corresponding expected observation; separate navigation, entry, submission and verification. A case may contain several steps but must have one coherent objective and reproducible setup, not hidden dependence on another test passing.
6. **Review, then deliver.** Perform the quality checks before saving; no mandatory full draft in chat. Preserve selected canonical IDs on updates. Report exact saved paths and changes, or label chat-only output. Do not mark execution results during design.

## Case format

Use descriptive Markdown headings and these fields, adapting presentation to existing project templates without losing information:

| Field | Required content |
|---|---|
| ID / title | Unique sequential `TC-001` within the artifact; do not restart per story; preserve existing IDs on updates |
| Story / source | Stable local identity and remote mapping when adopted; source path/version and behavior-owning story |
| AC reference | Exact criterion identity/text location/version and branch/obligation covered |
| Basis / type | Approved requirement or labeled heuristic; Functional, Negative, Permission, Edge Case (additional tags allowed) |
| Preconditions | Role, authentication state, ownership, exact record state, environment prerequisites and independent setup |
| Test data | Inputs/fixtures, their provenance, expected generated values and capture instructions; no secrets |
| Steps | Table: step number, one concrete action, expected observable result |
| Expected result | Overall pass/fail oracle, including unchanged state for rejection where required |
| Cleanup | Exact created records/restoration steps, authority needed and diagnostic retention on failure; N/A with reason |
| Execution | Not run by default; empty actual result/status/evidence fields for the tester |

Explicit navigation paths and UI names come from supplied implementation/screens or approved observation. Unconfirmed paths remain a blocker, not plausible fabricated labels. Approved stable fixture files may be linked with exact path/version and bindings; never say only “same data as TC-003.”

## Observable behavior boundary

Default to what an actor sees, can do, receives, or changes. API use inside the product does not justify checking an internal route, status code or table. Exact contract assertions require a supplied authoritative public API/external contract. Technical setup may come from approved implementation material, but must not rewrite story/AC into implementation requirements.

Do not invent exact toast wording, list position or a five-second SLA to make an example precise. Use exact strings/timing only if sourced; otherwise specify the approved semantic outcome and flag any missing deterministic oracle.

## Expected deliverables

- Scope/source/version inventory and unresolved decisions.
- Test cases with reproducible data/setup/cleanup and unexecuted status.
- AC-to-test obligation matrix, supported coverage categories, uncovered/provisional branches and separate exploratory suggestions.
- Durable Markdown artifact when requested. Retain the original `Test_Cases_[StoryTitle or FeatureName]_[YYYYMMDD].md` convention where adopted, one coherent group per file. Actual hierarchy/configuration controls nesting, not assumed project phases. Inspect collisions; update only a selected canonical target or use an approved new version.

## Quality checks

- Every approved in-scope AC obligation has a test or explicit gap; no compound criterion is claimed covered by a label alone.
- Unique IDs; source/version/role/data references resolve; positive, negative, permission and boundary coverage is included when supported, otherwise gaps are disclosed.
- Two testers can establish identical preconditions, follow one action per step and reach the same verdict from the specified observations.
- No unsourced business rule, guessed navigation, hidden shared state, vague “works,” or secret is present.
- Setup/cleanup respects authorized environment and created records. Destructive/production operations are blocked without specific authorization.
- Paths, linked fixtures, placeholders and canonical update/version choices are consistent. “Not run” is distinct from pass.

## Bounded examples

- **Happy path:** approved AC says an owner can archive an open draft and sees it in Archived. Derive a Functional case with a synthetic open draft owned by that role, explicit sourced navigation, archive action, and observable destination/status checks; capture its ID for cleanup.
- **Edge/permission:** if AC explicitly restricts archive to the owner, add a non-owner case verifying rejection and unchanged draft. If it specifies a length boundary, test that boundary and adjacent values. Do not invent either restriction.
- **Insufficient input:** “validate the name” has no defined valid/invalid classes. Return the affected AC as blocked, ask for approved constraints, and optionally propose exploratory input categories without expected pass/fail claims.

## Limitations

Cases specify intended checks, not verified behavior, test execution, release readiness or complete coverage of unstated risks. Remote publishing and execution require separately authorized workflows.
