---
name: requirements-change-impact
description: Use when comparing requirement versions or related code and fixture changes to identify affected obligations, tests, assertions, data and prior evidence, and propose risk-based regression candidates without executing them.
---

# Requirements Change Impact

## Purpose and activation

A rule changes, but the test names stay the same. Which expected results now need updating? Which other checks share the changed setup? Which old passes still describe the old product rather than prove the new one? Use this skill to answer those questions before choosing regression work.

Produce a bounded old-to-new impact assessment and risk-prioritized **candidates** for review, update and rerun. Use for requirement/AC changes, including proposed changes, or for related code, test, fixture, configuration or environment changes with unchanged requirements. This is cross-version analysis, not test authoring, execution, defect confirmation, evidence publication or release approval. See the [plain-language worked example and scenarios](worked-example.md).

## Inputs and contracts

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Use selected existing sources, not an automatic full-library or repository scan.

Required for a conclusive comparison:

- Requested decision, bounded feature/change/release scope and exclusions; risk priorities and decision owners when known.
- Old and new authoritative requirement/story/AC content with identities, versions and precise locations; related decisions/public contracts and approval status. For a code-only change, identify the unchanged requirement baseline and old/new technical baselines.
- Available manual cases and derivations, automation tests/**actual assertions**, fixtures/setup/reset and their versions; relevant dependency or code/config/environment diffs. State what was supplied versus inspected.
- Selected prior evidence with existing run/test/project/attempt identities, tested requirement and code/config/environment versions, actual assertions/outcomes and collection limitations, if evidence applicability is being assessed.
- Authorized exact destination only if saving; no configuration or formal registry is required.

Ask for missing consequential inputs in a grouped request: which old/new baseline, who approved which change, which test/dependency scope is available, and who can resolve conflicts? Missing old text blocks a semantic delta claim; missing assertions or dependency links blocks an unaffected/full-coverage claim, not a partial inventory. Missing run provenance makes evidence applicability unknown. Offer a labeled provisional analysis of known scope and list blocked conclusions; never reconstruct missing baselines from a test title or assumed rule. Proposed sources support conditional impact analysis, not approved test oracles. Conflicting sources remain disputed until an accountable decision resolves them.

## Workflow

1. **Freeze the comparison boundary.** Record old/new source identities, exact versions/locations, baseline dates/revisions as available, change approval (approved, proposed or uncertain), decision provenance, inspected test/code/data/evidence scope and exclusions. Keep source approval distinct from permission to edit or run. A bounded snapshot cannot establish global completeness; inaccessible or partially collected sources remain explicit.
2. **Compare behavior, not labels.** Read relevant full criteria and context. Break compound criteria into identifiable actor, condition, action, state/data, feedback and denial obligations without changing canonical IDs/text. Map old to new meaning as unchanged, modified, added, retired, split, merged or unresolved. Stable ID with changed semantics is modified; renumbering alone is not. For splits/merges retain all predecessor/successor references and any lost or new branches. Suspected retirement without authority stays unresolved. Temporary row labels may aid a report; do not impose a new registry/schema.
3. **Trace direct and indirect effects.** Follow known source-to-case/derivation-to-assertion links, then actual shared helpers, role/state setup, fixtures and their consumers, workflow transitions and environment/config dependencies. Inspect linked content: a metadata reference or filename alone does not show what a test asserts. Include unchanged obligations that interact with the change (for example an unchanged denial guard using newly eligible data). Record each dependency path and its evidence/version. Stop at the agreed boundary; flag uninspected consumers. No link means unknown impact, not unaffected. Code/test/fixture changes can invalidate checks or setup without changing requirement text.
4. **Separate the kinds of work.** For each affected item state: obligation correspondence; direct/indirect/unknown impact and why; manual design/expected-result or derivation review; automation assertion/helper review; data/setup/reset review; and evidence-applicability review. Keep “review needed” separate from “update needed” and identify what would settle it. Added obligations with no checks are gaps, not invented tests. Retired obligations trigger review of obsolete expectations and continuing shared uses, never automatic deletion/retirement of cases. Preserve existing IDs and historical mappings.
5. **Assess prior evidence without rewriting it.** Reference existing run/test/attempt and tested-source versions using the adopted evidence record, not a new result schema. Keep the original outcome intact. Separately explain applicability to each new obligation: supported for a stated portion, partial, not applicable to changed meaning, or unknown, with assertion/data/version basis and limitations. A prior pass may remain valid history while not supporting the new threshold, role or state. Unchanged text alone does not validate changed code, assertions, fixture, configuration or environment; historical support is not current-build proof. Skips, retries, missing captures and incomplete assertion mappings retain their original limitations. This analysis neither checks AC boxes nor changes run outcomes.
6. **Select risk-prioritized regression candidates.** Rank using evidenced business/security/data-integrity consequence, changed outcomes/boundaries, interaction/shared-dependency reach, failure likelihood where supported and evidence uncertainty. Explain priority in plain language; do not invent risk scores or choose an arbitrary case count. Distinguish checks needing redesign/data repair before rerun from valid existing rerun candidates. Include critical changed branches and justified adjacent/unchanged interaction checks; expose untested obligations and feasibility blockers. For every candidate give the direct/indirect dependency reason, required version/setup, review/update prerequisites, residual uncertainty and owner or owner-to-confirm. Record deferred/excluded checks with inspected unaffected basis or explicit risk acceptance needed; an exclusion is not a pass. Unknown reach may justify a broader proposed set or targeted dependency questions, not a declaration of safety.
7. **Review and return the bounded handoff.** Reconcile every in-scope changed obligation to impacted items/candidates or an explicit gap. State next decisions and exclusions before any sufficiency claim. Route only requested follow-on work to its existing owner below. No test/code/fixture change, source approval or candidate list authorizes edits, execution, credentials, installs, production access, cleanup or publication. Actual execution, if later separately authorized, produces separate versioned results; it is never inferred here.

## Outputs and storage

Default to a lightweight chat-only report, opening with what changed in everyday language and what the reader should do next. Scale detail to risk; a small change does not require a formal ledger. Include:

1. Comparison boundary, old/new baselines, approval status, facts versus assumptions and missing evidence.
2. Obligation correspondence with exact source references; affected unchanged interactions.
3. Impact rows: obligation → case/assertion/helper/fixture/evidence identity and version → dependency reason and confidence → review/update need. Keep unknown and unaffected distinct.
4. Prior-result applicability notes separate from original outcomes.
5. Prioritized rerun candidates with prerequisites, reason, blockers/owners, exclusions/deferred scope and residual risk; all **proposed / not run**. If no justified set can be selected, say what evidence/decision is needed rather than making up one.

When saving is authorized, apply COMMON's destination/retention policy: a durable BA impact artifact at an explicit authorized path or existing confirmed root/category. Ask if unresolved; do not invent an impact category, config key, store or evidence schema. Use descriptive change/baseline naming and collision-safe versions; read existing targets and preserve unrelated content, with a baseline/scoped diff for a selected canonical update. Retain impact history and original evidence; cleanup requires separate exact authorization. Report resolved paths/actions only after actual writes. A saved report does not authorize modifications to its referenced sources.

## Existing ownership, only when needed

- [Defect analysis and handoff](../defect-analysis-and-handoff/SKILL.md) owns supplied runtime mismatch reports, provisional triage/duplicate assessment and bounded confirmation handoff; change-impact findings alone do not establish a defect or authorize execution/publication.
- [Stories](../writing-user-stories/SKILL.md) and [AC](../writing-acceptance-criteria/SKILL.md) own source obligations, approved meaning and refinement; impact analysis does not settle business policy.
- [Manual cases](../writing-test-cases/SKILL.md) own detailed partitions/boundaries/rules/transitions, data bindings and case updates. [Plans](../writing-test-plans/SKILL.md) own coordinated strategy, shared fixtures and execution governance.
- [Playwright authoring](../writing-playwright-tests/SKILL.md) owns code/assertion mappings and automation updates. [Post-test evidence](../post-test-evidence/SKILL.md) owns current-versus-tested semantic coverage for publication and historical retention. Reuse existing identities/versions; do not require these workflows in sequence.

## Quality checks and limitations

- Old/new versions, approval status and semantics are explicit; stable IDs do not hide meaning changes, splits or merges. Every in-scope delta and affected unchanged interaction has a disposition or visible gap.
- Each claimed affected/unaffected item has inspected source/dependency basis, or is labeled uncertain. Search/link absence and unchanged text are not independence proofs. Bounded review never becomes a global completeness claim.
- Manual design, data, automation, evidence applicability, rerun recommendation and actual execution are separate. Prior passes/IDs/evidence stay intact; no automatic deletion, retirement or rewriting.
- Priorities and exclusions follow stated risk and dependency evidence. Blockers and decision owners are actionable; no invented rules, coverage percentages, commands or runnable mechanics.
- Requirements changes can expose coverage gaps or outdated expectations; they do not prove a runtime defect. Static impact review cannot establish deployment behavior or guarantee that every dependency was found.

Use the [compact validation scenarios](worked-example.md#compact-validation-scenarios) for maintenance review. Authored examples/walkthroughs are not executed assistant trials or product tests.
