---
name: github-story-update
description: Use to change a published story's GitHub Issue title or body, or add a new comment to it, with exact before/after approval, a fresh baseline check, one write per operation, read-back verification, and recoverable run records.
---

# GitHub Story Update

Change Issues that were already published from reviewed stories. Typical uses: correct an Issue after the source story was refined, append an approved design reference, or post a new comment that records a change. This skill covers only three operations: replace the **title**, replace the **body**, or add one **new comment**. It doesn't publish new Issues ([github-story-publishing](../github-story-publishing/SKILL.md)), move board items ([github-project-board](../github-project-board/SKILL.md)), or decide what the story should say. Requirement changes come from the appropriate writing or review skill first.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md), relevant adopted [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [GITHUB_MUTATIONS](../../references/GITHUB_MUTATIONS.md), and [github-operations](../github-operations/SKILL.md).

**Required:**
- Exact repository and Issue identity: number plus node ID or URL.
- The reason for the change and its source: a reviewed story revision, decision, design reference or review finding.
- The **expected baseline**: the last published or approved title/body, from a prior run record, the source story, or an approved read.
- The exact intended new title and/or raw Markdown body, and/or exact comment text.
- The privacy decision, approved connection/actions, and durable run paths.

**Optional:** approved local story writeback and an approved stable comment marker.

Ask when Issue identity, baseline, content authority, visibility or the run destination is unknown. A requested edit is not approval of its exact text. If inputs are missing, return a no-write proposal and stop.

## Workflow

1. **Bind identity and source.** Verify host, repository, Issue number, node ID, URL and that the object is an Issue (not a pull request) against prior run records or provenance. Keep the local story key separate from remote identity. A title match never identifies an Issue. If the requested change alters requirements, confirm it traces to a reviewed source; this skill transports text and doesn't improve it.
2. **Read the current state.** Read title, raw body, state, labels and the comment count/latest comments as needed. Record the read time and completeness. Compare title and body with the expected baseline, allowing only known effects listed in the run record (for example, a footer the connection appended at creation).
   - If they differ, stop: show the baseline, current and intended text, and ask whether to rebase the change onto the current text. Never overwrite someone else's edit by default.
3. **Prepare exact content and the privacy gate.** Show the full before and after for each changed field, with a readable diff and SHA-256 of the exact strings to send.
   - **Body:** send the complete intended body, not a fragment. When appending, the intended body is the current body plus the approved addition.
   - **Connection-added text:** some connections add their own text, such as an attribution footer, to bodies and comments they write. Build the intended body from the story text without that addition, and list the expected stored form for each operation type as a known effect. Behavior can differ between creating and editing. For example, one connection appended a footer as-is when creating, but on an edit it removed the old footer, trimmed trailing whitespace and appended it once. Treat an unobserved operation type as unknown until its first verified use.
   - **Comment:** show the exact text. An approved marker such as `<!-- story-update: <run-key>/<op> -->` may be included for recovery; don't add one silently.
   - Recheck repository visibility. Review all content for secrets, personal data, @mentions and unapproved links. Mentions and comments can notify people, so call that out.
4. **Approve an immutable manifest.** Use the [run records](../github-operations/run-records.md) template. Each operation records:
   - the target identity,
   - the baseline hash,
   - the exact payload hash,
   - known effects,
   - verification, retry and recovery rules.

   List the no-actions explicitly: labels, assignees, milestone, state, type, Project fields, other Issues, and editing or deleting existing comments. GitHub Issue edits have **no compare-and-swap in this MVP**. The re-read in step 5 narrows the race but can't close it. The approval must accept that residual risk, or stop if atomic protection is required. One approval covers an unchanged batch; any change makes a new manifest version.
5. **Re-read, then write once.** Immediately before each operation:
   - recheck authority, visibility and source hash;
   - re-read the Issue and confirm the title/body still match the approved baseline (for a comment-only change, the Issue identity and state);
   - record the attempt start.

   Then send only the approved fields. Title/body go in one documented update request containing only `title` and/or `body`. A comment is a separate create-comment request. Never include labels, assignees, state or milestone, even with unchanged values.
6. **Verify by read-back.** Re-read the Issue:
   - **Title/body:** compare with the approved strings plus listed known effects, and confirm state, labels and assignees didn't change.
   - **Comment:** verify the returned comment ID, author, Issue and exact text.

   Persist results before dependent operations. An unexpected difference is a discrepancy: record it, stop dependent operations and report. Don't revert or retry.
7. **Recover honestly.** A timeout or lost connection is **uncertain**, not failed.
   - **Body/title:** re-read. The intended content means a recovered outcome. The baseline means it wasn't applied; ask before retrying. Anything else is a conflict to review.
   - **Comment:** list the Issue's comments (full pagination) and match the approved marker or exact text, author and time window. One match is recovered. Several matches, or none while the read is incomplete, means stop and ask. Never post blindly again.
8. **Optional local writeback.** Only after verified success, and only with a separately approved diff to the existing canonical story schema: update the local story so it matches the published text, or record the new remote state. If no mapping schema exists, keep the result in the run record and ask.

## Outputs and checks

- **No-write proposal:** a before/after table for each operation, hashes, no-actions, risks and the decisions still needed.
- **After execution:** the manifest, per-attempt checkpoints and per-operation outcomes (verified, partial, discrepancy, uncertain or blocked), with Issue and comment identities, verification times and exact retained paths.
- **Checks:**
  - no field outside the approved set was sent;
  - the baseline was checked immediately before writing;
  - verification compared exact content, not a returned ID alone;
  - discrepancies and known effects are recorded separately.

See [scenarios](scenarios.md). Out of scope:
- editing or deleting existing comments;
- reactions, labels, assignees, milestones, state changes, Issue types and fields;
- sub-issues, transfers, locking, Project mutations;
- bulk find-and-replace across unapproved Issues;
- bidirectional sync.
