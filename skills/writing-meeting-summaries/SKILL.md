---
name: writing-meeting-summaries
description: Use when summarizing discovery sessions, stakeholder meetings, or interviews from transcripts or notes, with precise decisions, actions, and unresolved questions.
---

# Writing Meeting Summaries

Produce a faithful, readable meeting record, not a requirements design or an invented account of attendance. Use for one session unless the user requests a combined summary.

## Shared contract and inputs

Read [COMMON.md](../../references/COMMON.md) for source authority, clarification, actions, and storage. Read [PROJECT_CONTEXT.md](../../references/PROJECT_CONTEXT.md) when interpreting project terminology or stakeholder mappings.

Required: transcript, recording-derived text, or session notes; requested scope. Use the supplied meeting date, attendee list, audience, and agenda when available. File metadata, transcript speakers, invitees, and actual attendees are not interchangeable evidence.

- Read all supplied in-scope material before drafting. If access or length prevents this, state exactly what was read and label the summary partial.
- Missing source: ask for it; offer an empty template only if useful, not a factual summary.
- Missing date, owner, role, or attendee: mark “Not provided” or “TBD”; ask only when essential. Never use today's date as the meeting date.
- Incomplete/ambiguous notes can support a requested provisional summary. Highlight omissions and uncertain attribution rather than blocking all drafting.

## Workflow

1. Inventory sources: filename/link, version or meeting date, relevant pages/sections/timestamps, and completeness. Establish whether notes cover the entire session.
2. Extract substantive discussion, explicit decisions, assigned actions, and unresolved questions separately. Preserve qualifications, dissent, dependencies, and deferred topics.
3. Distinguish proposals (“could use email”) from decisions (“agreed to email”). Silence is not consent. Record decision-maker/authority only if stated.
4. Draft the six sections below. Group discussion by topic, not conversational order; retain source locators for material decisions and actions.
5. Review against sources for omissions, negations, dates, quantities, names, and commitments. Flag contradictory notes for confirmation rather than choosing a preferred account.
6. Deliver in chat or save as requested under the shared destination contract. A standalone saved record belongs in the confirmed meeting-summary category; embedded summaries inherit the parent path without a duplicate file.

## Output structure

Keep these six sections in order for a standalone record; adapt only for a requested format.

1. **Date and Attendees**: meeting date, meeting type, confirmed attendees and known roles. Separate “speakers identified in transcript” or “invited; attendance unconfirmed” where appropriate. Add source/coverage note.
2. **Purpose / Agenda**: 1-3 sentences and any supplied agenda. Do not invent the reason the meeting was called.
3. **Key Discussion Points**: complete-thought bullets describing what emerged and why it matters. Attribute stakeholder views when material.
4. **Decisions Made**: precise outcome, scope, qualifications, decision-maker if known, and locator. If a complete record has no decisions, say “No decisions recorded.” For partial records, say “No decisions identified in the supplied excerpt,” not that none occurred.
5. **Action Items**: use the table below. Do not assign the most plausible person or convert an aspiration into an agreed action.
6. **Open Questions / Parking Lot**: unresolved/deferred questions and proposed follow-up, explicitly distinguished from agreed actions. Use “None recorded” only when supported by coverage.

| Action | Owner | Due date | Source / qualification |
|---|---|---|---|
| Specific agreed action | Confirmed person/role or TBD | Stated date or TBD | Timestamp/section; dependencies |

Relative due dates may be normalized only when the meeting date, timezone/calendar context, and intended meaning make the conversion unambiguous. Otherwise preserve “by Friday” and flag the exact date for confirmation.

## Precision examples

| Weak or unsafe | Faithful alternative when supported |
|---|---|
| “Discussed notifications” as a decision | “Agreed to email-only notifications for the initial release; other channels deferred.” |
| “Follow up on integration” | “Confirm whether the partner interface supports batch imports; owner and due date not recorded.” |
| “Talked about sorting” | “Reviewers reported that urgent requests are difficult to locate with the current sorting.” |
| “The product lead approved it” from “maybe” | Move the option to discussion/open questions; no decision recorded. |

These examples illustrate phrasing, not reusable business rules.

## Quality and limits

- All six sections present; no invented attendees, decisions, authority, owners, dates, or quotes.
- Every decision states what was decided; every action describes an executable follow-up and preserves unknowns.
- Discussion, proposals, decisions, and follow-up recommendations remain distinct and traceable.
- Record limits of automated transcription, unclear speaker labels, missing sections, or unreviewed recordings. A summary is not proof of stakeholder approval.
- Before file writes, resolve exact authorized destination, read any existing target, and check collisions. Retain the record and report its actual path. Prefer descriptive Markdown names with the known meeting date; do not fabricate a date suffix.
