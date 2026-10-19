# Adaptable defect report and handoff

Use after the [worked report](worked-example.md). This is a prose aid, not a required schema or entry gate. Unknowns are useful information; a serious or intermittent observation must not wait for every field. Reuse adopted identities/versions and project format. Do not copy secrets/PII or invent evidence.

## Report

- **Title and consequence:** concise behavior/condition and observed impact; separate possible risk.
- **Expected versus actual:** exact observable state/data/feedback versus supplied observation; authoritative source identity/location/version and approval status; applicable conditions and conflicts.
- **Context:** role/permissions, starting state/ownership, minimum synthetic inputs, supplied atomic actions; missing steps marked unknown. Build/environment/configuration known versus unknown; what was supplied versus inspected; no agent execution.
- **Observation and evidence:** existing incident/run/test/project/attempt identities, timestamp when supplied, safe references/captures and their limits; failures/attempt denominator when known, reproduction status separate from observed occurrence. Preserve all failures, retries and skips.
- **Assessment:** evidenced mismatch / candidate defect / disputed expectation / setup-environment-test issue / insufficient evidence, with basis. Bounded affected scope, exclusions/unknowns, workaround status and evidence. Root cause unknown unless independent evidence establishes it.
- **Triage proposal:** adopted severity scale/value and impact rationale, or plain impact when no scale exists. Priority separately for accountable owner/context; proposals are not field decisions.
- **Duplicate assessment:** selected candidate identities and comparison boundary; behavior, oracle/version, role/conditions/data, build/environment/config and evidence similarities/differences. Likely duplicate / related / separate / inconclusive with reasons, or not assessed. No merge/close/link.
- **Questions:** evidence or policy decision needed, why it matters, investigator/decision owner or owner-to-confirm. Distinguish hypotheses from facts.

## Confirmation and regression handoff

- **Confirmation proposed/not run:** original incident/attempt references; exact applicable oracle/version; claimed fix build/config/environment; role, starting state, isolated data, supplied steps/case version or unresolved mechanics; expected observations, evidence needed, new run/attempt identity to capture, permitted effects and scoped reset/retention prerequisites. No unsafe replay or unauthorized cleanup.
- **Actual supplied confirmation, if any:** exact new provenance/attempts, actual observations and limitations; still reproduces / changed symptom / cannot reproduce / blocked-incomplete / fix confirmed for tested scope. Preserve original history. No historical pass substitution or global fixed claim.
- **Regression proposed/not run:** justified adjacent behaviors/cases and dependency/risk basis, required oracle/setup and evidence gaps; exclusions/residual risk and accountable owner. Cases/plans/change-impact/automation only on requested need; no automatic chain.
- **Decisions/actions:** what remains for whom; no publication, state/priority/AC changes or execution performed. Publication capability/destination/action approval unresolved unless separately established by a defect-capable workflow.

## Storage when requested

Chat-only by default. Follow COMMON through the skill: explicit authorized destination or confirmed existing root/category, descriptive collision-safe name/version, read-before-update and preserve unrelated work. Retain history/evidence; no new category, configuration or registry. Report exact path/action only after a real write.
