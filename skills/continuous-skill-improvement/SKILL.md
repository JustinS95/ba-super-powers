---
name: continuous-skill-improvement
description: Use when completed or safely paused BA/QA work reveals an evidenced reusable correction, repeated failure, missing guardrail, verified workaround, or conflicting skill instruction.
---

# Continuous Skill Improvement

Convert meaningful observed learning into a focused proposal without noisy logs or unapproved self-modification. Routine success, speculation, and isolated mistakes already covered by a rule need no new persistent entry. Do not interrupt the primary task unless an immediate safety issue requires stopping affected work.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) for project/config/identity lessons, [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) for integration lessons, and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) before interpreting test evidence. Inputs: concrete observed/expected behavior, source or execution evidence, correction/workaround result, relevant existing rule, and current logging/edit authority. A missing evidence record is a gap, not proof of a failure cause.

## Workflow

1. **Capture a minimal signal.** Record what happened, expected behavior, evidence establishing the difference, impact, and whether it was corrected. Distinguish direct observation from hypothesis and user confirmation from inferred preference. Keep secrets and unnecessary personal/project detail out.
2. **Check usefulness and evidence.** Use the threshold below. If unsupported or nonreusable, state no persistent change recommended. A genuine project fact may belong in project records without becoming a library rule.
3. **Classify the owner.** Use the ownership table. Inspect the relevant current skill/config/source and any applicable registry entry before proposing an owner. Search for overlapping or contradictory rules; the solution may be execution compliance rather than more documentation.
4. **Choose the smallest scope.** Prefer correcting the existing natural owner, replacing/consolidating conflicting text rather than appending another checklist. Propose a new skill only for a distinct reusable workflow. Shared artifact rules belong in COMMON, identity/registry semantics in PROJECT_CONTEXT; task-specific refinements stay with their skill. Do not edit those sources unless authorized.
5. **Log only if useful and authorized.** Follow the applicable learning procedure, deduplicate, record scope/status/evidence, and reference sources rather than full transcripts. If the coordinator owns logging, return a candidate instead of writing a duplicate. Logging authorization is not skill/config-edit authorization; tentative entries are evidence, not standing instructions.
6. **Propose separately after the primary result.** Explain evidence, recurrence risk, owner, exact behavioral change, overlap to remove, expected benefit, tradeoffs, and proposed validation. Prioritize safety/data-integrity/authorization risks; batch related medium-value lessons and omit trivial convenience noise.
7. **Obtain scope approval before editing.** A proposal, logged lesson, or successful deliverable does not authorize edits. An existing request for library changes covers only its assigned paths and material scope. Ask before expanding to shared policy, registry, agents, scripts or configuration. Approval to inspect/prepare a diff is not approval to apply it.
8. **Implement approved changes through `writing-ba-skills`.** Preserve unrelated work, use available approved editing capabilities, validate the changed instructions, and update navigation/registry only if authorized. Do not perform live QA/BA actions to demonstrate the lesson without separate authorization.
9. **Verify once and report.** Check the original failure scenario, a supported path, and a relevant edge/insufficient-input case. Confirm the rule has one authoritative owner and links compose. State exactly which checks ran, what remains unverified, and whether the change actually resolves the evidenced gap. Do not call a static walkthrough a runtime success.

## Evidence threshold

A useful proposal may be supported by explicit future-facing user confirmation; authoritative current documentation/accepted contract; verified tool behavior with scope/version limits; recurrence in separate cases; a high-impact observed safety/data-integrity risk; or a demonstrable conflict/missing owner in existing instructions. These support a **proposal**, not automatic adoption.

Do not persist an unverified causal theory, temporary outage without a reusable lesson, one-off project fact as global policy, inferred preference as confirmed instruction, or a rule already clearly present. A single verified behavior may still be environment-specific; state that limit.

## Ownership guide

| Learning | Natural destination, subject to approval |
|---|---|
| Reusable workflow or deliverable-quality rule | Existing owning skill; new skill only if distinct |
| Project business fact, glossary, ownership or folder choice | Adopted project documentation/configuration |
| Technical/public contract | Authoritative specification/ADR; conventions skill references it |
| Integration mechanic and recovery | Integration skill/shared mutation contract as applicable |
| Evidence and runner semantics | Test/evidence skill or shared evidence contract |
| Mechanical enforcement | Template/validator/script, with environment assumptions |
| Tool permissions or host behavior | Verified host configuration/documentation, not an invented BA permission |
| Nonreusable or unsupported incident | No persistent change |

## Proposal format

```markdown
## Improvement proposal

- Observation and evidence: <source/version/location; fact versus hypothesis>
- Scope and recurrence risk: <where it applies, impact, limitations>
- Recommended owner: <existing source or new workflow rationale>
- Smallest proposed change: <behavior and conflicting/duplicate text to replace>
- Benefit and tradeoffs: <including additional process cost>
- Validation: <bounded scenarios and needed execution authorization>
- Approval needed: <exact paths/actions; proposed only or already authorized>
```

If no change is justified, say so without manufacturing a lesson. Request a scope decision when the right owner lies outside the authorized files.

## Outputs, persistence and checks

Return no-change rationale, a concise evidence-backed proposal, an authorized deduplicated learning entry, or an approved changed-file/validation report. Chat proposals need no file. Saved proposals are durable artifacts under an explicitly approved plans/improvement destination and COMMON's collision/retention policy; learning records use their selected canonical store/procedure, and approved skills/config remain in place. Report exact paths/actions for actual writes. Never auto-write a cache, broaden scope, or delete records as a side effect.

Check concrete evidence, appropriate scope/owner, deduplication, no interrupted delivery, explicit approval, privacy, and honest verification status. This skill cannot guarantee learning capture outside the available session context or prove an agent will follow a revised instruction at runtime.
