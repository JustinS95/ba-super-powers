# Skill registry

Use the relevant skill directly; there is no compulsory entry chain. Read the shared references required by that skill. Read integrations before synthesis when they supply necessary input, and obtain action authorization before mutations. Related skills are conditional capabilities, not an instruction to load the entire library.

## Foundations and configuration

| Skill | Select when |
|---|---|
| [using-ba-superpowers](using-ba-superpowers/SKILL.md) | You need help choosing a workflow or establishing the library's boundaries |
| [discovery-intake](discovery-intake/SKILL.md) | Important needs, evidence, scope, or decisions need clarification |
| [scope-decomposition](scope-decomposition/SKILL.md) | A request spans capabilities or needs coherent smaller slices |
| [applying-project-conventions](applying-project-conventions/SKILL.md) | Approved conventions or public contracts may affect the requested artifact |
| [manage-project-team](manage-project-team/SKILL.md) | Resolve roles, team identities, assignments, or optional project configuration |
| [writing-ba-skills](writing-ba-skills/SKILL.md) | Create or revise reusable skills and their validation scenarios |
| [continuous-skill-improvement](continuous-skill-improvement/SKILL.md) | An evidenced reusable lesson warrants an improvement proposal |

## Stories and analysis

| Skill | Select when |
|---|---|
| [writing-user-stories](writing-user-stories/SKILL.md) | Draft, refine, or slice behavior-focused stories |
| [writing-acceptance-criteria](writing-acceptance-criteria/SKILL.md) | Specify or refine observable satisfaction conditions |
| [adversarial-story-review](adversarial-story-review/SKILL.md) | Challenge connected requirements for conflicts, access gaps, lifecycle inconsistencies, or dependency errors |
| [gap-analysis](gap-analysis/SKILL.md) | Compare current/future states or intended scope against evidenced coverage |

## Documents, designs, and communication

| Skill | Select when |
|---|---|
| [writing-meeting-summaries](writing-meeting-summaries/SKILL.md) | Extract accurate decisions, actions, needs, and open questions from meeting material |
| [process-mapping](process-mapping/SKILL.md) | Describe or diagram evidenced workflows, decisions, handoffs, and exceptions |
| [figma-design-analysis](figma-design-analysis/SKILL.md) | Analyze design evidence and distinguish visible behavior from assumptions |
| [synthesize-requirements](synthesize-requirements/SKILL.md) | Reconcile multiple sources into traceable requirements |
| [writing-brds](writing-brds/SKILL.md) | Produce an audience-appropriate business requirements document |
| [writing-client-emails](writing-client-emails/SKILL.md) | Draft stakeholder communication without implying permission to send |
| [writing-release-notes](writing-release-notes/SKILL.md) | Explain evidenced released changes and limitations |
| [convert-word-to-markdown](convert-word-to-markdown/SKILL.md) | Extract usable Markdown from Word input while checking conversion loss |

## Testing and evidence

| Skill | Select when |
|---|---|
| [writing-test-cases](writing-test-cases/SKILL.md) | Derive reproducible, traceable checks from requirements |
| [writing-test-plans](writing-test-plans/SKILL.md) | Plan test/UAT scope, risks, data, environments, responsibilities, and completion criteria |
| [writing-playwright-tests](writing-playwright-tests/SKILL.md) | Author automated checks grounded in actual application and framework evidence |
| [post-test-evidence](post-test-evidence/SKILL.md) | Publish authorized test evidence and verify each separate publication outcome |

## Azure DevOps

All ADO work reads the applicable [ADO contract](../references/ADO_MUTATIONS.md). `ado-operations` owns operational composition; a task-specific skill may direct you there. No other skill defines a conflicting transport, identity, approval, retention, or retry policy.

| Skill | Select when |
|---|---|
| [ado-operations](ado-operations/SKILL.md) | Establish scoped ADO access, metadata, plans, execution, verification, or recovery |
| [fetch-ado-work-items](fetch-ado-work-items/SKILL.md) | Obtain a bounded, completeness-labeled work-item snapshot |
| [ado-work-item-creation](ado-work-item-creation/SKILL.md) | Publish approved items, hierarchy, tasks, or links |
| [sync-stories-from-ado](sync-stories-from-ado/SKILL.md) | Reconcile local story records against ADO without losing independent edits |
| [comment-on-ado-item](comment-on-ado-item/SKILL.md) | Draft or publish scoped comments and resolve mentions |
| [ado-move-board-item](ado-move-board-item/SKILL.md) | Propose or execute an approved board move using actual board metadata |
| [ado-board-blocker-analysis](ado-board-blocker-analysis/SKILL.md) | Assess blockers while accounting for useful partial work and actual dependency satisfaction |
| [ado-ready-for-work-analysis](ado-ready-for-work-analysis/SKILL.md) | Assess readiness beyond predecessor state labels |
| [ado-estimate](ado-estimate/SKILL.md) | Propose uncertain estimates using a project-defined scale and team confirmation |

## Example compositions

- **New feature:** discovery only where needed → decomposition if too broad → stories/criteria → proportionate review. Publishing is optional and separately authorized.
- **Design-backed stories:** design analysis → supported stories/criteria, with inferred behavior flagged rather than adopted as policy.
- **Requirements from backlog:** authorized read → completeness-labeled snapshot → synthesis → optional gap review.
- **Testing:** cases/plan → automation where appropriate → separately authorized execution → layered evidence review → optional authorized publication.
- **Board analysis:** read snapshot → blocker/readiness recommendation → approved exact moves → verification; a comment is a separate outcome.
