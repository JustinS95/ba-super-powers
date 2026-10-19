# Worked example: a changed approval limit

**Everything in this example is fictional:** rules, approvals, file names, identities, diffs, dependency findings and prior results. They are supplied hypothetical inputs, not facts about a real project or executed checks.

## Start with the practical question

A team raises the amount a reviewer can approve from 100 to 150 credits. A test that expected rejection at 101 is now wrong, even though its requirement ID has not changed. The non-reviewer check still matters, but it must also check the newly eligible range. Another check uses a shared fixture—a reusable test setup—that no longer represents an over-limit request. The answer is not “rerun everything mentioning approval” or “keep all previous passes.” First review the expectations and setup, then propose the checks that can meaningfully demonstrate the changed behavior and its interactions.

## Supplied before and after

The fictional owner approved `Approval policy v2 §2` over `v1 §2`; code is being compared from `build-a` to `build-b`. The selected scope is approval, its known setup consumers and one independently inspected preference check. The supplied dependency listing is complete **only for that scope**.

| Obligation | Before: v1 | After: v2 |
|---|---|---|
| AP-1 | A reviewer may approve a Pending request of 1–100 whole credits inclusive; it becomes Approved and shows confirmation. | Same actor/state/outcomes, but 1–150 inclusive. Stable ID, modified meaning. |
| AP-2 | Otherwise-valid requests over the limit are rejected and remain Pending with limit feedback. | Same behavior using the new limit. Text unchanged, effective boundary changed through AP-1. |
| AP-3 | A non-reviewer cannot approve an otherwise-valid Pending request; denial feedback appears and state remains Pending. | Unchanged. |
| AP-4 | An Approved request cannot be approved again; it stays Approved with repeat-action feedback. | Unchanged. |
| PREF-1 | A signed-in user can switch their display theme and retain it after reopening preferences. | Unchanged, independent preference behavior. |

The fictional technical diff changes only `approval-limit.ts` from 100 to 150. The inspected approval consumer listing shows `limit-data@a` is also used by the repeat-action case. `theme-data@a` and the preferences implementation do not import approval helpers or read the limit; the supplied build/config/environment comparison shows no other changes. These are the example's inspection findings, not independence inferred from file names.

## Existing checks, data and history supplied for review

These are inventory summaries, not executable cases or runnable code. Every approval case starts from its own isolated synthetic record. The fictional UI mechanics and feedback references exist in the source package; no selectors are being invented here.

| Case / automation assertion | Exact current setup and expectation | Hypothetical history |
|---|---|---|
| TC-10 / AT-10 | Reviewer, Pending, 100 credits using `limit-data@a.allowed=100`; asserts Approved state **and** confirmation. | Run R-7, attempt 0: passed. |
| TC-11 / AT-11 | Reviewer, Pending, 101 using `limit-data@a.over=101`; asserts rejected, still Pending, limit feedback. | R-7, attempt 0: passed. |
| TC-12 / AT-12 | Non-reviewer, Pending, 50 using `role-data@a`; asserts denied, still Pending, denial feedback. | R-7, attempt 0: passed. |
| TC-13 / AT-13 | Reviewer, Approved, 101 using `limit-data@a.over`; asserts blocked repeat, still Approved, repeat feedback. | R-7: skipped, no assertion outcomes. |
| TC-20 / AT-20 | Signed-in user, isolated theme data using `theme-data@a`; switches light to dark, reopens and asserts dark retained. | R-7, attempt 0: passed. |

R-7's supplied complete record identifies policy v1, `build-a`, test revision `tests-a`, fixture revision `data-a`, configuration `cfg-a` and environment `sandbox-a`, including test/project/attempt assertions. New candidates target v2 / `build-b`; configuration/environment remain `cfg-a` / `sandbox-a`. No new run has occurred. Historical records are retained unchanged.

## What to review or update, and why

| Item | Impact and proposed action, not an edit |
|---|---|
| TC-10 / AT-10 | At 100, success remains required, but this is no longer the upper boundary. Review derivation coverage; retain the ID and useful interior check. Add candidate boundary checks at 149, 150 and 151 (the domain increment is one whole credit). Exact new IDs belong to later authorized case authoring. |
| TC-11 / AT-11 | Direct semantic impact: 101 should now succeed. Propose updating its expected state/confirmation to success while retaining its identity/history. New 151 rejection coverage must not disappear when this expectation changes. |
| `limit-data@a` | `over=101` no longer means over-limit. Review all listed consumers before proposing a new fixture version with `over=151` and `allowed=150`. Do not silently overwrite historical fixture bindings. Preserve TC-10's 100 and TC-11's newly eligible 101 as explicit bindings; neither may accidentally shift with shared fixture updates. |
| TC-12 / AT-12 | Obligation and 50-credit setup need no known expectation update. Propose an additional otherwise-valid 101-credit non-reviewer check: the newly eligible range must still enforce permission. This is an unchanged obligation interacting with the changed limit, not a new permission rule. |
| TC-13 / AT-13 | Indirect impact through shared fixture. Its 101 is now amount-valid, which helps isolate the repeat guard; review binding before adopting `over=151`, which would mix invalid amount and invalid state. Propose an explicit 101-credit Approved record and keep repeat feedback assertions. |
| TC-20 / AT-20 | No identified design/data/automation impact within inspected scope: source meaning, implementation, helpers, fixture and environment/config are unchanged and dependency inspection shows independence from approval. Exclude from this targeted rerun proposal, with those references. This is not a claim of a current-build pass or global safety. |

