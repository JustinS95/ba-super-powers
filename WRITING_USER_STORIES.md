# Writing user stories

Use [writing-user-stories](skills/writing-user-stories/SKILL.md) for new stories, refinement, or behavioral slicing. This guide is an orientation, not a competing set of rules.

## Start with the need

Supply the problem, relevant actors, desired outcome, known behavior, boundaries, and available source evidence. An existing story, design, or rough request is enough to begin. A completed discovery document, team roster, UUID registry, or ADO connection is not required for a conversational draft.

The assistant should reuse supplied information, ask only consequential questions, and distinguish confirmed behavior from reported current behavior, assumptions, and proposals. Do not invent defaults for unknown field limits, access rules, or deadlines. A requested provisional draft can proceed while affected decisions remain visible and unresolved.

## What a useful story contains

- A coherent capability and supported value; an actor when known and relevant.
- Observable acceptance criteria, grounded in evidence rather than a guessed architecture.
- Boundaries, dependencies, and important unresolved decisions.
- Proportionate source references and clear draft/confirmation status.

The familiar “As a … I want … so that …” structure is optional. Technical enablers need not invent a human persona. Internal engineering choices belong in implementation artifacts; traceable externally binding public contracts can legitimately constrain behavior.

## Refine or slice without losing meaning

Preserve approved behavior, identities, and exclusions unless a change is authorized. Explain material changes. Split by useful end-to-end capability, not automatically by frontend/backend. Preserve supported coverage across slices and distinguish suggested sequencing from agreed priority.

Use [writing-acceptance-criteria](skills/writing-acceptance-criteria/SKILL.md) for deeper criterion refinement. For connected or consequential requirements, [adversarial-story-review](skills/adversarial-story-review/SKILL.md) checks actor/access, record ownership, lifecycle, links/security, and dependency consistency. Not every small story needs every matrix.

## Save or publish only when requested

Conversation is the default destination. An authorized file update must preserve unrelated work and use the selected canonical location. If the project adopts a UUID registry, follow its explicit identity/hierarchy contract; do not silently migrate existing records.

To publish approved text, select the destination: [ado-work-item-creation](skills/ado-work-item-creation/SKILL.md) with the shared ADO contracts, or [github-story-publishing](skills/github-story-publishing/SKILL.md) with the shared GitHub contract for repository Issues and Project membership. Approval of wording alone is not approval to write remote items. Publishing requires scoped targets, mappings, a proposed change plan, recovery records, and verification. Public GitHub publication additionally needs review of all exposed content and links; a public Project alone does not make private-repository Issues visible.
