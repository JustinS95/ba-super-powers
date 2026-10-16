---
name: writing-release-notes
description: Use when producing audience-appropriate release notes from supplied work items or authorized release sources, distinguishing verified release scope from planned, closed, merged, tested, or unverified work.
---

# Writing Release Notes

Explain what changed and why it matters, with traceable release membership and honest evidence limits. Closed/Done is not deployed; merged is not released; a test comment, checked AC, or a screenshot is not release approval.

## Contracts and required inputs

Read [COMMON.md](../../references/COMMON.md) and [PROJECT_CONTEXT.md](../../references/PROJECT_CONTEXT.md). Before any authorized ADO access read [ADO_MUTATIONS.md](../../references/ADO_MUTATIONS.md); when interpreting or reporting test evidence read [TEST_EVIDENCE.md](../../references/TEST_EVIDENCE.md).

Required: substantive change descriptions/work items; intended release/version/scope; audience; evidence or explicit user attestation of release membership/status. Confirm environment, release date/timezone and rollout/feature-flag boundaries when relevant. Unknown release scope can support a requested **provisional candidate draft**, not an unqualified shipped announcement.

- **Supplied/manual mode:** analyze provided items, release manifests, known issues and evidence without automatically fetching anything. Manual inputs are not inherently more verified than live data.
- **Authorized fetch mode:** discover real approved tools/schemas, confirmed org/project/account and exact read scope. Fetch only with authorization. No credential-file scraping, guessed API fields/tools, secret handling, team/config persistence, or automatic publishing.
- If source is absent, request it. Titles alone seldom establish behavior; ask for detail or mark entries as incomplete rather than inventing benefits.

## Workflow

### 1. Establish scope and inventory

Record release label/environment/date, audience, source IDs/revisions/versions/locations, extraction time, completeness and retrieval errors. Preserve local and remote identities distinctly where supplied. Use the actual project hierarchy and item types. Story/Bug equivalents are normally entry candidates; Epics/Features organize context and must not be promoted to shipped features solely from parent status. Spikes/tasks/internal work need explicit audience relevance rather than silent inclusion or exclusion.

For authorized tracking reads, include the applicable delivery types and defects, not just a hardcoded “User Story” query. Paginate/reconcile expected and returned items; preserve hierarchy versus dependencies separately. Existing “last release” markers are hints to confirm scope, not automatic inclusive date boundaries or permission to update configuration.

### 2. Evaluate membership and evidence separately

Create a compact internal ledger per candidate:

| Record | Meaning |
|---|---|
| Source identity/revision | What was analyzed and when |
| Delivery state | Planned, in progress, Closed/Done, unknown; not proof of deployment |
| Merge/build evidence | Relevant implementation artifact/revision if supplied; non-code changes may legitimately lack PRs |
| Test evidence | Actual reported run/environment/revision/coverage and limits, or not supplied/unverified |
| Release membership | Manifest/deployment record/version, rollout availability, or explicit named user attestation with date/context |
| Disposition | Verified release scope, attested scope, provisional candidate, excluded/deferred, or unresolved; reason and entry mapping |

Use deployment/release records or explicit release-owner/user confirmation as the basis for “released,” not a universal PR/comment/AC-checklist formula. Do not require a comment from the current account. Comment authorship and checked boxes alone establish neither tests passed nor shipped status. Never generate fake evidence, patch AC, close items, or manufacture a test gate just to make notes possible.

If only user attestation is available, state “release scope confirmed by [provided role/name]; deployment evidence not independently verified” in review notes. Do not turn attestation into independent verification. If the evidence is incomplete/conflicting, retain a candidate draft with qualifications or ask the narrow release decision question. No mandatory full stop before every draft.

### 3. Reconcile inclusion/exclusion

Account for every candidate, missing source and duplicate. Present unresolved release membership, purely internal work, uncertain classifications, and exclusions with reasons. User selection can define announcement scope but cannot make unverified deployment or tests verified. Keep planned/deferred work outside shipped sections or in a clearly separate requested preview. Consolidate multiple source items into one user change where appropriate, preserving mappings.

