---
name: github-operations
description: Use for capability-aware GitHub Issue and Project reads or approved MVP mutations, with exact scope, publication privacy, durable manifests, and uncertain-outcome recovery.
---

# GitHub Operations

Shared guidance for planning, accessing, and verifying bounded GitHub operations. Connecting requires authorization. Use directly for access/read planning and recovery; compose [story publishing](../github-story-publishing/SKILL.md) for reviewed stories [Project board](../github-project-board/SKILL.md) for board reads/Status, or [story update](../github-story-update/SKILL.md) for approved title/body edits and new comments on published Issues. Full sync and general GitHub administration are outside scope.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md), relevant adopted [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), and [GITHUB_MUTATIONS](../../references/GITHUB_MUTATIONS.md). Require mode (draft/read/write/recover), approved host/principal/connection, repository and/or owner-scoped Project identifiers, bounded source/read scope, permitted actions, and available capability evidence. Writes additionally require exact payload approval and explicit durable run paths. Recovery requires the prior manifest/checkpoints. Ask only for material unknowns; missing access/schema/authority blocks remote action, not a labeled no-write plan. Do not solicit secrets.

## Workflow

1. **Discover without expanding authority.** Inventory approved tools and real schemas, supported operations, pagination/limits, permission evidence and current host-specific documentation. Record unsupported capabilities. Existing CLI availability does not authorize shell/authentication. Exports permit analysis but do not prove current remote identity or permission.
2. **Bind scope and identity.** Verify host + authenticated account/login/node identity (or documented App context), repository and Project owner kind/IDs independently. Confirm visibility and access to each object. Keep source, Issue, Project, item, and field/option identities separate. No email/GUID substitution or implicit project/repo from current directory.
3. **Read proportionately.** Declare targets, bounds, filters, needed fields and completeness expectation; paginate all relevant/nested collections. Capture raw Markdown when needed, object kinds, missing/redacted/archived items, errors and timestamps. Stop at authorized bounds; report partial rather than infer deletion or complete coverage.
4. **Prepare no-write comparison.** Classify facts/proposals/decisions and exact requested deltas/no-actions. Apply publication privacy review. Follow [run-records](run-records.md) for immutable manifests, approved dependency placeholders, checkpoints and explicit storage. If the destination is unresolved, return chat-only proposal; no mutation proceeds without durable recovery records.
5. **Execute only the approved boundary.** Recheck target/auth/source/visibility/baselines, persist attempt start, use documented requests, inspect transport and GraphQL errors, and save results before dependents. Project Status requires an immediate narrow re-read plus explicit acceptance of the residual race; block if CAS is required. Verify material outcome by re-fetch, not returned ID alone.
6. **Stop/recover honestly.** On partial/uncertain outcome follow GITHUB_MUTATIONS reconciliation; no blind create retry, implicit rollback, or alternate account. Resume from saved operation keys and verify prior successes. Do not recreate an Issue because Project add or optional local writeback failed.

## Outputs and quality checks

Produce capability/scope/access matrix and bounded snapshot or no-write plan; when authorized, immutable manifest plus sanitized attempt/binding/verification history. Reconcile every planned operation and identity, completeness, conflicts, privacy decisions and exact paths/actions. COMMON governs storage: manifests/results are durable mutation records; snapshots saved only at approved artifact/evidence paths, collision-safe and retained; no implicit temp cleanup. See [scenarios](scenarios.md).

Limitations: no live capability/host-loader proof is supplied by this skill; current schema/permissions must be verified at use time. Out-of-scope operations remain blocked even if the transport offers them.
