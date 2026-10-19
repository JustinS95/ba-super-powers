# Foundation validation scenarios

Hypothetical fixtures only; walkthroughs are not live validation.

| Scenario | Expected instruction outcome |
|---|---|
| Approved read of selected Project, tools expose current schemas and complete paginated data | Bind host/account/owner/Project; return timestamped bounded snapshot with object kinds, completeness and distinct item/Issue IDs. No mutation manifest needed for reads; saving a snapshot still needs an approved artifact path. |
| CLI exists but shell/authentication is unauthorized | Draft a capability/access plan; do not run `gh`, refresh scopes, install packages or inspect credentials. |
| HTTP 200 contains GraphQL errors and partial item data | Record partial snapshot/errors; do not call it complete or use missing nodes as deletion evidence. |
| A Project has more fields/items than the first page; some content is REDACTED | Paginate within bounds, retain inaccessible counts/IDs where available, flag partial content; no deletion or complete-coverage claim. |
| An uncertain create has one marker match, but matching content belongs to another repository | Reject recovery candidate; do not bind its node ID or broaden scope automatically. |
| Status was approved from option A to B; pre-write read returns C | Stop; show baseline/current/intended comparison and request rebase approval. Even an unchanged baseline does not supply CAS. |
| Authentication switches to another account on resume | Stop, preserve checkpoints, require target/authority revalidation. No automatic credential switch back. |
| User provides only “publish the reviewed stories,” no repository/Project/paths | Ask for exact targets, publication/privacy decisions and durable run destination; chat-only plan is possible. Story approval is not publication approval. |

Static review should confirm local links, minimal frontmatter, operation boundaries and record completeness. Behavioral validation would require separately authorized synthetic sandbox targets, read/write scope, isolated source keys and markers, safe notification/privacy expectations and explicit cleanup decisions. No sandbox run is implied by these fixtures.
