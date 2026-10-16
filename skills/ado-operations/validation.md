# ADO skill validation and recovery scenarios

## Method

Review these fixtures against [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). They describe expected decisions, **not passed runtime tests**. Actual API, identity, concurrency, persistence and rendering behavior require separately authorized integration checks.

## Tabletop failure and recovery fixtures

The “required instruction outcome” column is the result expected when following the authored workflow; it does not assert a real service or file operation occurred.

| Fixture | Required instruction outcome / recovery boundary |
|---|---|
| Approved connection supports CLI but not native rich-text format verification | Do not silently downgrade verification or switch accounts; use a capable authorized transport or block affected content writes with no-write plan |
| Tool name/signature or direct REST version is unknown | Discover actual schemas/current Microsoft operation documentation and server support before construction; never invent an API/version |
| Connection/account changes during batch | Stop mutations, revalidate org/project/account and obtain changed-context approval; retain checkpoint and original operation history |
| Diagnostic error contains authorization header, `.env` text or secret fingerprint | Do not print/retain it; use sanitized status/error evidence, no credential fragments or fingerprints |
| Same display label in two area/iteration branches | Require exact IDs/full paths and approved scope; no substring/date/first-result selection |
| Query expects 41,42,43; detail returns 41,41,43 | Missing=[42], duplicate=[41]; equal count cannot verify extraction. Partial snapshot blocks complete-sync/deletion claims |
| Comments/identities have another page; first page finds no candidate | Follow continuation; no-match is not absence. If visibility remains incomplete, report unknown rather than retry non-idempotent action |
| Description is HTML; AC is Markdown | Preserve independent values/formats; analysis view is separate. No regex rewrite or irreversible conversion without exact approved delta |
| Approved manifest is changed in place or result checkpoint has unknown lineage | Block execute/resume. Recover valid retained record or propose newly approved version; do not infer authority from narrative/IDs |
| Changed baseline revision/hash before update | Stop boundary, show competing changes, approve explicit rebase; never force overwrite or change the approved payload silently |
| Parent create succeeds, response is lost, child work pending | Mark uncertain, stop children/links, exact scoped current-run reconciliation before retry. Match approved stage-specific parent expectations |
| One exact create candidate with type/source identity/material/run evidence | Re-fetch identity/revision/material, checkpoint recovered ID and then allow dependencies; title match alone is insufficient |
| No exact create candidate but search visibility is incomplete/eventually consistent | Keep uncertain; bounded approved rechecks/review, not “zero means safe to create again” |
| Two exact create/comment candidates | Stop ambiguity for review; no arbitrary candidate choice or additional duplicate write |
| Attachment upload times out and object may be unattached | Reconcile bytes/hash/name/run provenance and supported object evidence; inability to enumerate/find it is not proof no upload occurred |
| Comment post times out after verified move | Reconcile target/author/native body/hash/mentions/references/run window; do not repeat the move or blindly post the comment |
| API accepts item ID and title but omits intended fields/format | Remain unverified; re-fetch exact material, captured protected values, scope/type/parent/relations before completion |
| Expected relation count matches, but direction or one target differs | Exact directional tuples expose missing/unexpected/duplicates; stop complete verification. Same count cannot cancel drift |
| Expected direct child is replaced by a grandchild | Direct-child type/ID/immediate-parent reconciliation fails; descendant cannot satisfy expected child |
| Old terminal result has stable ID but current revision/material changed | Re-fetch/review drift; no skip based on ID/title/history alone. Retain lineage and exact approved keys |
| Verified remote create, failed local identity writeback | Partial outcome. Resume verifies saved remote ID and source identity/hash, retries only approved local writeback; never recreate remotely |
| Task-looking lines occur inside fenced examples; two real tasks share one role | Structural bounded parsing excludes examples; stable task identities require exact one-to-one mapping. No role regex bulk update |
| Duplicate local UUID/remote mapping, parent cycle or case-fold path collision | Block before local/remote mutation. Retain unknown/untracked work; no overwrite/identity regeneration |
| Remote AC changes and local AC also changes differently from baseline | Three-way conflict with both versions, provenance and owner decision; no remote-wins overwrite |
| Remote AC changes, local notes/custom metadata change independently | Preserve local-owned edits; propose only approved sync-owned field delta, verify both side baselines and exact content |
| First sync lacks two-sided baseline | Bootstrap/review mapping and authority; do not derive baseline from timestamp or assume newest value wins |
| Empty query or item moved out of area | Review absence/scope, no automatic deletion. Even proven remote deletion requires exact-path review/approval and child/link preservation |
| Parent removed but children or unknown files remain | Preserve children/unknown files; no recursive deletion, implicit reparenting, directory move or rollback |
| Local file write interrupted before checkpoint | Reconcile exact approved path, UUID/remote ID/type/parent/hash and remote revision; file existence/title alone cannot recover |
| Local sync partly completes; relation update fails | Retain verified successes and pending action history; do not advance broad success baseline/timestamp or clean manifests |
| “Clean temporary files” requested after partial run | Distinguish request scratch files from durable manifests/results/baselines/evidence. Exact paths/ownership/retention approval only; no default recursive cleanup |
| Exact email yields multiple conflicting mention IDs | Stop identity-dependent action. Canonical candidate precedence cannot bypass contradictions; no automatic cache write |
| One later comment from user addresses a different topic | Original mention is not automatically answered; use explicit thread/reference/context evidence, otherwise unresolved |
| Mention syntax accepted but UI rendering/notification cannot be observed | Verify stored payload/identities only; disclose rendering/delivery limitations, do not claim notification received |
| Estimate lacks team scale/reference items or has empty requirements | Qualitative/not-estimable proposal and targeted questions; no default one-point size, point=hour conversion or mandatory buffers |
| UI/API wording with no owner mapping | Do not assign roles or invent FE/BE tasks; resolve explicit project ownership |
| Item has two board WEF fields or split done flag true while state active | Resolve exact team-board/type mapping and split side; no first-field selection or global done inference |
| Incomplete predecessor but independent approved work remains | Apply partial-work test to every signal; FYI partial impediment under default rule, not full Blocked move |
| Closed predecessor lacks required deployed capability | No automatic unblock/readiness; match actual needed behavior/environment and all remaining constraints |
| No predecessors | No dependency evidence, not proof of readiness; apply confirmed independent-work DoR/manual triage and report outcome |
| All predecessors satisfy behavior but required access/data approval absent | Not ready/unknown under applicable confirmed DoR; do not promote from predecessor status alone |
| Same approved batch composed through analysis, move and comment | Carry exact approval reference/payload/target through without repetitive gates. Changed payload/target/state effect/risk needs new approval |

