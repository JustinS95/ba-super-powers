# BA Super Powers

Agent skills for turning discovery notes into reviewable requirements and approved requirements into test coverage.

Also covers stakeholder documents and reviewed Azure DevOps and GitHub Projects workflows; see the [full skill registry](skills/REGISTRY.md).

## What the library covers

| Task | Skills | Outputs |
|---|---|---|
| Turn meeting notes into requirements | [writing-meeting-summaries](skills/writing-meeting-summaries/SKILL.md), [synthesize-requirements](skills/synthesize-requirements/SKILL.md) | Decisions, open questions, traceable requirements |
| Prepare a feature for development | [writing-user-stories](skills/writing-user-stories/SKILL.md), [writing-acceptance-criteria](skills/writing-acceptance-criteria/SKILL.md) | Reviewable stories, testable criteria |
| Plan acceptance testing | [writing-test-cases](skills/writing-test-cases/SKILL.md), [writing-test-plans](skills/writing-test-plans/SKILL.md) | Repeatable cases, risk-based plan |
| Assess a requirement change | [requirements-change-impact](skills/requirements-change-impact/SKILL.md) | Affected tests, evidence gaps, regression candidates |

[KitDesk](https://github.com/JustinS95/KitDesk) is a fictional example of published output: a [Project board](https://github.com/users/JustinS95/projects/3) and a [user story](https://github.com/JustinS95/KitDesk/issues/1), not an implemented or tested application.

## Getting started

Clone or download [this repository](https://github.com/JustinS95/ba-super-powers.git), then use one of the setups below. Keep the skill folders, their supporting files and the shared `references/` directory together; copying only `SKILL.md` breaks the relative links.

### Claude Code

Copy the contents of the repository's `skills/` directory into your project's `.claude/skills/`, and its `references/` directory into `.claude/references/`. Preserve this layout, keeping any existing skills and references intact:

```text
your-project/
└── .claude/
    ├── skills/
    │   ├── writing-user-stories/SKILL.md
    │   └── ...
    └── references/
        ├── COMMON.md
        └── ...
```

Start Claude Code in that project and invoke `/writing-user-stories`. See the official [skill discovery and invocation guide](https://code.claude.com/docs/en/skills).

### OpenCode V2

Keep the clone intact. Add its absolute `skills/` path to the `skills` array in your project's `opencode.jsonc`, merging with any existing entries. For example, if the clone is at `C:/work/ba-super-powers`:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": ["C:/work/ba-super-powers/skills"]
}
```

Start OpenCode in that project and mention `@writing-user-stories` in your prompt. The [V2 skills guide](https://opencode.ai/v2/docs/skills) documents external paths and explicit loading.

### Choose a task and provide the input

The [skill registry](skills/REGISTRY.md) lists task triggers and useful combinations. Select the matching skill directly; [using-ba-super-powers](skills/using-ba-super-powers/SKILL.md) can help when you are unsure. Attach or paste the relevant notes, approved criteria or requirement versions with one of these example prompts:

> Use writing-user-stories to turn these discovery notes into stories. Flag unresolved business rules.

> Use writing-test-cases to derive manual tests from these approved acceptance criteria.

> Use requirements-change-impact to compare these requirement versions and propose regression coverage.

For more examples, see the [user story guide](WRITING_USER_STORIES.md) and the fictional [test-case walkthrough](skills/writing-test-cases/worked-example.md).

## Scope and safeguards

Skills distinguish source evidence from assumptions and proposals. Publishing, board changes and test execution require explicit scope and approval; review public content for privacy before publication. Generated tests, board Status and release approval are not evidence of successful execution.

Shared contracts: [common](references/COMMON.md), [project context](references/PROJECT_CONTEXT.md), [ADO mutations](references/ADO_MUTATIONS.md), [GitHub mutations](references/GITHUB_MUTATIONS.md), and [test evidence](references/TEST_EVIDENCE.md).

## Validation and limitations

The skills guide agents; integrations and test runners supply execution capabilities. GitHub support covers Issue publication, existing-Project membership, board reads and Status changes—not bidirectional synchronization or Project creation.

[Validation](VALIDATION.md) documents the static checkers and review scenarios. Run `bash scripts/Test-Library.sh` (Bash 3.2+ and standard Unix utilities, including Git Bash on Windows) or the [PowerShell checker](scripts/Test-Library.ps1). Static checks cover inventory, frontmatter, references, registry coverage and local links, not runtime skill loading or integration reliability. Authored examples are not executed tests.

## License

Released under the [MIT License](LICENSE).
