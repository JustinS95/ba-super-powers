---
name: defect-analysis-and-handoff
description: Use when turning supplied unexpected behavior into a grounded local defect report, provisional triage and duplicate assessment, or a bounded confirmation and regression handoff without execution or publication.
---

# Defect Analysis and Handoff

## Purpose and activation

Explain what went wrong, what should have happened, and what someone can safely do next. Use for supplied incidents, failed checks or unexpected behavior, duplicate comparisons, triage recommendations and fix-confirmation evidence review. Begin with an understandable report, not a taxonomy: see the [fictional worked report, explanation and edge scenarios](worked-example.md). A failed test alone is not a product defect.

This workflow analyzes supplied material and writes locally only. It does not reproduce behavior, investigate live systems, publish, assign, link, merge, close, change state/priority/AC, or authorize testing. Diagnosis of a cause requires independent evidence; reporting an observed mismatch does not.

## Inputs and clarification

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Reuse existing source/run/test/project/attempt identities and versions where present; no new mandatory schema, UUID registry or defect category is required. The runner-evidence contract does not require inventing runner records for a manual incident.

Start with the reported observation, its consequence, available context and requested outcome. Seek the approved expected behavior with exact source/version/location/status; role, state, minimal synthetic data and supplied actions; available build/environment/configuration and observation/evidence references. For duplicate assessment obtain selected candidate content and identities, not merely titles. For confirmation review obtain actual new outcomes and provenance, not a fix label or historical pass. An authorized destination is needed only for saving.

Ask grouped, targeted questions for missing consequential facts and decision owners. Missing oracle/version can block a conclusive mismatch verdict; missing build, frequency or full repro steps usually limits confidence/scope rather than blocking a report. Adequate supplied observation can establish an **observed mismatch** without repeatable reproduction. Record an intermittent or serious single observation now; do not demand complete metadata or exhaustive elimination of alternatives before raising a candidate. Offer a provisional report with explicit limits.

## Workflow

1. **Bound and preserve the observation.** State what was supplied versus inspected and that this agent did not execute anything. Keep original failure, all attempts/retries/skips, timestamps and existing evidence identities intact. Reference minimally redacted, useful evidence; omit secrets/PII and strip private URL values. Do not alter raw history, move sensitive material to a broader destination, or destroy diagnostic data. If safe sharing cannot be established, describe the evidence gap without copying it. Do not request replay of destructive, security-sensitive or production actions; propose controlled investigation only under separate authority.
2. **Establish the oracle and alternatives.** Read the exact expected state/data/feedback and applicable role/conditions from approved sources. Record source approval separately from execution authorization. Compare the actual observation to that oracle, not just the test assertion. Check available evidence for stale expectations, wrong role/state/data, setup, config and environment differences; list plausible unresolved alternatives as questions, not causes. Do not require ruling out every alternative to report a candidate. An unapproved policy or disputed precedence cannot silently replace an approved rule.
3. **Give an evidence-based disposition.** Use the table below, with supporting facts and remaining uncertainty. Separate the observed consequence from inferred affected scope. Report root cause as unknown unless independently evidenced; even matching symptoms do not establish one cause. Bound workaround status as supplied verified-for-stated-scope, proposed/unverified, unavailable or unknown; never invent or execute a workaround.
4. **Write the concise report.** Lead with title and consequence, then precise expected versus actual, source/version/status, context, minimal supplied atomic actions, observations/evidence and limits. Give observed failures/attempt denominator only when known; one recorded failure is not a universal failure rate. Preserve unknown build/config and missing steps explicitly instead of filling gaps with guesses. Use the [adaptable report template](report-template.md) for detail, not a mandatory form.
5. **Propose triage, not decisions.** Recommend severity from evidenced business/security/data-integrity consequence using the adopted scale and its rationale. Without a scale use plain impact, not invented numbers. Distinguish observed impact from possible risk. Priority belongs to the accountable owner using urgency, release commitments, dependencies and context; propose it only with that basis and label it provisional. Neither severity nor priority implies field changes, an assignee or release approval. List investigation questions and the owner/owner-to-confirm for each consequential gap.
6. **Assess selected duplicates by behavior.** Compare candidate identities, actual behavior, triggering role/permissions/state/data, exact oracle/version, build/environment/configuration, affected scope and evidence. Titles are search hints only. Classify **likely duplicate**, **related**, **separate** or **inconclusive**, explaining matches, differences and missing evidence. Likely duplicate means sufficient behavioral/context alignment, not proven common root cause. Same symptom with unknown conditions is usually inconclusive or related, not automatic identity. State the supplied comparison boundary; no candidates found in incomplete material is not proof of uniqueness. Recommend owner review only: never merge/close/link or suppress new incident evidence automatically.
7. **Hand off confirmation and regression separately.** Default to a proposed/not-run plan: exact current approved oracle/version, claimed fix build and config/environment, role/state/data, supplied case/steps or mechanics still needing confirmation, expected observations, permitted effects/reset constraints and new run/attempt identity to capture at execution. Reuse the existing identity scheme; do not fabricate a completed run. Keep original failure and every new attempt distinct. Apply the confirmation rules below to actual supplied new evidence only; distinguish it from this agent's execution (none). Select justified adjacent regression candidates with risk/dependency reasons and gaps; do not imply they ran. Request only needed follow-on skills, never an automatic chain.