## Candidate regression, ordered by reason rather than a quota

1. **First, newly permitted behavior and new boundary:** reviewer/Pending at 101, 149 and 150 must succeed; at 151 must reject with unchanged state and feedback. Direct change creates risk of retaining the old limit or accepting too much. Blocked on reviewed case/assertion bindings and a separately authorized fixture update. Old 100 remains a useful lower-priority interior candidate. No lower-bound cases were supplied: record that coverage gap and propose deferral only with the owner's residual-risk acceptance, not a claim that 150 covers it.
2. **Also high priority, permission interaction:** TC-12's unchanged 50-credit denial plus proposed 101-credit denial. The new eligible range must not bypass the unchanged role restriction. No policy uncertainty; additional case/assertion design still needs approval.
3. **Next, state guard/shared setup:** TC-13 with explicit Approved/101 setup and repeat feedback. It has an indirect fixture dependency and no historical asserted outcome. Fixture repair/review precedes rerun; running an invalid mixed setup would not isolate the claimed guard.
4. **Explicit exclusion:** TC-20 for the inspected independence reason above. Uninspected integrations, browsers and other modules are outside this bounded analysis, not classified unaffected. No numeric coverage target or release recommendation is implied.

All are **proposed / not run**. The fictional requirements owner can resolve policy questions; test/data maintainers must confirm the proposed bindings and fixture consumers, and the accountable release owner must accept deferred scope. Those roles are example responsibilities, not actual assigned people or permissions. No code, test, data, evidence or external system has been changed by this example.

## What the old results mean now

- R-7/AT-10 remains a historical pass at 100 for v1. Its assertions describe behavior still required at that value, so it supports that portion historically; it cannot prove the new boundary or `build-b`.
- R-7/AT-11 remains a historical passing **rejection test** at 101 under v1. That result is not applicable to v2's success obligation at 101. Do not mark the historical run failed or erase it.
- R-7/AT-12 supports the unchanged denial at 50 historically, not denial in the newly eligible range or current-build behavior. AT-13 remains skipped, never a pass. AT-20's independent historical pass does not become a new execution result.

Limitations: fictional dependency completeness is bounded; no runtime defect is established, no new assertion has run, and current-build satisfaction needs separately authorized execution and evidence review.

## Compact validation scenarios

All inputs below are fictional maintenance scenarios. Expected responses are static acceptance expectations, **not executed tests**.

| Input | Expected analysis / failure to avoid |
|---|---|
| Stable AP-1 ID, 100 → 150 | Classify semantic modification; preserve identity/history; inspect old assertions and data. Never infer unchanged meaning from ID. |
| Add an audit-visible confirmation obligation; approved retirement of a legacy email obligation | Map added obligation to checks or gap; map retired obligation to obsolete-expectation/shared-use review. No automatic deletion or retirement of tests/evidence; approval of source is not edit authority. |
| One compound AC splits into two; two others merge | Preserve old-to-new many-to-many correspondence and all role/state/feedback branches. Identify lost/new branches; do not equate renumbering with coverage or create replacement canonical IDs without authority. |
| Only titles/AC refs exist; helper consumers partly unavailable | Candidate impacts stay partial/unknown; request assertion/setup/dependency content. Missing link is not unaffected; report uninspected reach and block full-coverage claims. |
| Case metadata links AP-3, but its actual assertion only checks approval confirmation | Preserve the conflicting link and inspected assertion; do not claim permission coverage. Request mapping review, record the AP-3 coverage gap and keep affected candidates provisional. |
| Proposed limit 150 conflicts with an approved policy of 125 | Preserve both sources/versions/statuses; show conditional impacts if useful, ask decision owner. Do not choose newest or update test oracles as approved. |
| Old baseline missing; only current “approval works” text supplied | Block semantic comparison and deterministic candidate selection where dependent; return scoped inventory/questions, not an invented old limit or runtime defect. |
| Old-version run passed; current compound AC adds a permission branch | Preserve original pass and tested version; mark current applicability partial/not applicable for added meaning. No checkbox/publication/result rewrite. |
| Requirements identical; fixture role changes reviewer → administrator, or helper assertion of persisted state is removed | Trace fixture/assertion consumers, review lost role/outcome coverage and propose relevant regression despite unchanged text. Old passes do not validate changed test code/setup. No edits or runs authorized. |
| Requirements identical; product permission code or environment configuration changes | Trace affected unchanged obligations and role/config consumers; propose risk-based checks, retain uncertainty if diff/dependencies incomplete. Unchanged AC is not current-build proof. |
| User asks for chat-only “which checks next?” | Return concise plain-language delta, prioritized candidate reasons, prerequisites and exclusions; no mandatory registry, saved file, skill chain or execution. |
