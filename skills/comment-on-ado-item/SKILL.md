---
name: comment-on-ado-item
description: Use to scan selected ADO work items for actionable mentions, draft grounded replies, or post approved standalone comments with exact identity resolution, duplicate-safe recovery, and read-back verification.
---

# Comment on ADO Item

## Purpose and modes

Own comment posting mechanics, not board moves or ongoing inbox monitoring.

- **Mode A — Reply to mentions:** bounded scan of selected items, classify confirmed/possible mentions, gather context, draft responses and post only approved entries.
- **Mode B — Standalone comment:** exact item and approved text, directly or composed after a verified move/upload. Reuse the caller's unchanged authority and evidence; no repetitive bootstrap gate.

Read [COMMON](../../references/COMMON.md), [PROJECT_CONTEXT](../../references/PROJECT_CONTEXT.md), [ADO_MUTATIONS](../../references/ADO_MUTATIONS.md), and [ado-operations](../ado-operations/SKILL.md). For test-result comments/attachments read [TEST_EVIDENCE](../../references/TEST_EVIDENCE.md). Comments are remote outputs, but every posting run still needs a durable mutation manifest/results; a separate prose report is optional.

## Required inputs and clarification

Require confirmed organization/project/connection and authorized read/post scope, exact positive integer item IDs or verified in-scope item URLs, requested mode, content/context or source comment references, and durable run destination/retention. Mode A requires the user's exact confirmed email/identity and scan bounds; Mode B requires exact approved text and optional mention targets/attachment references. Team/board is not needed merely to comment.

Parse user-supplied IDs/URLs as data, validating host/org/project and item identity; a numeric suffix on an arbitrary URL is insufficient. Ask about missing recipient, action authority, identity ambiguity or unsupported rendering. Do not infer authority to make decisions, commitments, approve scope or impersonate another account from a mention or a first-person draft.

## Mode A workflow

1. **Fetch complete scoped context.** Retrieve selected items' current identity/revision, title, description, AC/native formats and all in-scope comments with stable IDs, authors, creation/edit times and reply linkage where supported. Paginate/reconcile item and comment sets; label inaccessible/partial histories. Native source is retained; a separate safe parsed-text view may assist analysis without rewriting it.
2. **Identify mentions precisely.** Resolve the user through PROJECT_CONTEXT's exact-email/scope/identifier-type policy. Match structured mention identities when the integration supplies them, or exact verified email evidence. Display names, local parts and plain `@Name` are discovery hints only; mark ambiguous hits “possible mention” for confirmation, not confirmed notifications. Do not automatically write `.env` or cache values.
3. **Determine addressed status using actual context.** Prefer supported reply/thread references and explicit response content addressing that mention. A later comment from the user somewhere on the same item does not prove the question was answered. Classify as addressed, needs response, FYI, possible mention, or unclear; retain source IDs and rationale. Partial history cannot establish no reply.
4. **Classify intent.** Questions, requests for decisions/reviews, clarification and unresolved blockers may need response; visibility-only tags, completion notices and automated messages may be FYI. Read chronology, negation and edits; an old “blocked” phrase may have been resolved. Present FYIs and uncertainties briefly, without posting or discarding them silently.
5. **Gather only needed context.** Use current work-item fields, relevant linked sources/comments and approved requirements. Design links are pointers, not permission to download or broaden research. If a question needs design analysis, use approved available source context or ask for the specific missing artifact; do not require an automatic full design workflow for every link.
6. **Draft grounded replies.** Address the actual request, cite relevant source/version, separate facts, assumptions and proposed decisions, and mark questions that cannot be answered. First-person wording can be drafted for the user to approve but cannot invent their commitments or business authority. Do not invent requirements or claim tests ran based on an image or passed-count summary.
7. **Present one batch.** For each entry show item ID/title, original comment ID/author/date/excerpt, classification, proposed exact reply, mention identities/notifications and attachment references, prerequisites and approve/edit/skip choice. An edited payload requires approval of that delta; unchanged entries carry forward.

## Mode B and shared posting workflow

