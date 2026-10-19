---
name: discovery-intake
description: Use when a BA/QA deliverable has unclear purpose, scope, actors, outcomes, conflicting sources, or material missing requirements.
---

# Discovery Intake

Establish enough evidence for the requested deliverable without turning every request into a questionnaire. Distinguish net-new discovery from source-based intake, and scale both to risk and requested fidelity. Summarizing known meeting outcomes does not require resolving every future product decision.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) when optional project context, storage, ownership, or hierarchy affects intake. Inputs: user goal, deliverable/audience, available source IDs/versions/locations, known actors/workflows, constraints, and desired draft/readiness level. Use supplied context first; do not ask for information already present.

## Workflow

1. **State the task and evidence.** Summarize what is known and why. For net-new work start with the problem, affected users, current/future state and success outcome. For source-based work inspect relevant material, capture decisions/requirements, and disclose unreadable, missing, or out-of-scope sections. Do not claim complete coverage of unreviewed sources.
2. **Check applicable context.** Consult adopted glossary, exclusions, decision owners, and release/module boundaries only where relevant. Preserve a source/config conflict; do not silently reinterpret the source to fit configuration.
3. **Choose the investigation depth.** For net-new work or a solution request with an unclear underlying problem, use the optional problem-investigation branch below. For a small settled request, use supplied evidence and clarify only material gaps; no interviews, root-cause exercise, or experiment is required. Source-based summaries need not reopen settled decisions.
4. **Classify unknowns by this deliverable.** Use the table below. Record owner if known, impact, and evidence needed to resolve each. A requirement gap can block implementation-ready AC while not blocking a summary or provisional outline.
5. **Ask the smallest useful set.** Prioritize blocking questions, group related questions when efficient, and offer choices only when real alternatives are known. No fixed rounds, one-question-per-message rule, or exhaustive intake form. Stop asking when the output can be useful and honest.
6. **Check scope.** If unrelated workflows, independent outcomes, conflicting audiences, or release boundaries make a single deliverable hard to review, use `scope-decomposition`. Multiple users/systems alone do not force a split. Return to intake for the selected slice only if it still has material unknowns; avoid recursive ceremony.
7. **Choose readiness.** State separately what can be drafted, how well the problem is supported, and what prevents implementation readiness. A confirmed problem does not approve a solution; a useful draft need not establish a root cause. If requested, produce a labeled provisional/partial draft with unresolved rules marked and excluded from readiness claims. If a blocking unknown prevents even a meaningful draft, return the known facts, blocker, and precise question rather than fabricating content.
8. **Confirm material decisions.** Ask the appropriate decision owner to confirm proposed scope, rules, or assumptions before treating them as approved. User requests for a draft do not confirm those decisions. Do not require an extra discovery-summary approval for routine fully supported summaries.

## Optional problem investigation

Use only the steps needed to inform the next decision, not an exhaustive discovery gate. Work from supplied material; missing evidence can become a proposed learning action while provisional writing proceeds.

1. **Separate the problem from the solution.** Restate the requested feature/process change as a proposal, then describe the affected group's difficulty, context and consequence without presuming that proposal fixes it. Capture the desired observable improvement separately. Unknown success measures or targets remain questions, not signed-off thresholds.
2. **Reconstruct the current process.** From relevant sources, describe trigger, steps, handoffs, ownership, exceptions, existing workarounds and consequences. Identify what is known and what is missing. Keep direct observations (with source/context), reported experiences and causal hypotheses distinct. For counts/rates record population, denominator, timeframe and selection limits when available; do not invent them or combine unlike samples. An observation supports what happened, not why it happened.
3. **Check whose experience is represented.** Identify affected groups, decision owners and missing perspectives relevant to the question: for example frequent/infrequent users, exception handlers, people with accessibility needs, or operational/support owners. Propose a small purposeful sample across materially different experiences if evidence is missing; explain what it would illuminate and what it would not represent. Do not assume the loudest stakeholder or majority can authorize policy.
4. **Test competing explanations on paper.** State plausible hypotheses supported by the context, including alternatives to the proposed solution. For each material explanation, identify supporting/contrary evidence and one neutral question or observation that would distinguish it from another explanation. Ask about actual steps and recent examples ("Where did this task stop, and what was known then?"), not agreement with a solution ("Would reminders help?"). State what next evidence would favor or weaken/reject each hypothesis; correlation and consensus are not causal proof. Do not force a root-cause ritual when the next decision does not need one.
5. **Compare proportionate options.** Where supported, consider a feature change, process/communication change, or no-build/retain-current-process option. Describe the outcome each might address, key tradeoffs/constraints and unresolved assumptions; do not invent costs, benefits, policy or technical feasibility. Hypotheses and options are not approved requirements. A business-policy contradiction stays explicit with the competing sources, affected decision and owner needed to resolve it; no automatic source precedence or stakeholder vote.
6. **Propose the smallest safe learning step.** Prefer relevant existing evidence before new collection. Specify the question/hypothesis, evidence sought, proposed method/scope and owner-to-confirm, which decision it informs, what finding would favor each option, and limitations or inconclusive outcomes. An interview, observation, survey or learning experiment is a proposal only until separately authorized; do not contact people, collect personal data, access production, or assume tools/accounts are available. If a change trial is proposed, include bounded scope, safety/stop conditions and any access/data approval needed; do not execute it. Offer a useful partial output if safe evidence gathering is unavailable.

End with decision progress: what the evidence now supports, what remains uncertain, and who needs to decide what next. Do not label a problem "confirmed" merely because stakeholders agree, or demand formal signoff for an ordinary supported draft. See the [worked examples](examples.md) for narrative reasoning before optional notation.

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

Return a compact intake result or use [intake-template.md](intake-template.md) for substantial discovery. Include source coverage, business context, scope, actors, decisions, assumptions, constraints, unknown classification, and readiness/next action. When investigating a problem, also include the relevant current-process evidence, competing explanations/options and proposed next learning decision; omit unused fields. Chat-only intake remains unsaved. For a requested saved intake artifact use COMMON's durable BA destination policy, a confirmed discovery category, and a descriptive name such as `Discovery_Summary_<Topic>_<YYYYMMDD>.md`. Read collision targets; update only a selected canonical document, otherwise choose a new version. Retain saved discovery and report exact path/action.

## Quality checks and limitations

- Each asserted rule/decision has evidence or explicit confirmation; assumptions are not disguised as facts.
- Questions are proportionate and not already answered; unknowns have meaningful impact classification.
- Draft limitations survive handoff to stories/tests; unresolved rules do not become implementation-ready.
- Problem and proposed solution remain distinct; observation, report and hypothesis retain source/context and limitations. Counts are not generalized beyond their sample.
- Investigation, when needed, distinguishes plausible alternatives and leads to a useful next decision, not a predetermined feature or mandatory research program.
- Scope changes and saved destinations are authorized; no remote operational actions follow from intake.

Discovery organizes evidence; it cannot confer policy approval, prove causality, or establish facts absent from the sources. Local examples are in [examples.md](examples.md); reusable authoring checks are in [writing-ba-skills/validation.md](../writing-ba-skills/validation.md).
