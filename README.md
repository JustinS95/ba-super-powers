# BA Super Powers

A personal BA/QA skill library adapted from [ba-superpowers](https://github.com/JustinS95/ba-superpowers). This repository is [ba-super-powers](https://github.com/JustinS95/ba-super-powers). It retains the original 32 skill names and workflow coverage while correcting conflicting instructions, removing project-specific defaults, and strengthening evidence and recovery practices.

This is an adaptation, not an independently sourced rewrite. Repository access and these changes do not establish ownership or permission to redistribute the source. No license grant is asserted here.

## What the library covers

| Area | Capabilities |
|---|---|
| Discovery and scope | Clarify needs, assess evidence, decompose large requests, distinguish business behavior from engineering conventions |
| Stories and requirements | Write stories and acceptance criteria, review cross-story consistency, find gaps, synthesize requirements, produce BRDs |
| Documents and communication | Meeting summaries, process maps, design analysis, Word conversion, stakeholder emails, release notes |
| Testing | Test cases, risk-based test/UAT plans, Playwright test authoring, evidence publication |
| Azure DevOps | Read, create, synchronize, comment, estimate, assess blockers/readiness, and move board items |
| Configuration and maintenance | Optional project/team context, skill authoring, evidence-based improvement proposals |

See the [complete skill registry](skills/REGISTRY.md) and [user story guide](WRITING_USER_STORIES.md).

## Using the skills

Select the skill that matches the request. [using-ba-superpowers](skills/using-ba-superpowers/SKILL.md) is a routing aid, not a mandatory prerequisite. Each skill identifies the shared references it needs; read those references when directed. Load other skills only when their capability is needed.

The source files are organized as `skills/<name>/SKILL.md`, with `name` and `description` frontmatter. Configure discovery through your assistant's documented skill mechanism, or provide the selected skill and its referenced documents explicitly. This repository does not install anything, configure your agent, provide credentials, or guarantee automatic activation. When installing, preserve the relative paths to the root `references` directory; copying only an individual skill folder breaks its shared references unless you explicitly supply those documents separately.

## Key boundaries

- Source evidence, assumptions, proposals, and approved decisions are distinct.
- Unknown business rules remain questions, not invented acceptance criteria.
- Drafting is not permission to publish, run tests, change a board, or delete files.
- Approved mutations use scoped plans, durable recovery records, concurrency checks, and verification.
- Test execution, screenshots, uploaded evidence, satisfied criteria, and release approval are separate claims.
- Project configuration is optional for standalone writing. Operational tasks need the actual applicable process, identities, targets, and permissions.
- No particular operating system, shell, integration provider, authentication method, registry, or project hierarchy is assumed universally.

Shared contracts: [common](references/COMMON.md), [project context](references/PROJECT_CONTEXT.md), [ADO mutations](references/ADO_MUTATIONS.md), and [test evidence](references/TEST_EVIDENCE.md).

## Review and validation

[Validation](VALIDATION.md) describes the static checker, reusable regression scenarios, and integration checks. The PowerShell checker is at [scripts/Test-Library.ps1](scripts/Test-Library.ps1). Skill-level scenario files are maintenance aids, not extra instructions that every task must load.

These are instructional skills, not an implemented ADO client or test runner. Operational guarantees depend on the assistant and available tools actually following the instructions. No production integration or runtime skill-loading test is implied by documentation review.
