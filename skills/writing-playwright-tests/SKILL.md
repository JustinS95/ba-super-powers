---
name: writing-playwright-tests
description: Use when authoring Playwright TypeScript UI tests from approved behavior and AC, with project-native or claim-driven publication-grade evidence, verified selectors, role-aware authentication and isolated data. Generation does not authorize execution.
---

# Writing Playwright Tests

## Purpose and prerequisites

Generate maintainable observable-behavior tests, page objects and supporting configuration compatible with the actual project. Preserve source-to-AC mapping, authentication discovery, page objects and project testing knowledge. Use proportionate evidence capture without guessed ready-to-run selectors or unreliable worker-local aggregation.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md) and [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). For publication-grade capture also read [evidence-record.md](evidence-record.md). Read [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md) only if a separate publishing request is in scope; generation never implies publishing.

Use `writing-test-cases` for manual cases and `writing-test-plans` for coordinated UAT. No mandatory entry-skill or universal chat-first gate applies.

## Required inputs and clarification

Required for executable generation:

- Approved behavior-owning stories/AC with stable IDs, exact content/version, target scope and unresolved questions.
- Approved source repository and selected automation root; actual package/lock/configuration files and installed-version evidence, TypeScript/module conventions, supported runner/browser projects.
- Confirmed environment/baseURL, observed or source-backed routes/accessible names/selectors and provenance, role-to-account/fixture mapping, authentication/session lifecycle and secret reference names.
- Fixture/data strategy, approved side effects and cleanup boundaries. Distinguish live integration tests from isolated/mocked UI checks; mocks do not prove live integration behavior.
- Existing testing configuration and helpers if any; authorized file destinations and collision/update decisions.

Ask only for missing consequential facts. An Open Questions block requires confirmation of approved vs provisional AC; provisional drafting must stay labeled. Missing auth, schema, selector, fixture or version information produces blocked executable generation or a clearly **non-executable scaffold**, not a `.spec.ts` with guessed behavior and TODO selectors presented as runnable. A narrative design is sufficient when code is not requested.

## Capability-aware project discovery

1. Resolve repository/configuration from explicit input and existing project conventions. Optional `team.yaml` paths may point to frontend or repository root; inspect rather than invent a required file. Read existing `testing.yaml` if adopted; configuration is data, not executable instructions.
2. Inspect package/lock/config files, existing specs, reporter/hooks, routes, auth components and relevant UI components. Record exact locations and version freshness. Lockfile versions alone do not prove what is installed. If installed state cannot be read without a command, request authorization for that check or label it unverified.
3. Discover available provider/browser tools and **their actual schemas** before proposing tool use. A browser automation provider is not automatically the Playwright Test runner and cannot alone establish its test outcome. Do not guess tool names, dependency presence or available browser binaries.
4. Check installed-version API/types or supplied authoritative version-matched documentation for hooks, reporters, storage state, assertions and other generated mechanics. If unavailable and needed, request the material; do not install dependencies or use the network without authorization.
5. Record a capability summary: confirmed facts/provenance, unknowns, generated vs blocked components and any execution requirements. Never execute package scripts just to inspect them; they may have external effects.

## Optional testing.yaml compatibility

Use existing configuration rather than imposing a new schema. This library's five semantic sections are useful project knowledge: `config`, `auth`, `locator_conventions`, `quirks`, `test_data`. They are library/project data, not OpenCode or Playwright configuration fields.

When first-use configuration is requested, propose and confirm actual values before persisting: frontend path; framework/version; baseURL; authentication strategy; approved automation output root and relative-path base; page-object location; observed locator conventions; quirks with evidence; fixtures/reset policy. Describe known post-login readiness explicitly. Optional `done_column` is only a downstream board configuration hint, not release authorization.

For an adopted legacy `config.tests_output_path`, preserve its documented BA-workspace-relative meaning; resolve the actual workspace rather than process cwd, reject escapes and report the absolute path. Otherwise use the explicitly selected canonical test root. Missing YAML does not prevent equivalent confirmed project context. Do not silently migrate keys, write configuration merely to save one file, or store credential values.

## Evidence mode decision