## Walked examples

1. **Exact-ID extraction:** Manually compare `[41,42,43]` and `[41,41,43]`. Required result is missing 42 and duplicate 41; the fetch instructions explicitly prevent the three-versus-three count shortcut.
2. **Two-sided conflict:** Baseline AC says “show saved status”; local adds pending status, remote adds access-denied behavior. Both changed differently. Following the merge table yields a conflict/owner decision, no automatic combined requirement or write.
3. **Dependent side effects:** Parent create uncertain → child/link blocked. Unique exact verified recovery → persist parent mapping → create child → verify child → apply approved links → verify final direct-child/relation sets. Failed comment after a verified move remains a distinct partial result and does not undo/repeat the move.

These examples illustrate expected reasoning. They do not test transport behavior, concurrency primitives, file atomicity, identity directory behavior or actual ADO rendering.

## Static and integration checklist

Check matching-name frontmatter, activation, required inputs, unknown handling, actionable workflow, outputs and limitations. Check relative links and consistency with shared contracts; no missing executable dependencies or hardcoded project transport/rules should be assumed.

Integration validation requires a separately authorized isolated environment, real schemas/tool versions, synthetic fixtures, secure approved connection and exact permitted actions/cleanup. Prove conditional-write support, pagination/limits, rich-text preservation, uncertain recovery, atomic local writes, checkpoint interruption behavior and rendering before relying on them operationally. Record actual results rather than inferring them from these fixtures.
