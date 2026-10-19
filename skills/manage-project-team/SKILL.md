---
name: manage-project-team
description: Use when reading, creating, or updating adopted team configuration, resolving story/task ownership, or preparing assignment and mention identities.
---

# Manage Project Team

Manage optional project team context without inventing ownership or treating a roster as business authorization. Preserve separate story/task ownership, repository/ADR locations, and exact-email identity safeguards. Standalone requirements do not need a roster, registry, or automatic assignment.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md) and [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). PROJECT_CONTEXT is the **canonical owner of identity resolution**, including exact-email, scope/provenance, ordered sources, ambiguity stops, and approved cache writes; follow it rather than creating a second identity policy here. Before any ADO lookup or operation read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md).

Inputs: confirmed project/config path, requested read or precise change, relevant confirmed people/emails/roles, ownership policy if any, and tracking organization/project when resolving remote identities. Missing exact targets block identity-dependent operations, not unrelated writing.

## Workflow: read or configure

1. **Confirm context and need.** Use selected project documents first. `team.yaml` and `project.yaml` are optional compatibility filenames, not host configuration schemas. If absent, proceed without assignment unless the task truly needs it. Offer creation only when useful or requested; never force setup for a draft.
2. **Read existing configuration as data.** Preserve unknown keys and existing schema. Extract only relevant roster, explicit role/capability mapping, approved default, story/task ownership policy, registry, repo/ADR locations, and tracking freshness. Tags belong to adopted project vocabulary, not automatically to role labels.
3. **Resolve ownership separately from identity.** Use explicit user/project ownership first. A task-enabled project may use its configured story owner and separate role-tagged task owners. Do not infer frontend/backend ownership from UI/API language, or QA ownership solely from the word “validate.” Multiple members per role are possible; a role alone then cannot select a person. Use only an explicitly approved default; unassigned is acceptable when project policy permits it. Otherwise ask before publishing.
4. **Draft the smallest change.** For creation collect only needed fields. Do not demand every role, one person per role, a folder-name/project-name match, a registry, or split repositories. Optional compatibility fields are described in [configuration-notes.md](configuration-notes.md), not a universal required schema. Unknown values stay omitted/null as the adopted schema permits; placeholders are never operational identities.
5. **Show and authorize the diff.** Resolve the exact canonical configuration path through COMMON. Show changed cells/sections and any ownership-policy consequences; creation or update requires scoped approval. Existing explicit approval for the exact unchanged diff need not be repeated. Reading or resolving an identity does not authorize cache writes.
6. **Apply only approved edits.** Re-read the baseline to avoid overwriting concurrent changes, preserve unrelated fields, and stop on conflicting edits. Validate adopted syntax and references with available approved capabilities; do not claim parser validation when only visually reviewed. Report exact path/action and limitations.

## Workflow: assignment or mention preparation

1. Identify the requested person by one confirmed exact email and the intended organization/project and action. Display names are labels/search hints, not proof. Duplicate roster targets or conflicting identifiers stop the identity-dependent action.
2. Follow PROJECT_CONTEXT's canonical identity sequence: scope-verified inherited identity, otherwise controlled cache, in-scope work-item identity, in-scope comment author, then available approved documented directory lookup. Later sources cannot bypass contradictory earlier evidence.
3. Keep assignment and mention identity types separate. Use the form required by the actual integration, never an assumed interchangeable GUID/email/descriptor. For a GUID-requiring operation validate GUID shape **and** exact-email evidence on the documented identity object, scope, source, and freshness. Do not invent tool names or mention payload syntax.
4. Return a non-secret resolution record: intended action/type, exact matched email, identifier, organization/project, source/location, freshness, and any limitation. Inherited records can be reused only when all required scope/provenance checks hold; report mismatches instead of silently repairing them.
5. Prepare any cache change as a separate cell-level diff with source/scope and approval. Declined caching does not invalidate a currently verified identity. Do not persist an ambiguous result or auto-refresh timestamps. Posting/assignment must follow the operational skill and ADO_MUTATIONS, including re-fetch verification; resolving identity alone is not that operation.

## Outputs and storage

Return the requested roster/context view, proposed diff, verified resolution record, or precise blocker. Configuration is canonical source, not a duplicate BA artifact. No file for read-only preparation unless requested. Retain approved config in place; any raw diagnostics use only approved native temporary storage and explicit cleanup rules. Identity provenance must be retained in the adopted cache representation or linked controlled record if a cache is approved; a bare legacy GUID without evidence is not a verified cache hit.

## Quality checks and limitations

- No unconfirmed ownership/default assignment; unresolved versus permitted-unassigned is explicit.
- Optional registry/hierarchy/task policy used only if adopted; valid types/states/fields come from approved project metadata.
- Exact identity target/type/scope/source verified; ambiguity stops dependent work, not unrelated outputs.
- No display-name-only success, descriptor transformation, cross-scope reuse, guessed payload, or silent cache write.
- Diff, collision/concurrency checks and exact paths reported; no unrelated configuration or remote action changed.

A roster cannot establish permissions, business authority, availability, account-use authorization, or a required engineering split. This skill is reusable guidance, not a request to manage a real team autonomously.
