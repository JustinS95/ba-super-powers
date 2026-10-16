# Group regression scenarios

These are reusable manual instruction trials for writing-user-stories, writing-acceptance-criteria, adversarial-story-review and gap-analysis. They are not automated tests, execution evidence, or permission to access systems. All actors/records are fictional. Use supplied fixtures or create drafts in the response; no operational writes are needed.

| Scenario/input | Observable expected behavior | Failure behavior |
|---|---|---|
| Small static requirement: add “Critical” to Priority on Request Edit; no store/config provided | Produces concise sourced configuration AC; no entrypoint chain or mandatory UUID/registry; flags only material unknowns | Requires team YAML, an Epic, two stories, or a minimum AC count; invents save/validation behavior |
| Existing submit story already covers REQ-1, misses confirmed REQ-2; incomplete neighboring export | Reports Covered/Gap with story/AC sources, proposes precise addition, labels unavailable coverage unknown | Duplicates story or calls inaccessible scope New/absent |
| Refine bundled submit and search story | Preserves every requirement/old AC in replacement mapping; proposes independent behavioral slices where valuable | Loses error/access rules or splits frontend/backend by default |
| Design shows email field, no mandatory/format/duplicate policy; vague speed request | Asks scoped questions, gives known provisional draft, separates proposed rules; no invented threshold | Assumes mandatory email, uniqueness, regex, five-second SLA or error wording |
| Public contract C-1 explicitly fixes duplicate response status/field | Retains necessary exact detail with C-1 version/location; excludes internal repository design | Bans technical words or invents internal route/DTO requirements |
| Summary says support agents access all organizations; AC says own organization; related policy says assigned organizations | Access matrix cites all three, reports impact/severity and neutral options, no silent resolution | Picks newest/more detailed source or treats role as permission evidence |
| Assignment story routes requests to a queue; edit story limits access to assignee; policy allows authorized team | Distinguishes routing from authorization, asks policy owner, marks affected readiness | Assumes queue assignment grants/restricts access or adds Read to Update |
| Permission registration names confirmed Update only; no role propagation evidence | Separates registration from consuming enforcement, raises propagation investigation only if relevant | Invents Read/Delete or migration/default role behavior |
| Person external reference and Request external reference both independently editable without sync | Record matrix preserves both claims; proposes reference/snapshot/governed-sync options for decision | Invents canonical owner or synchronization rule |
| Query excludes future requests; same list AC colors future requests | Lifecycle matrix flags unreachable AC with sources, asks whether conditions differ | Marks both criteria testable/ready without checking reachability |
| Shared anonymous survey URL; recipient-specific Viewed tracking | Link matrix identifies unsupported identity attribution; offers token/verification/aggregate options as proposals | Claims recipient attribution is reliable or mandates tokens/expiry without approval |
| A prerequisite to B; B depends_on A and A blocks B | Normalizes to A -> B with both sources, no false cycle; checks adopted policy for redundancy | Calls inverse representation circular |
| Prose says A precedes B but A depends_on B; separately X depends_on Z, Y depends_on X, Z depends_on Y | Reports reversal B -> A versus prose A -> B, and cycle X -> Y -> Z -> X, with provenance; proposes correction, no silent rewrite | Flips/removes links automatically or ignores longer cycles |
| Self edge, unknown endpoint, duplicate local ID, remote numeric parent, parent used as sole dependency proof | Reports each identity/graph issue, impact and proposed resolution; no fabricated UUIDs | Treats hierarchy as sequencing or remote/local IDs as interchangeable |
| Explicit legacy alias map; existing exact tag “Review Ready”; proposed “review-ready” | Reads mapped identity without migration; preserves exact old tag and flags unapproved addition | Renames identity/tag automatically or edits legacy neighbors |
| Replacement inventory includes definition, submission and resulting case; target only names a form | Flags distinctions and possible parity gap with evidence limits; asks retirement/scope decision | Collapses records or calls missing legacy actions out of scope |
| No implementation evidence for export; current stories mention CSV; target requires PDF | Separates requirements coverage gap from unknown implemented functionality; inference labeled | Claims PDF is absent in the system solely from missing docs |
| Target undefined or disputed | Produces current-state inventory/provisional questions only; no definitive gap conclusions | Invents future state or prioritizes invented gaps |
| All supplied target requirements map completely to current evidence | Reports no identified gaps within explicit scope/evidence limits; no forced file or fake gaps | Claims global completeness or saves automatically |
| Decision resolves access; old questions/tasks remain elsewhere | Lists affected propagation, marks authorized changes versus proposed; rechecks affected rows after edits | Calls review complete while contradictory tasks/blockers remain |
| User requests review only, no write permission; screenshot claims all AC passed | Returns findings only; rejects screenshot as full semantic proof; no local/remote mutation | Saves, publishes, checks boxes, or claims test success |

## Suggested trial record

Record scenario, input/source version, actual output excerpt, expected behavior observed, discrepancies, and check method. Mark outcomes **walkthrough**, **executed manual trial**, or **unexecuted scenario**. Do not report this table itself as passing tests. Structural/link checks establish only file/link integrity, not behavior of future model invocations.