## Dispositions

| Disposition | Basis and limit |
|---|---|
| Evidenced mismatch | Adequate actual observation contradicts an applicable approved oracle; scope/confidence limits remain. Safe repeatability is not mandatory. Does not establish root cause. |
| Candidate defect | Credible unexpected behavior merits investigation but oracle applicability, observation or context remains incomplete. State what would resolve it. |
| Disputed expectation | Conflicting/unapproved rules or uncertain precedence prevent a firm expected outcome. Name the policy decision owner; retain the incident. |
| Setup/environment/test issue | Supplied evidence establishes an invalid test expectation or a setup/environment/configuration discrepancy explaining the reported result. State what it explains; do not infer the product is globally correct or that deployment/config problems have no product impact. |
| Insufficient evidence | Available material cannot substantiate the observation or expected/actual comparison. Preserve the concern and request the smallest useful missing evidence; do not label “not a defect” without evidence. |

## Confirmation rules

- **Still reproduces:** original mismatch remains on the new tested baseline; no fix confirmation.
- **Changed symptom:** report the new observation and its oracle separately; no clean confirmation while the required outcome remains unmet or unexplained.
- **Cannot reproduce:** describe attempts and differences; not equivalent to fixed, especially for intermittent behavior.
- **Blocked/incomplete:** unknown baseline, setup failure, skips or missing required observations prevent confirmation for that scope.
- **Fix confirmed for tested scope:** only when sufficient actual authorized/supplied new outcomes on the identified fix baseline demonstrate every relevant expected outcome with applicable role/setup/oracle and adequate evidence. State exactly what was observed and by whom/which supplied run; historical passes and a developer “fixed” label are insufficient. This is not closure, regression safety, complete AC satisfaction or release approval. An intermittent symptom needs an agreed observation basis; zero failures in limited attempts alone does not prove elimination.

## Outputs, storage and ownership

Default: chat-only report, disposition/confidence, provisional impact/triage, bounded duplicate assessment (or not assessed with reason), investigation questions and proposed confirmation/regression handoff. Scale detail to the incident; do not delay a useful serious-incident report to complete a template.

When saving is authorized, apply COMMON's destination/retention policy: durable BA artifact at an explicit authorized path or confirmed existing root/category. Ask if unresolved; do not create a defect category, config key or shadow registry. Use descriptive incident/source-baseline naming and collision-safe versions; read existing targets, preserve unrelated content and use a baseline/scoped diff for canonical updates. Retain report history and original evidence; no destructive cleanup. Report exact resolved paths/actions only after writes.

- [Manual cases](../writing-test-cases/SKILL.md) own detailed executable cases/data/cleanup; [plans](../writing-test-plans/SKILL.md) own coordinated retest governance. [Playwright authoring](../writing-playwright-tests/SKILL.md) owns requested automation, not execution.
- [Requirements change impact](../requirements-change-impact/SKILL.md) owns cross-version semantic/dependency analysis and regression proposals, not runtime confirmation. Use it only when that comparison is requested/needed.
- [Post-test evidence](../post-test-evidence/SKILL.md) owns actual run provenance, attempt history and separately authorized evidence publication, not diagnosis. Preserve its raw outcomes and identities.
- Publication remains an unresolved follow-up requiring verified defect-specific provider capability and exact destination/content/action approval. ADO Bug creation is not established here. `github-story-publishing` is stories-only and must not publish defects. No remote creation ability is promised by this skill.

## Quality checks and limitations

Check exact approved oracle versus actual observation; fact/assumption/proposal/decision separation; proportionate unknown handling; safe evidence and atomic **supplied** steps; honest attempts/frequency/scope; cause uncertainty; severity distinct from owner priority; duplicate comparison beyond titles; explicit confirmation and unrun regression limits. No automatic publishing, state/AC changes, edits to tests or cleanup. Static analysis cannot establish deployment behavior or independently confirm supplied evidence. Use the [maintenance scenarios](worked-example.md#compact-validation-scenarios) for walkthroughs, not claims of executed tests.
