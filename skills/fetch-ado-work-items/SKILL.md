---
name: fetch-ado-work-items
description: Use to extract a bounded Azure DevOps work-item snapshot with original content, native formats, relations, hierarchy, revisions, and explicit completeness for downstream BA or QA work.
---

# Fetch ADO Work Items

## Purpose and activation

Retrieve source material for requirements synthesis, gap analysis, estimates, board analysis or sync. Retrieval preserves wording and technical details; it is not rewriting, interpreting, approving requirements, or creating a local registry.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md) before access. Use the available approved tool's actual schema, not guessed REST/CLI methods.

## Inputs and clarification

- Confirmed org/project/connection and read authorization; exact IDs, saved query or bounded area/iteration scope.
- Exact work-item types and relevant hierarchy from process metadata; requested fields, relations/comments, ancestor/child depth and downstream purpose.
- Explicit state filters if desired; otherwise retain all states. Team/board is needed only for board data.
- Output mode: chat source material by default, or an authorized durable snapshot path and retention.

Confirm exact area/iteration IDs and full paths against metadata, including whether scope means exact node or descendants. Ask if hierarchy expansion would cross approved bounds. Do not select a project from fuzzy credential matches, assume a particular hierarchy, require a registry for fetching, or infer scope from the working directory.

## Workflow

1. **Prepare the read contract.** Bind scope and fields. Discover actual list/detail limits, paging/continuation or query partition capabilities, field applicability and relations/format support. Read one in-scope item as a request-shape preflight before bulk access. Keep errors distinct from a successful empty response.
2. **Enumerate IDs.** Execute the exact approved query with serialized/escaped values. Record query/time/filters and source IDs. Follow continuations; if a query limit truncates without continuation, use disjoint approved partitions and reconcile overlaps or declare partial. Do not silently drop inaccessible/deleted/removed items or filter states to make counts agree.
3. **Retrieve details proportionately.** Batch under documented limits and supported field/expansion combinations. Fetch each item's stable ID, project/type/title, revision and source URL, fields with native large-text values/format metadata, and required relations. Use separate calls if field selection and relation expansion cannot coexist. Capture comments only when requested/needed, with complete paging and authors/timestamps/IDs.
4. **Reconstruct actual hierarchy.** Interpret hierarchy direction from metadata, not title/folder. Resolve each immediate parent and direct-child set, preserving distinct types such as research/spike/task when the process uses them. Traverse confirmed levels only. Fetch missing ancestors/children only within approved access scope; label unresolved and out-of-scope nodes rather than fabricating a parent. Detect duplicate edges, multiple parents, missing nodes and cycles. Hierarchy is not a dependency.
5. **Reconcile every layer.** Compare query IDs to detail IDs and expected direct-child IDs to actual direct-child identities. Report missing, unexpected and duplicate returns even when counts match. List orphan nodes and legitimately empty parents separately from extraction errors. A zero-child feature is an observation, not proof of a bad query. Flag revisions changing during extraction; label the result a non-atomic snapshot or re-read affected boundaries within approved limits.
6. **Prepare source handoff.** Keep original Markdown/HTML and independent format metadata. If downstream reasoning needs plain text, derive a separate parser-based analysis view retaining original content and provenance. Never regex-strip canonical HTML, convert formats without approval, summarize away requirements, or promote internal technical wording to confirmed business policy.
7. **Report scope and completeness before downstream use.** A partial snapshot may support explicitly limited analysis, never a complete sync/deletion decision. Retain optional snapshot artifacts only at approved destinations; temporary requests and durable snapshots are different classes. No default deletion or shell scripts are needed.

## Expected output

- Snapshot header: org/project, connection identity (non-secret), query/IDs, area/iteration bounds, filters, time, page coverage, revisions, completeness and errors.
- Item inventory with original source fields/formats, IDs/types/URLs, immediate-parent IDs, direct children and typed directional relations; comments where in scope.
- Type counts, exact ID reconciliation, hierarchy maps for configured levels, orphans, empty parents, unresolved links and out-of-scope context.
- Limitations and downstream-safe use. No synthesized requirements or registry files unless separately requested.

## Checks and examples

**Happy path:** A selected feature has two direct stories and one story has a task. Return each distinct item, feature-to-story and story-to-task maps, and all immediate ancestors in scope. The task is not counted as a direct feature child.

**Edge case:** Query expects IDs 41, 42, 43; details return 41, 41, 43. Report missing 42 and duplicate 41, not “three items fetched.” Do not authorize a deletion for 42.

**Insufficient input:** “Fetch the sprint stories” with multiple teams/iterations prompts for the exact project/team/iteration and permitted scope; provide a read plan without querying an assumed sprint.

Before handoff check source coverage, no unsolicited state filtering, native content/format preservation, exact sets not counts alone, complete/partial labels, hierarchy direction, and honest access errors. The skill cannot guarantee a point-in-time snapshot if the integration does not support one; state that limitation.
