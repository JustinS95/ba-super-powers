# Optional compatibility configuration

These names describe fields found in the original BA library. They are **library-owned compatibility conventions**, not an OpenCode or ADO schema and not a reason to migrate an existing project. Read the adopted schema before editing; include only fields needed by that project.

| Concept | Original optional location | Safe handling |
|---|---|---|
| Display name | `team.yaml: project` | Confirm selected project; no folder-name equality requirement |
| Roster | `team[].name`, `team[].role`, `team[].ado_user` | Confirm people and exact emails; custom roles and shared roles are possible |
| Mention cache | `team[].ado_origin_id` | A legacy GUID alone lacks scope/email provenance; resolve/verify under PROJECT_CONTEXT before use |
| Default ownership | `default_assignee` | Use only when explicitly adopted and approved, not because a roster exists |
| Task policy | `story_format.use_tasks`, `story_format.story_assignee` | Separate story and task ownership; do not assume stories are BA-owned |
| Canonical registry | `stories.registry_root` | Only when adopted and authorized; do not create a shadow story store |
| Code roots | `repo.repo_path`, optional `repo.frontend_repo_path` / `backend_repo_path` | Locations are not ownership or required layer boundaries |
| ADR source | `adr.repo_path`, `adr.path` | Resolve within approved roots; validate relevant decision authority/status |
| Convention cache | `adr.conventions` | Optional, never authoritative, never silently refreshed |
| Sync context | `ado_tracking.area_path`, `last_synced_at`, `staleness_threshold_days` | No universal threshold; scope and completeness matter as well as time |
| Hierarchy | `story_hierarchy` or adopted process mapping | No company/release migration defaults; types/parents/states/fields require actual metadata |
| Tags | `project.yaml: work_item_policy.tags` | Preserve exact configured vocabulary and historical values; roles are not automatically tags |

## Bounded examples

- **Supported read:** selected configuration explicitly maps invoice review to one confirmed person. Return that mapping as a fact with its source. A remote assignment is a separate action requiring an approved target and verification.
- **Ambiguous role:** two members have the same role and no capability/person mapping. Return both as candidates, leave ownership unresolved, and ask who should own the affected item. Do not choose the first.
- **Legacy cache:** an `ado_origin_id` has canonical GUID shape but no exact-email/scope evidence. Treat it as an unverified candidate; follow the canonical identity sequence without using a later lookup to bypass a conflict. A verified result may be used for the scoped action while a cache write remains declined.
- **No configuration:** user asks for a story draft. Write the supported draft without creating YAML or UUIDs; surface ownership only if it matters to the requested output.
