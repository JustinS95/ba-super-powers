---
name: scope-decomposition
description: Use when a request contains independently deliverable capabilities, unrelated workflows, or scope too broad to prioritize and validate coherently.
---

# Scope Decomposition

Turn broad scope into reviewable business-capability slices while preserving context, shared rules, and dependencies. Multiple actors or systems are signals to inspect, not numeric gates. A single cross-system outcome may belong together; one system can contain several independent workflows.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md), and [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) for adopted scope, release/hierarchy, or storage conventions. Inputs: requested outcome, source-backed capabilities, actors, exclusions, dependencies, and any confirmed priority/release constraints. If the overall purpose is unknown, ask that first; if a scope map is requested as a provisional draft, produce it with explicit assumptions rather than require full discovery first.

## Workflow

1. **Inventory capability areas.** List functional outcomes and their sources. Examples: account access, order submission, invoice dispute, management reporting. Do not start with technical layers or invent capabilities from assumed architecture.
2. **Draw boundaries.** For each area identify purpose, users, trigger/end outcome, included/excluded behavior, shared rules, and integration/handoff edges. Keep happy path, denial, and error handling with the outcome they qualify.
3. **Check approved context.** If a project has release/module/exclusion mappings, compare them with the request. Show conflicts and proposed future-scope placement; do not silently drop an explicitly requested capability or invent phases.
4. **Map dependencies.** Distinguish confirmed prerequisite from assumption, and delivery dependency from shared terminology/data. Flag cycles and unresolved prerequisites. Do not claim parallel delivery is safe merely because two folders differ.
5. **Propose slices and priority.** Prefer independently verifiable outcomes with useful end-to-end value. State rationale and tradeoffs; priority is a proposal unless confirmed. Preserve traceability from every source capability to a slice or explicit exclusion.
6. **Confirm material scope decisions.** Ask the user to confirm a proposed breakdown/starting area when it changes requested scope or delivery order. For a requested analysis/draft, return the proposal without blocking it on approval. Do not begin unrequested downstream deliverables or operational work.
7. **Hand off the chosen slice.** Carry shared rules, provenance, assumptions, dependencies, and unknowns to `discovery-intake` only if clarification is still needed, otherwise to the appropriate deliverable skill. Do not restart completed discovery.

## Output

Use a compact map:

| Slice | Actor and observable outcome | Included/excluded boundary | Dependencies and evidence | Priority/status |
|---|---|---|---|---|
| <capability> | <who achieves what> | <bounded behavior> | <confirmed / assumed prerequisite and source> | <proposal / confirmed> |

Follow with shared rules, unmapped/conflicting source items, recommended starting point and rationale, and decisions needed. A decomposition is not an approved backlog hierarchy; apply exact work-item types/parents only when the project has adopted them.

## Keep together versus split

| Usually keep together | Consider splitting when |
|---|---|
| Happy path plus errors/denials for an outcome | Different independently verifiable outcomes have separate priorities |
| Related create/edit behavior with shared rules | Operations have different actors, decision owners, or release constraints |
| Cross-system steps completing one business outcome | Systems support unrelated workflows that can be delivered independently |
| Shared feature context with linked stories | One story contains several unrelated goals or cannot be reviewed coherently |

These are heuristics, not universal CRUD or user-count rules. Do not split ordinary requirements into frontend/backend/API layers or assume one file per story is always wrong; use the selected store's conventions.

## Persistence, checks, and limitations

Default to chat-only. A requested saved scope map is a durable BA artifact under a confirmed plans/discovery category using COMMON's destination/collision policy; use a descriptive topic/version name, retain it, and report exact path/action. No automatic registry/config/ADO changes.

Check source coverage, bounded and testable outcomes, no lost shared rule, dependency evidence, explicit priority assumptions, and confirmed versus proposed scope. Decomposition alone does not establish estimates, architecture, feasibility, or stakeholder approval.