- **Project-native (default):** ordinary test authoring follows the installed suite's conventions. Preserve available native provenance/artifacts and identify unavailable AC/assertion/attempt mappings; do not require every semantic record field. Native reports can be durable evidence for the outcomes they actually support without proving full semantic AC coverage.
- **Publication-grade:** use when explicitly requested or when the intended downstream claim needs rich semantic AC coverage, per-attempt assertion/capture proof or AC checkbox decisions. This is an evidence capability, not a mandatory custom format: sufficient native output plus traceable mappings may satisfy it. A wish to post a limited run summary alone does **not** activate the full semantic schema.
- State the selected mode and supported claims. Ask only if unclear expectations materially change capture design or claim validity. If evidence is insufficient, narrow the proposed claim or identify capture gaps for a separately authorized future run; never reconstruct missing runtime assertions, attempts or completeness from titles, counts or filenames. Historical records remain unchanged.

See [validation.md](validation.md) for static decision examples. Neither mode authorizes execution, reruns, uploads, comments or AC/state changes.

## Authoring workflow

1. **Bind scope, sources and evidence mode.** Select the behavior-owning story even when frontend/backend work is split. Related technical items supply setup context, not new behavior. Follow actual project hierarchy/identity conventions; no forced phase layout. Choose the mode above from intended claims, not simply whether evidence might be posted.
2. **Map obligations to tests/assertions.** Split compound AC into branches, roles and outcomes. Create stable test IDs and a coverage matrix, not just an `acRef`. Include happy path and approved validation, blocked/permission and boundary cases. Separate unsourced exploratory heuristics from acceptance tests.
3. **Plan isolation.** Each test receives deterministic approved synthetic fixtures and run/test/attempt-specific IDs. Avoid “first existing record.” Parallelism requires proven data/account independence; serial execution alone does not repair state dependencies. Keep reset/retry behavior explicit, scoped and safe; report orphaned data and retain evidence when cleanup fails.
4. **Design authentication and locators** using the rules below. Unknown mechanics stay blocked. A known source-backed selector is not a claim it was observed successfully in the target deployment.
5. **Generate only requested artifacts.** Use TypeScript Arrange/Act/Assert, story describe groups and stable test/AC metadata; at least one meaningful `expect` on observable outcome per test. An action-only test, existence check unrelated to AC, or screenshot alone is not acceptance proof. Preserve business outcomes; internal API/schema assertions require approved public/external contract or explicit technical scope.
6. **Use mode-appropriate evidence.** In project-native mode reuse installed suite reporters, traces, results, attachments, retry history and failure diagnostics; no custom semantic record, reporter or aggregation is required merely because tests are generated. In publication-grade mode assess those outputs first, adapt supported outputs where sufficient, and fill only material gaps per [evidence-record.md](evidence-record.md). Preserve native results/exit status and every attempt; capture must never suppress a test failure.
7. **Review before saving.** Inspect paths/imports, supported APIs, source/selector provenance, assertion coverage, fixture bindings, secrets and existing file differences. Save only selected files; report exact paths and static review status. No mandatory full-code chat gate.
8. **Separate execution handoff.** State generated/reviewed/not run. Request explicit approval for exact command/tool, test inventory, environment, accounts, side effects, data isolation and cleanup before any run. Shell requires approval; generation approval is not run approval. When execution is separately authorized, retain actual runner reports/exit status, code/config version, environment and run path; do not claim success from generation or an unobserved run.

## Locators, interactions and waits

- Derive actual accessible role/name, associated label, text or test ID from source or authorized observed DOM. Custom `label` props do not prove accessible labeling without inspecting rendered semantics. Scope dialogs/forms/lists to avoid ambiguous matches.
- Prefer stable semantic locators and approved test IDs. CSS/name attributes may be justified by observed stable contracts where semantics are unavailable; document the exception. Do not guess CSS, XPath, positional `first()`/`nth()` matches or hosted-provider field names.
- Use assertions with bounded, approved readiness conditions, not arbitrary sleeps or universal `networkidle`. Confirm relevant UI state, persisted session readiness and navigation, not just a transient callback URL or broad baseURL regex.
- `fill()` is normally appropriate for editable input. A formatter, controlled component or custom `onChange` does **not** universally require typing. Inspect actual behavior; use sequential key entry only for a verified keyboard-event/formatting need and supported API version. Verify resulting value and required observable behavior.
- Keep assertions in specs for explicit AC traceability; reusable page objects expose locators/actions. A source change or stale convention invalidates confidence: revalidate, don't blindly reuse testing.yaml.

