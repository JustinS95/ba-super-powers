# Publishing walkthroughs

All identities/content below are hypothetical, not KitDesk facts or API response fixtures. Use actual discovered IDs at runtime.

## Happy path: new Issue, membership, optional Status

Input: one reviewed source key `demo-story-17`, an explicitly selected repository and Project with verified visibility/IDs, exact body/marker approved, existing option `Ready` discovered, durable run paths and mutation/race approval supplied. No local writeback requested.

Expected: immutable manifest has create -> add -> Status dependencies with typed approved bindings. Verify raw Issue title/body and identity, checkpoint Issue node ID/number/URL, then separately add and verify Project + Issue -> item ID. Re-read the exact approved initial Status baseline, set the discovered `Ready` option only if unchanged, verify and report three distinct outcomes. Preserve source file and Issue state. A private-repository/public-Project pairing cannot be advertised as publicly visible Issue content.

## Conflict: existing mapping and changed source

Input: selected source maps to a verified Issue whose body differs from reviewed local content.

Expected: show diff/provenance; do not create another Issue or update the mapped body. Ask whether to proceed with adding the existing Issue while explicitly reporting content drift, or defer for an out-of-MVP update workflow. A changed operation/content plan needs renewed approval. Do not claim latest source content is published.

## Public-content gate

Input: a public repository, private Project, and proposed body containing an internal design URL, local path and HTML-comment marker.

Expected: identify all three as publication material, withhold create pending exact content/privacy decision. A private Project does not make public repository Issues private. Removing material is a proposed payload change needing review, not silent sanitization. Unknown visibility blocks publication even if story prose was approved.

## Recovery: create timed out / add failed

Input: create request timed out after submission; checkpoint has no returned ID.

Expected: mark uncertain; read within approved repository/run bounds with open/closed Issues and complete pagination, compare exact approved marker/material and scope. One exact match can be verified and recovered; two stop; zero with incomplete visibility stops rather than retries. If create is recovered but Project add is denied, report Issue verified/add blocked; retain record and request authorized access, not delete/recreate. If optional local writeback later fails, reuse saved verified remote IDs when resuming.

## Insufficient input

Input: “publish all the stories to the roadmap,” no selected sources, owner-scoped Project, or recovery destination.

Expected: ask for bounded source set, host/repository, user/org Project URL/number, access/action/privacy approval and exact durable run folder. Do not scan every story, guess `Roadmap`, create a Project, impose UUIDs, or write run records in the current directory. Return chat-only proposed stages.

## Project-add automation discrepancy

Input: approved protected Issue state is open; create and its content verification succeeded. After Project addition, membership is present but an automation or concurrent actor has closed the Issue or changed a protected field unexpectedly.

Expected: retain the verified Issue and observed item identity, record the protected-value discrepancy and collection times, and stop optional Status/writeback mutations pending review. Do not claim the add stage fully verified, infer who caused the change, recreate the Issue, revert values, or disable automation. Known out-of-MVP effects discovered before add block it pending a separately scoped decision. Permitted initial Project Status values must be approved explicitly, not inferred from an automation name.