### 4. Classify changes

| Category | Use when |
|---|---|
| New Feature | Genuinely new user capability, workflow, page, or integration |
| Improvement | Existing capability becomes more usable, capable, or performant |
| Bug Fix | Incorrect/broken behavior is corrected, including regressions fixed within this release |

An added field on an existing form is usually an improvement; a defect fix adding a field can remain a bug fix by primary purpose. Do not mark every story New Feature. Preserve project categories if explicitly requested; flag ambiguous classification rather than inventing new scope.

### 5. Write entries from source detail

Read description, acceptance criteria and relevant context, not just title. Write 1-3 plain-language sentences explaining the observable change and source-supported value. Do not exaggerate benefits or add implementation details. Avoid copying developer titles or replacing them with a thin paraphrase.

- New feature: “Users can now [supported capability]. [Supported context/value].”
- Improvement: “[Existing capability] now [supported change].”
- Bug fix: “An issue where [supported symptom/condition] has been resolved.” Use this only for released/attested fixes, not unresolved defects.

Example with supplied evidence that filters persist across reloads: “The selected filter now stays in place after a page reload, so users do not need to reapply it.” Without persistence evidence, do not infer it from a title such as “Improve filters.”

### 6. Handle known issues

Use provided known issues in either mode, or explicitly authorized scoped reads. Determine applicability to this release/environment, user impact, conditions and documented workaround. An open bug is not automatically a relevant known issue; a board column or terminal state does not prove applicability or resolution. Discover actual process/board semantics when needed instead of guessing from names.

Write 1-3 plain-language sentences per applicable issue from description/reproduction evidence; do not reuse the title or invent workarounds, severity, security disclosures, or an ETA. Confirm sensitive disclosure scope. Unknown/incomplete search coverage means “known-issue coverage not verified,” not “no known issues.” Missing credentials/team data do not authorize configuration writes or expanded discovery.

### 7. Assemble and deliver

Use the default structure below. If both internal and external versions are requested, produce separate audience versions only as requested; retain matching scope and known-issue truth. Resolve exact saved destinations under COMMON, with collision checks and selected canonical-update versus new-record handling. No automatic tracking timestamp, board, config, or release marker updates follow a saved draft. Sending/publishing is a separate authorized action.

## Default output structure

- **Release Notes - [Scope/version]**; date/environment/rollout qualification where material; Draft/Provisional status when appropriate.
- Short introduction explaining supported scope/theme without unsupported “now available to everyone” claims.
- **New Features**, **Improvements**, **Bug Fixes**: omit empty sections; for one category a “What's New” list is sufficient.
- **Known Issues**: applicable disclosed issues, separate from delivered fixes. Include evidence coverage limits where relevant; absence of entries is not proof none exist.
- **Included Work Items** (internal audience): ID/title/type and entry mapping, limited to released/attested scope. Do not mix open bugs into this table.
- **Known Issue References** (internal audience): separate issue identities/source references.
- **Review/evidence notes**: internal ledger or compact source/scope/disposition summary with limitations and unresolved decisions. Keep internal IDs and confidential evidence out of public-facing bodies, not out of the underlying traceability.

External/client entries omit story IDs, ADO terminology, sprint references and technical mechanics unless specifically appropriate to that audience. Internal references belong in tables, not cluttering each user-facing sentence. Material availability qualifications must remain visible in the external version too.

## Checks and limits

- Every candidate accounted for; release scope source and actual verification/attestation distinguished.
- Closed, merged, tested, deployed, rolled out, and published remain distinct statuses.
- Missing PR, absent personal comment, or unchecked AC is not automatic exclusion; present actual evidence limitations.
- Categories, claims, benefits, conditions, known issues and workarounds trace to source detail.
- Partial queries, inaccessible items, missing test coverage and unknown rollout are explicit.
- No unrequested fetching, publishing, credentials access, config changes, closure or synthetic evidence.
- Exact written paths and actual actions reported. Writing notes is not testing, release approval, or deployment verification.
