# Optional project context and registry contract

Read when team/configuration, hierarchy, registry identities, tags, or canonical story storage are involved. Also read [COMMON.md](COMMON.md). This is a library-owned semantic contract, not an OpenCode configuration schema or a requirement to create YAML.

## Configuration discovery

Use user-selected project documentation/config first. `project.yaml`, `team.yaml`, and `testing.yaml` are optional conventional filenames used by this library. Parse as data, never execute/source them. Read existing conventions before proposing edits; do not silently migrate their keys. Missing configuration does not block standalone writing. It can block a mutation requiring an unknown target or field.

Keep these concepts separate:

| Context | Resolve when needed |
|---|---|
| Project | Description, glossary, scope/exclusions, optional phase/module map, artifact categories |
| Tracking | Selected provider/host and account; ADO org/project/team/board, area/iteration and process mappings, or GitHub repository, owner/Project and discovered field/option mappings |
| Team | Confirmed people/emails, role/capability ownership, optional approved default assignee |
| Stories | Optional registry root, hierarchy, schema, legacy mapping, tasks policy |
| Engineering | Approved repository roots, ADR locations/statuses, public contract sources |
| Testing | Test source/output roots, framework versions, baseURL/environment, approved accounts by role, secret reference names, data and retention policy |

Tags follow configured project vocabulary when present. Preserve existing exact tags; validate additions without normalizing case/spacing or silently deleting historical tags. Without a vocabulary, propose tags for confirmation; do not invent an institutional taxonomy.

## Optional canonical registry

Use only if the project adopts it. Plain stories do not need UUIDs, phases, epics, or a registry service. Project process metadata determines valid hierarchy; `Epic -> Feature -> Story/Spike -> Task` is an example, not a universal policy.

For an adopted UUID registry:
- `id`: unique immutable locally generated UUID; generate using an available standard UUID generator and check uniqueness before persistence. Never fabricate or replace an existing identity on rename/update/resume.
- `ado.work_item_id`: positive integer remote ID or null; `ado.url`: verified in-scope URL or null. Local and remote identities are never interchangeable.
- `parent`: immediate parent's local UUID, or null for a valid root. Never grandparent or remote ID.
- `related`, `depends_on`, `blocks`: local UUID lists; do not place remote numeric IDs or URLs here. Unresolved external targets stay in a mapping/review record, not a fabricated UUID.
- `type`, `title`, and hierarchy mapping: explicit approved values; never derive ADO type by capitalization, folder name, or plural stripping.
- Optional metadata: state, priority, estimate.points, owner, tags, created/updated dates, tasks. Unknown values remain null/omitted, not invented defaults.
- Example naming: `_epic-<slug>.md`, `_feature-<slug>.md`, `<story-slug>.md`; nesting follows the project's actual hierarchy, not an assumed phase migration.

Index by stable IDs and immediate parents, not paths/titles/Git status. Detect duplicate local IDs, duplicate remote mappings, missing parents, invalid types, cycles, and path collisions before mutation. Legacy `uuid` or `ado_id` fields may be read through an explicit compatibility map. A read is not migration permission; preserve the existing schema until an approved migration defines canonical output and identity preservation.

For GitHub, keep the selected host, repository owner/name, Issue node ID/number/URL, Project owner/number/node ID, and Project-item node ID distinct. One Issue can belong to multiple Projects. Preserve existing local IDs; no UUID registry is required. Proposed provider mappings are semantic concepts, not permission to add keys or migrate an adopted schema. Local mapping writeback needs its own approved exact diff. See [GITHUB_MUTATIONS.md](GITHUB_MUTATIONS.md) for discovery and recovery.

## Identity policy

Use the selected provider's documented identities. The exact-email/GUID procedure below applies to ADO, not GitHub. For GitHub resolve an explicitly supplied or confirmed host-scoped login to the actual account and documented identifier required by the operation. Do not derive a login from an email address, display name, or ADO identity. Ambiguity blocks the identity-dependent action, not unrelated drafting. Authentication and identity resolution do not establish business authority. This GitHub MVP does not assign users or post mentions.

### ADO assignment and mention identities

Assignment and mention identities are distinct contracts; use the documented identity form required by the available integration, not an inferred interchangeable GUID.

1. Resolve one exact target email from explicit user input or confirmed team data. Display name and email-local-part matches are only search hints. Duplicate roster entries or ambiguous targets stop the identity-dependent action.
2. Accept an inherited verified identity only with matching exact email (case-insensitive), organization/project, identity type, and provenance. Revalidate scope and freshness; never silently repair mismatches.
3. Otherwise consult in order: controlled cache with email/scope provenance; an in-scope work-item identity; an in-scope comment author identity; documented Graph/directory lookup if available and approved. Use later sources only when earlier sources yield no valid candidate, not to bypass contradictions.
4. Every candidate must carry the exact email in documented identity fields and the required identifier shape/type. Where the API requires a GUID, validate canonical GUID shape. Never transform a descriptor, URL fragment, display name, or unrelated GUID into the required identity.
5. Multiple exact-email candidates, conflicting GUIDs, unsupported shape, or one GUID tied to different emails stop resolution. Report non-secret evidence and ask for clarification. Identity resolution never establishes business authority or account-use authorization.
6. Cache writes require a shown cell-level diff and approval; retain source/scope and preserve unrelated fields. Declined caching does not invalidate current verified identity. Do not persist configuration automatically after posting a comment.

Ownership follows explicit project/user mappings. UI/API words do not automatically imply frontend/backend ownership. Task-enabled projects may separately configure story ownership and role-tagged task ownership. Use a default assignee only if explicitly configured and approved; unassigned is acceptable when project rules permit it. Otherwise ask before publishing.
