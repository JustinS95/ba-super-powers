# BA Super Powers

A library of reusable skills that guide an AI assistant through business analysis (BA) and quality assurance (QA) work: clarifying needs, writing user stories and acceptance criteria, deriving test cases and plans, analyzing defects, and, when explicitly authorized, publishing to Azure DevOps or GitHub Projects.

Each skill is a Markdown instruction file that tells the assistant what evidence to gather, which steps to follow, what to produce and where to stop. The emphasis is on honest, traceable output: confirmed facts, assumptions and proposals stay separate, unknown business rules become questions rather than invented requirements, and drafting never counts as permission to publish or change anything.

## What the library covers

| Area | Examples |
|---|---|
| Discovery and scope | Clarify needs, assess evidence, split large requests into coherent slices, distinguish business behavior from engineering conventions |
| Stories and requirements | User stories, acceptance criteria, cross-story review, gap analysis, requirements synthesis, BRDs |
| Documents and communication | Meeting summaries, process maps, design analysis, Word-to-Markdown conversion, stakeholder emails, release notes |
| Testing | Test cases, risk-based test and UAT plans, change impact and regression selection, defect analysis and handoff, Playwright test authoring, test-evidence publication |
| Azure DevOps | Read, create, synchronize, comment on, estimate, assess and move work items |
| GitHub Projects | Publish reviewed stories as Issues, read a Project board, apply approved Status changes |
| Configuration and maintenance | Optional project and team context, skill authoring, evidence-based improvement proposals |

The [skill registry](skills/REGISTRY.md) lists every skill with guidance on when to select each one.

## Getting started

1. **Get the files.** Clone or download this repository. Nothing is installed, and no credentials or accounts are configured.
2. **Make the skills available to your assistant.** Use your assistant's documented skill or instruction mechanism, or supply the selected skill and the documents it references directly in the conversation. Skills live at `skills/<name>/SKILL.md` with `name` and `description` frontmatter. Automatic activation depends on your assistant and is not guaranteed.
3. **Keep the shared references.** Skills link to shared contracts in the root `references` directory through relative paths. Preserve that layout when copying or installing; copying a single skill folder on its own breaks those links unless you supply the referenced documents separately.
4. **Pick a skill and supply your material.** Give the assistant the request and whatever evidence you have: notes, an existing story, a design, a requirements document. Project configuration is optional for standalone writing.

## Choosing a skill

Start from the [skill registry](skills/REGISTRY.md). It groups the skills by area, says when to select each one and shows example compositions, such as a new feature moving from discovery to stories to review. Use the skill that matches the task directly; there is no mandatory entry chain. [using-ba-super-powers](skills/using-ba-super-powers/SKILL.md) is an optional routing aid if you are unsure where to start. Each skill identifies the shared references it needs; read those references when directed. Load other skills only when their capability is needed. For a short orientation to story writing, see the [user story guide](WRITING_USER_STORIES.md).

## Worked example

[Submitting a small request](skills/writing-test-cases/worked-example.md) is a fictional walkthrough shared by the test-case and test-plan skills. It shows how to choose a small set of useful tests around a quantity limit, ownership and state, rather than writing more tests, and it states plainly that the tests have not been run. It is a good first read to see the level of rigor the skills aim for.

## Key boundaries

- Source evidence, assumptions, proposals, and approved decisions are distinct.
- Unknown business rules remain questions, not invented acceptance criteria.
- Drafting is not permission to publish, run tests, change a board, or delete files.
- Approved mutations use scoped plans, durable recovery records, concurrency checks, and verification.
- Test execution, screenshots, uploaded evidence, satisfied criteria, and release approval are separate claims.
- Project configuration is optional for standalone writing. Operational tasks need the actual applicable process, identities, targets, and permissions.
- No particular operating system, shell, integration provider, authentication method, registry, or project hierarchy is assumed universally.

Shared contracts: [common](references/COMMON.md), [project context](references/PROJECT_CONTEXT.md), [ADO mutations](references/ADO_MUTATIONS.md), [GitHub mutations](references/GITHUB_MUTATIONS.md), and [test evidence](references/TEST_EVIDENCE.md).

## GitHub portfolio workflow

GitHub support is additive; the ADO workflows remain available. Use modern user- or organization-owned GitHub Projects, with repository Issues as the public story records rather than draft-only cards.

1. Draft and review stories and acceptance criteria using the existing writing skills.
2. Use [github-story-publishing](skills/github-story-publishing/SKILL.md) to prepare an exact publication plan, review everything for public exposure, and publish only after separate destination/action approval.
3. Use [github-project-board](skills/github-project-board/SKILL.md) to read the selected Project or apply approved Status changes. [github-operations](skills/github-operations/SKILL.md) supplies shared access, verification, and recovery mechanics.
4. Link actual implementation and test evidence when available; a board card or a Done label is not proof of implementation or successful tests.

No repository, Project, or credentials are configured by these skills. A public Project does not make private-repository Issues visible. This first version does not provide bidirectional synchronization, issue-body updates, Project creation, or automatic ADO-to-GitHub mirroring.

Example requests, with actual source paths and targets supplied by the user:

> Prepare a no-write plan to publish these reviewed stories as Issues in my selected public repository and add them to my selected Project. Show the exact public content, identity mappings, and any privacy concerns. Do not publish yet.

> Read that Project and summarize the story Issues by their discovered Status values. Report pagination or visibility gaps. Do not change Issue state or Project fields.

### Demonstration: KitDesk

[KitDesk](https://github.com/JustinS95/KitDesk) is a fictional demonstration project that shows this workflow's output: a [project board](https://github.com/users/JustinS95/projects/3) and an [example published user story](https://github.com/JustinS95/KitDesk/issues/1). It currently shows story publication and Project membership, not an implemented or tested application or validation of every skill and integration.

## Review and validation

[Validation](VALIDATION.md) describes the static checker, reusable regression scenarios, and integration checks. The PowerShell checker at [scripts/Test-Library.ps1](scripts/Test-Library.ps1) verifies the skill inventory, frontmatter, shared references, registry coverage and relative file links. Skill-level scenario files are maintenance aids, not extra instructions that every task must load.

## Limitations

These are instructional skills, not an implemented ADO/GitHub client or test runner. Operational guarantees depend on the assistant and available tools actually following the instructions. A passing static check shows the files are consistent; it does not show that an assistant loads a skill, follows it correctly, or that an external integration works. Worked examples and scenarios are authored expectations, not executed trials, and no production integration or runtime skill-loading test is implied.

## License

Released under the [MIT License](LICENSE).
