---
name: applying-project-conventions
description: Use when drafting or reviewing requirements affected by project ADRs, API/list/search behavior, authorization contracts, or integration conventions.
---

# Applying Project Conventions

Build a scoped Project Contract Set from authoritative decisions to prevent contradictions without converting internal engineering choices into business requirements. Preserve the original library's pagination, authorization, and cross-story checks only where applicable, not as mandatory architecture.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md) and [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md). Inputs: target stories/AC or review scope, selected project, available approved ADR/public-contract sources and versions, and any adopted repository/config locations. No `team.yaml`, repository clone, or ADR cache is mandatory. Missing internal conventions need not block settled business behavior.

## Workflow

1. **Identify relevant contracts.** Determine whether the request concerns ordinary user-visible behavior, an API as product surface, an external integration obligation, permission registration, runtime authorization, or an explicitly technical artifact.
2. **Locate selected sources.** Prefer explicit source paths. If adopted, read `team.yaml` ADR locations (`adr.repo_path` and `adr.path`) and approved repo roots. If absent, inspect relevant local decision folders such as `docs/adr`, `docs/decisions`, or `adr` within the approved project/repo boundary. Do not traverse unrelated projects or clone/fetch repositories automatically.
3. **Verify authority and applicability.** Read status, decision outcome, contract sections, scope, version, and supersession links. Use accepted/current ADRs according to the project's actual status convention; drafts and superseded decisions are context, not governing rules. A binding external specification can govern without an ADR. Record source conflicts instead of silently preferring newer or more technical text.
4. **Build the Project Contract Set.** Extract only relevant rules using the table below. Record source/location, authority/status, classification, applicability, target artifact, and conflicts. Cite public/external contract necessity when exact technical detail is retained in AC.
5. **Check related artifacts.** Compare relevant stories, public specs, and engineering tasks for contradictory pagination, names, status/error behavior, routes, DTOs, transitions, authorization scope, and ownership claims. Internal comparisons remain separate from ordinary behavior AC. Do not add unsupported endpoints, operations, or roles to make artifacts uniform.
6. **Apply the boundary.** State observable outcomes first. Put internal design in its owning ADR/spec/task rather than prescribing it in ordinary stories. Public/integration contracts retain exact necessary values with provenance. Established conventions may expose a conflict, but do not override source intent or authorize changing the requirement.
7. **Handle unresolved conflicts/fallback.** Show competing sources and impacted behavior; ask the appropriate owner when the difference is material. Related/cross-story conflicts can be handed to `adversarial-story-review`. If sources are unavailable, document observed patterns as unverified assumptions, not an inferred authoritative contract. Proceed with supported behavior or a requested provisional draft; block only affected final requirements/actions. Do not invent a second contract shape.
8. **Report and preserve.** Return classified rules, contradictions, affected artifacts, and decisions needed. An accepted decision can resolve a formerly open question only when its applicability is established; propose affected updates within the edit scope. Do not silently rewrite every artifact or refresh configuration caches.

## Classification and targeted checks

| Rule class | Treatment |
|---|---|
| Business/application behavior | Include actor capabilities, validation supported by evidence, observable state/data outcomes, feedback and denied behavior in story/AC |
| Public product or externally mandated contract | Retain necessary exact technical requirements with authoritative source/version/location and clear scope |
| Internal engineering convention/choice | Use for contradiction detection; retain in ADR, engineering spec/task, or implementation plan |
| Unresolved internal design with settled business behavior | Do not block the behavior requirement; flag for engineering investigation |

For **list/search**, inspect relevant pagination inputs/defaults/caps, ordering/filtering, envelope/naming/media type, empty/error behavior and UI consumption. Do not adopt `limit/offset`, a page size, or HTTP statuses from a generic example. Ordinary UI AC describes visible navigation, results and empty/error outcomes; internal envelopes stay in engineering sources unless externally binding.

For **authorization**, separate:

- Registration: approved permission identifiers, exclusions, assignability, intended scope, and any evidenced default-role propagation/migration requirement.
- Consumption: actor, operation, permitted record scope, sensitive-data visibility, enforcement, and observable denial with prevented change where applicable.

Never infer that a mutation requires `Read`, that policies are conjunctive, that a role receives a new permission automatically, or that UI hiding replaces enforcement. Missing rules become questions. UI/API words do not establish owner or frontend/backend task splits.

## Outputs, persistence, and checks

Default output is a chat contract matrix and scoped review findings, not a cache update. Requested saved findings follow COMMON's durable artifact policy under a confirmed requirements/discovery category with a descriptive topic/version name. Retain them; read collision targets and report exact path/action. Canonical story edits require their selected store and scoped diff. Any proposed `adr.conventions` cache refresh requires explicit configuration-edit approval and traceable source/scope; never update timestamps just because sources were read.

Before delivery verify: authoritative source status and coverage; all retained exact contracts traceable; unsupported validation/permissions absent; internal mechanisms not promoted to business scope; fallback clearly uncertain; conflicts/decision owners explicit; no unapproved writes. This skill cannot establish authority from an existing story pattern or decide architecture for ordinary requirements.