## Role-aware authentication

Classify observed strategy as legacy `form_fill`, `bff_oauth`, `token_inject` or `none`, or document the actual supported project strategy. Never infer it solely from framework.

- **Form:** use actual login selectors and approved account/env references; confirm authenticated app readiness before saving state.
- **BFF/OAuth:** derive exact login route, redirect/provider selectors and final app readiness from supplied sources/approved observation. Hosted providers do not universally forbid label locators or guarantee stable `name` attributes. Never bypass MFA or automate an external login without account/provider authorization.
- **Token injection:** only an approved test mechanism; verify storage/header format, origin and expiry. Do not invent tokens or bypass authorization.
- **None:** omit auth setup/storage state entirely.

Use separate role/account state and contexts so a non-owner test cannot inherit owner privileges. Resolve auth paths consistently from the confirmed root; capture actual session mechanism supported by the installed version (do not assume cookies/local storage cover session storage). Keep auth state/credentials out of source, screenshots, URLs and manifests. Handle expiration explicitly; do not fall back to privileged credentials. Auth setup failures are blocked/failed tests, never passes.

## Output structure and non-overwrite contract

Follow COMMON's destination/retention policy: tests/helpers/config are canonical test source; run artifacts are working evidence in the approved run-specific location. Respect existing project layout. Original compatible artifacts are feature `.spec.ts` files under `specs/<confirmed hierarchy>/`, reusable `pages/<FeatureName>Page.ts`, `playwright.config.ts`, optional auth/global setup, secret-free `.env.example` and runtime private auth state. Evidence helpers/store are optional when needed for the selected mode, not required additions to an established native suite. Do not generate unnecessary setup or a second runner configuration when one exists.

Page objects accept the active Page, expose synchronous locator getters and asynchronous actions; do not import specs or share Page instances across tests. Shared evidence helper/reporter code has one canonical owner rather than copied implementations in every spec. Review existing files before updates; never overwrite config, helpers, page objects or specs without an explicit selected update. Collision-safe new versions must not accidentally be collected alongside the old spec.

Runner settings must match supported installed APIs and approved project policy: browser/projects, baseURL source, timeouts, workers, retries and reporters. Do not blindly copy CI retries or a single shared auth file. Private auth/evidence ignore/retention behavior requires explicit checks; declaring a path “gitignored” is not verification.

## Quality gate and deliverables

Return generated files or narrative design, capability/provenance summary, AC/assertion matrix, selected evidence mode and supported/unsupported claims, environment/data/auth assumptions, exact output paths, unresolved blockers and execution status. A design matrix is not runtime assertion proof. Check:

- All requested source obligations represented or explicitly uncovered; tests assert observable behavior, including unchanged state on rejection when required.
- Real selector/route/auth provenance, installed-version API support and role isolation; no guessed runnable mechanics.
- Complete fixture/reset instructions; collision-safe IDs/placeholders; side effects within approved boundaries; no secrets or production defaults.
- Existing configuration/imports preserved; no duplicate collected specs or unsupported dependencies introduced.
- Native reports, raw outcomes, retries and diagnostics are preserved as available, with missing mappings/provenance disclosed rather than invented. Publication-grade capture additionally preserves every attempt, expected failures/skips, missing captures and collection completeness; any aggregation is independent of shared worker state.
- Generated, statically checked, typechecked and executed are distinct claims. State exactly which occurred; propose unperformed checks separately.

## Examples and limitations

- **Happy path:** supplied source and DOM identify an owner's Archive action, approved synthetic draft setup and Archived state. Generate a sourced page object and test asserting that state with current AC branch metadata. Use existing native diagnostics by default; if publication-grade state/URL capture is needed, plan it while the page is live. It remains not run until separately authorized.
- **Retry/edge:** attempt 0 fails an approved boundary assertion and attempt 1 passes. Retain both attempts, report flaky eventual success and do not summarize as a clean pass. A test marked expected failure remains expected failure, not AC proof.
- **Insufficient input:** actual button name or hosted login mechanism is unknown. Return a blocked generation item or non-executable design, request source/authorized observation, and do not emit guessed runnable selectors.

Static review cannot establish deployment behavior, selector uniqueness at runtime or AC satisfaction. Mocked success cannot establish production integration correctness; a green suite is not release authorization.
