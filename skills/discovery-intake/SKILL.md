---
name: discovery-intake
description: Use when a BA/QA deliverable has unclear purpose, scope, actors, outcomes, conflicting sources, or material missing requirements.
---

# Discovery Intake

Establish enough evidence for the requested deliverable without turning every request into a questionnaire. Retain the original distinction between net-new discovery and source-based intake, but scale both to risk and requested fidelity. Summarizing known meeting outcomes does not require resolving every future product decision.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) when optional project context, storage, ownership, or hierarchy affects intake. Inputs: user goal, deliverable/audience, available source IDs/versions/locations, known actors/workflows, constraints, and desired draft/readiness level. Use supplied context first; do not ask for information already present.

## Workflow

1. **State the task and evidence.** Summarize what is known and why. For net-new work start with the problem, affected users, current/future state and success outcome. For source-based work inspect relevant material, capture decisions/requirements, and disclose unreadable, missing, or out-of-scope sections. Do not claim complete coverage of unreviewed sources.
2. **Check applicable context.** Consult adopted glossary, exclusions, decision owners, and release/module boundaries only where relevant. Preserve a source/config conflict; do not silently reinterpret the source to fit configuration.
3. **Classify unknowns by this deliverable.** Use the table below. Record owner if known, impact, and evidence needed to resolve each. A requirement gap can block implementation-ready AC while not blocking a summary or provisional outline.
4. **Ask the smallest useful set.** Prioritize blocking questions, group related questions when efficient, and offer choices only when real alternatives are known. No fixed rounds, one-question-per-message rule, or exhaustive intake form. Stop asking when the output can be useful and honest.
5. **Check scope.** If unrelated workflows, independent outcomes, conflicting audiences, or release boundaries make a single deliverable hard to review, use `scope-decomposition`. Multiple users/systems alone do not force a split. Return to intake for the selected slice only if it still has material unknowns; avoid recursive ceremony.
6. **Choose readiness.** Produce an evidence-backed deliverable when sufficient. If requested, produce a labeled provisional/partial draft with unresolved rules marked and excluded from readiness claims. If a blocking unknown prevents even a meaningful draft, return the known facts, blocker, and precise question rather than fabricating content.
7. **Confirm material decisions.** Ask the appropriate decision owner to confirm proposed scope, rules, or assumptions before treating them as approved. User requests for a draft do not confirm those decisions. Do not require an extra discovery-summary approval for routine fully supported summaries.

## Unknown classification

| Class | Meaning and handling |
|---|---|
| Blocking | Changes the core actor/outcome/scope, security or business rule, or prevents a safe authorized write/action. Ask before finalizing the affected requirement/action; unaffected sections may proceed. |
| Nonblocking | Needed for a later detail or limited branch, not the supported core output. Mark unresolved, identify impact/owner, and avoid silently supplying a rule. |
| Optional | Presentation preference or enrichment that does not affect correctness. Use a stated reasonable default or omit; do not delay delivery. |

Field names do not establish locale, phone formats, password complexity, numeric ranges, name restrictions, or permissions. Discover validation and authorization from explicit sources; label candidate concerns as questions/test heuristics, not AC.

## Deliverable-focused prompts

Use only prompts relevant to actual gaps:

- **Stories/requirements:** who can do what, to which records, what changes, what is observable, what denial/exception behavior is confirmed, and what is excluded?
- **BRD:** which business problem/process, audience, success measures, governing constraints, and existing documents to reference or supersede?
- **Process map:** what starts/ends the process, who owns steps, which decisions/exception paths are known, and where handoffs occur?
- **Meeting summary:** what source/date/audience, decisions versus suggestions, and action owners/deadlines actually recorded? Missing owners stay unknown.
- **Testing:** which approved requirements/version, environment/data boundaries, expected outcomes and relevant negative branches? Generation does not authorize execution.

## Outputs and persistence

Return a compact intake result or use [intake-template.md](intake-template.md) for substantial discovery. Include source coverage, business context, scope, actors, decisions, assumptions, constraints, unknown classification, and readiness/next action. Chat-only intake remains unsaved. For a requested saved intake artifact use COMMON's durable BA destination policy, a confirmed discovery category, and a descriptive name such as `Discovery_Summary_<Topic>_<YYYYMMDD>.md`. Read collision targets; update only a selected canonical document, otherwise choose a new version. Retain saved discovery and report exact path/action.

## Quality checks and limitations

- Each asserted rule/decision has evidence or explicit confirmation; assumptions are not disguised as facts.
- Questions are proportionate and not already answered; unknowns have meaningful impact classification.
- Draft limitations survive handoff to stories/tests; unresolved rules do not become implementation-ready.
- Scope changes and saved destinations are authorized; no remote operational actions follow from intake.

Discovery organizes evidence; it cannot confer policy approval or establish facts absent from the sources. Examples and group validation are in `writing-ba-skills/validation.md`.
