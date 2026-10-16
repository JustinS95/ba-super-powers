# Three-way merge and local recovery

Use with [sync-stories-from-ado](SKILL.md) and [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). This is a semantic decision table, not an executable merge engine.

## Baseline model

For each stable item and synchronized field retain the last agreed local representation/hash and remote representation/revision, ownership/mapping version and format metadata. Local and remote values need not use identical encodings, but their correspondence must be confirmed and reversible or explicitly reviewed. Compare each side to its own baseline before comparing intended material. A recent timestamp, remote revision or matching title alone is not a two-sided baseline.

| Local versus local baseline | Remote versus remote baseline | Proposed treatment |
|---|---|---|
| Unchanged | Unchanged | No action; report current identity/revision/hash |
| Unchanged | Changed | Propose remote change for sync-owned fields; retain local-owned fields |
| Changed | Unchanged | Preserve local edit; show divergence, no push or overwrite |
| Changed | Changed, equivalent intended material | Propose explicit reconciliation/baseline advancement; retain identity and representations |
| Changed | Changed, different material | Conflict; show local/base/remote and ask owner to choose or approve exact merge |
| Missing baseline or incompatible mapping | Any | Bootstrap/review; no inferred remote-wins policy |

Field presence is part of material: absent, null, empty, zero and false remain distinct. Native HTML and Markdown are not equivalent merely because a stripped-text view matches. Preserve markup, checkboxes, links, ordering and format metadata. A comparison view must never become an unapproved canonical replacement.

## Path and hierarchy decisions

- Match stable local identity and remote mapping first. Path/title changes do not create a new item.
- `parent` is immediate local parent UUID only when that schema is adopted. A grandparent UUID or remote numeric parent ID is not interchangeable. Verify both endpoint identities and permitted hierarchy before planning reparenting.
- A remote parent disappearing from a query is scope/access evidence, not a command to remove its children. Preserve children and flag unresolved parent mapping. Any reparent/archive/delete is explicit.
- Plan path changes independently from field changes. For case-only renames on case-insensitive filesystems, confirm a safe available move mechanism and collision checks; do not fabricate one. Normalize for containment/collision comparison only, not by silently renaming canonical content.
- A destination occupied by different identity/type/hash is a conflict even if the title matches. Unknown/untracked files count as protected existing work.
- Remote relations outside the local index remain unresolved mapping records. No placeholder UUID or numeric value is written into UUID-only lists. Adding a target to the local store is a new scoped proposal, not implicit scope expansion.

## Absence and deletion

A query can omit an item because of filters, area/iteration movement, paging limits, permissions, deleted/removed state or transient failures. Show these distinctions. Even a complete query only proves absence from that query, not deletion from the server. Obtain explicit supporting deletion evidence where available; if inaccessible, label unknown. A proposed exact file deletion still needs user review, current local hash, ownership/retention checks, relation/child preservation and explicit approval. Do not delete a folder recursively because its parent item disappeared. A pending deletion review cannot be reported as synchronized absence.

## Recovery examples

1. **Interrupted atomic file update:** The checkpoint says in progress. Read the exact approved path and any known staging path without modifying either. If stable UUID/remote ID/type/parent/content hash and source revision match the approved result, verify/recover and checkpoint; otherwise retain both versions for review. Existence alone proves nothing.
2. **New file created, checkpoint lost:** Recover only the exact approved identity/UUID/path/material; reuse planned UUID. Do not generate a replacement UUID or infer completion from title.
3. **Move succeeded, relation write failed:** Reverify moved file and protected material, retain move success, block final baseline/timestamp and retry only the approved pending relation after drift checks. Never move it back automatically.
4. **Local edit after approval:** Baseline hash mismatch blocks that boundary. Show new competing local text, rebase with user approval and a new immutable manifest version; do not overwrite because the remote revision stayed constant.
5. **Remote edit after approval:** Re-fetch changed revision/material, stop and show a new diff even if the local hash is unchanged. Reapproval covers the changed delta, not a blind retry of stale source.
6. **Subset completed:** Preserve operation-specific results/baselines as recovery evidence. Do not advance the project's full-success timestamp or broad baseline to imply the blocked subset completed. Any later approved narrower sync has its own exact scope.

## Review fixture

Baseline AC is “show the saved status.” Local adds “include pending status”; remote adds “show an access-denied message.” Both sides changed differently. Expected instruction outcome: retain both sources, flag conflict with exact field/versions, ask whether either addition is approved business scope and show an exact proposed merge if requested. Do not combine them automatically or present either as a confirmed requirement. This is a tabletop fixture; it is not evidence of an executed sync.