1. **Resolve target and prerequisites.** Re-fetch correct in-scope item identity and any source comment/version the reply depends on. Confirm approved move/upload prerequisite evidence before a dependent comment. A comment saying “moved” must not precede verified movement. Changed source context that invalidates the approved response stops for review; do not silently revise it.
2. **Resolve each mention before approving final payload.** Follow PROJECT_CONTEXT's canonical sequence: exact target email from user/confirmed roster; verified inherited identity with matching email/scope/type/provenance; controlled cache; in-scope work-item identity; in-scope comment author; approved documented directory lookup when earlier sources yield no valid candidate. Every candidate needs exact email in documented identity fields and the identifier type/shape required by the integration. Contradictory or multiple exact-email candidates stop; do not bypass them with a later source. A descriptor or arbitrary GUID is not a mention GUID.
3. **Keep cache changes separate.** No automatic identity cache write before/after posting. A cache proposal needs a cell-level diff, provenance/scope and approval; declining persistence does not invalidate a verified current identity. Assignment identity and mention identity are not interchangeable.
4. **Construct safe native content.** Discover the actual integration's supported comment format/mention contract. Escape untrusted text, labels and URLs; serialize request JSON rather than interpolating source into code. If the documented supported contract uses HTML mention anchors, an illustrative form is `<a href="#" data-vss-mention="version:2.0,{verified-mention-id}">@Escaped label</a>` inside a valid container such as `<div>…</div>`. This is not proof every tool/version accepts that syntax; verify its real schema/documentation first. Preserve approved wording and intended formatting. Plain `@Name` is not proof of a real notification. If true mentions are unsupported, ask whether to post explicitly non-notifying text or stop.
5. **Plan exact posting actions.** Save immutable manifest with item/project identity, comment operation key, approved native body/format/hash, author/account context, verified mention identities, source comment/version, attachment IDs/URLs/hashes, dependency evidence, exclusions and verification expectations. Distinguish uploads from comment posting. Approval is needed before the first upload, not merely before the comment.
6. **Post once and checkpoint.** Recheck connection, exact payload approval and current prerequisites; use the real supported operation. Capture sanitized transport status, returned comment ID/version/time and errors. Successful POST is `succeeded_unverified`; don't claim rendered success from an ID.
7. **Re-fetch and verify.** Read back the exact comment by ID and verify target, author/account, approved body/native format, mention identities/anchors and attachment references against the manifest. Inspect rendered presentation when available and authorized; if not, distinguish verified stored content from unverified rendering/notification delivery. Do not claim someone was notified solely because the anchor exists.
8. **Reconcile uncertain outcomes before retry.** A timeout may have posted successfully. Paginate exact target's scoped current-run comments and compare author, body/format/hash, source/reply reference, mentions, attachment references, run window and operation marker if supported. One exact candidate can be recovered after verification; multiple/ambiguous matches stop. Zero candidates under incomplete history/eventual consistency is not proof none posted. Use bounded rechecks or review before an explicitly authorized retry; no silent duplicate posts.
9. **Resume and report separately.** Reverify saved comment ID/version/material before skipping; a later edit/deletion is drift requiring review, not a reason to repost blindly. Report per item/action comment ID/status, addressed/FYI/skipped/uncertain entries, source limitations, attachment status, retained paths and rendering limitations. A failed comment does not undo a verified move/upload. No default temp/evidence/manifest cleanup.

## Quality checks and examples

Check bounded scope, exact recipient resolution, complete history, no “later author means answered” shortcut, grounded content, exact batch approval, safe formatting, source context freshness, duplicate-safe recovery and read-back material. Missing capabilities produce a draft or blocked posting plan, not fabricated success.

- **Happy path:** One verified mention asks which approved AC covers denied access. Draft a source-linked answer, receive batch approval, post and read back exact content/mention; report comment ID and any presentation limitation.
- **Edge case:** The user commented later on an unrelated estimate. The original question remains unaddressed; keep it in the response queue. Two exact-email identity candidates stop the mention action without a cache write.
- **Insufficient input:** “Reply to everyone” without item bounds or recipient identities yields targeted scope questions and no scan/post. “Tests pass” without runner/assertion evidence becomes a request for evidence or a clearly qualified draft, never a fabricated test claim.

No ongoing monitoring, credential acquisition, automatic design downloads or business decisions are included. Notifications and rendering may need separate evidence beyond stored comment verification.
