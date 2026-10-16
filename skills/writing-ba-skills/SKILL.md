---
name: writing-ba-skills
description: Use when creating, adapting, reviewing, or revising reusable BA/QA skills, their supporting templates, or an authorized registry entry.
---

# Writing BA Skills

Author reusable, composable workflows with testable activation, explicit scope and evidence, useful task-specific mechanics, and honest validation. Adapt existing useful guidance before replacing it; a short generic checklist is not a substitute for a working domain workflow. Authoring instructions does not authorize performing the operations they describe.

## Inputs and contracts

Read [COMMON](../../references/COMMON.md). Read [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) for configuration/registry/identity behavior, [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) for tracking operations, and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md) for automated tests/evidence. Inputs: requested capability/change, allowed edit paths, current/source skills, research brief and authoritative source paths, expected host format, constraints, and definition of done.

Ask targeted questions when the authoring scope, edit authority, or essential research is missing. Request missing broad research from the coordinating user/parent rather than repeating discovery. Do not delegate or expand edits unless authorized. A requested skill revision is not permission to edit unrelated registry/configuration files.

## Decide the owner

- Extend the natural existing skill for repeated failure modes or missing quality checks.
- Create a skill for a distinct reusable multi-step workflow whose inclusion would blur another skill's purpose.
- Use supporting templates/examples for substantial format mechanics; keep the actionable workflow in `SKILL.md`.
- Put project facts in adopted project documentation/config, technical decisions in their authoritative specification/ADR, and mechanical validation in a validator when appropriate. Do not turn a one-off incident or unsupported theory into a global rule.

## Workflow

1. **Inventory the assigned source.** Read actual source files, relevant supporting files and shared contracts. Identify useful mechanics to preserve, known defects, conflicting instructions, and project-specific details to remove. Keep facts, assumptions, and proposed policy changes distinct.
2. **Verify format and external claims proportionately.** Use current authoritative host documentation when host schema/discovery behavior is material and access is permitted. Do not guess fields, tool schemas, command syntax or API versions. With offline/no-network constraints, preserve the supplied minimal format and explicitly leave host-loader validation pending rather than claiming current-documentation verification.
3. **Specify observable activation and boundaries.** Describe triggering tasks and meaningful non-triggers. Define required inputs and which unknowns block final output/actions versus allow labeled provisional drafts. Avoid mandatory entry-point loading, exhaustive chains, and universal discovery approval rituals.
4. **Write actionable mechanics.** Give numbered actions, evidence/classification rules, output structure, task-specific checks, and failure handling. Retain externally mandated contracts with provenance; do not invent business rules or permissions. Refer to shared policy rather than creating competing copies.
5. **Add useful supporting material.** Include happy-path, edge/conflict and insufficient-input examples proportionate to risk. Label hypothetical facts as example inputs, not project policy. Add templates or validation scenarios only where genuinely useful; link them locally.
6. **Persist within approved paths.** Locate the selected skills root from actual source paths. Create/update `<skills-root>/<same-name>/SKILL.md` and authorized local support files; preserve unrelated edits. Skill source is canonical library content, not a BA artifact category. Read existing targets, show/retain a scoped diff, handle collisions, and report exact paths/actions. Do not install dependencies or run shell commands without approval.
7. **Validate proportionately.** Check frontmatter, local links, source coverage, instruction consistency and examples. Walk through representative scenarios; optionally run an authorized bounded behavioral trial. Generated automated tests require framework/environment assumptions, meaningful assertions, isolated synthetic data, bounded waits, failure diagnostics, and approved side-effect/cleanup boundaries. Missing selectors/schema/auth produce blocked generation or labeled scaffolding, never ready-to-run guesses.
8. **Integrate only if authorized.** If registry/navigation files are in scope, add/update the correct entry and trigger once ready. Otherwise return a proposed entry/change to the owner. Do not assume a registry exists or rewrite other authors' work.
9. **Report evidence and gaps.** List changed files, preserved mechanics, corrected defects, actual checks, failed/unexecuted checks, assumptions, and decisions still needed. Static reasoning establishes content consistency, not runtime agent adherence or host discovery.

## Minimal source format

Use the library's supplied `SKILL.md` convention:

```markdown
---
name: example-skill
description: Use when a specific observable task or condition occurs.
---

# Example Skill

Purpose and scope.

## Inputs and contracts

Required evidence, relevant shared references, clarification rules.

## Workflow

1. Perform a concrete action.
2. Handle uncertainty/failure and produce the bounded result.

## Outputs and quality checks

Expected artifact/status, traceability, limitations and review checks.
```

Retain exact original names for adaptations. This library uses lowercase hyphenated folder-matching names and trigger-focused descriptions; do not infer undocumented host limits or silent filtering behavior. Quote YAML scalar values containing ambiguous syntax. Sections may be combined when concise; all semantic obligations below must remain clear. Additional frontmatter fields require verified host support and a real need.

## File-producing skill contract

Reference COMMON's destination policy explicitly, then state artifact-specific refinements:

- Persistence class: chat-only, durable BA artifact, canonical source/config, working evidence, mutation record, temporary diagnostic, or remote-only.
- Category/canonical store and confirmed root; optional nesting only from approved context.
- Descriptive naming/versioning and collision behavior; baseline/scoped diff for canonical updates.
- Retention and explicit scoped cleanup authorization; no automatic recursive deletion or OS-specific temp assumption.
- Exact resolved path/action reporting after actual writes; no file claims for a proposal.

Operational skills additionally need approved targets, capability/schema discovery, concurrency, durable manifests/checkpoints, uncertain-outcome reconciliation and verification. Test skills distinguish generated code, runner evidence, attachments, publishing and semantic AC coverage. No proof is implied by documentation examples.

## Validation and self-review

- Frontmatter is present, simple, folder-matching, and syntactically coherent; host discovery separately verified or explicitly pending.
- Trigger, purpose, required inputs, unknown handling, workflow, outputs, checks and limitations are actionable.
- Task-specific source mechanics survive adaptation; removed assumptions/contradictions have a documented reason.
- Requirements/examples are testable and traceable; example data does not create new business rules.
- Shared references and local support links resolve; no unsupported tools/schemas, mandatory rituals or conflicting instruction hierarchy.
- Scope/action/destination approval is explicit; no configuration or library self-modification implied by observations.
- Validation report separates static inspection, walkthrough, actual execution and unexecuted proposals.

See [validation.md](validation.md) for reusable authoring, routing, configuration, and improvement scenarios.
