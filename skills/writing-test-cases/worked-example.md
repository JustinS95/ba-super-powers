# Worked example: submitting a small request

This fictional example shows how to choose useful tests, rather than simply write more tests. It is shared by [test cases](SKILL.md) and [test plans](../writing-test-plans/SKILL.md). **These tests have not been run.**

## The story: Alice wants to submit a request

Alice owns a request. She can submit it only when it is still a **Draft** and she asks for a whole number of units from **1 to 5**, including 1 and 5. Bob can view Alice's request, but cannot submit it. Once a request is **Submitted**, neither actor can submit it again.

When submission succeeds, the request should save the entered quantity, become Submitted and show a confirmation. When submission is refused, it should say so and leave the saved quantity, owner and state unchanged.

### Start with the quantity

Use Alice on her own Draft so that ownership and state are both allowed. Now a refusal cannot be explained by the wrong person or the wrong state.

Choose six quantities around the two ends of the allowed range:

| Quantity | Why try it? | Expected result |
|---|---|---|
| 0 | Just below the minimum | Refuse; keep the Draft unchanged |
| 1 | Exactly the minimum | Submit and save 1 |
| 2 | Just inside the minimum | Submit and save 2 |
| 4 | Just inside the maximum | Submit and save 4 |
| 5 | Exactly the maximum | Submit and save 5 |
| 6 | Just above the maximum | Refuse; keep the Draft unchanged |

These values check whether the two limits are applied correctly, including whether 1 and 5 are accidentally refused. Each attempt uses a fresh request, so a successful submission does not spoil the starting point for the next test.

### Change one other thing at a time

Add two tests using **2 units**, a quantity we know is allowed:

- **Bob tries Alice's Draft.** Refuse and leave it unchanged. Only ownership is wrong, so this checks that rule on its own.
- **Alice tries her already-Submitted request.** Refuse and leave it unchanged. Only the request's state is wrong, so this checks that rule on its own.

If we tested only Bob asking for 6 units, a refusal would not tell us whether the ownership rule worked: the quantity rule could have caused it instead.

### Then try several things wrong together

For the ninth test, **Bob tries Alice's already-Submitted request with 6 units**. Refuse and change nothing. This samples how the rules behave together; it does not replace the separate checks or test every possible combination. We do not require a particular error to appear first.

### Check what was saved, not just the message

Start every request with **3 units saved**, then enter the test quantity. None of our nine attempts enters 3:

- If Alice successfully submits 2, the saved value must change from 3 to 2. A success message alone could hide a missing save.
- If Bob tries 2 and is refused, the saved value must stay 3. A refusal message alone could hide an unwanted save.

Reopen each request to check its saved values, owner and state. This gives us **nine tests with a reason for each choice**. In testing terminology, the input groups are *equivalence partitions*, the values near the limits are *boundary values*, the interacting rules can be recorded in a *decision table*, and the Draft/Submitted changes are *state transitions*. Choosing some combinations and documenting the rest is *risk-based combination reduction*.

## Reference material

The sections below keep the source references, test IDs, coverage reasoning and setup instructions for someone reviewing or preparing the tests. The rules and screen details are fictional inputs, not project policy or a ready-to-use fixture package.

### 1. Given evidence and scope

Assume the following fictional approved sources; the labels provide traceability within this example only.

| Source/location | Given fact / obligation |
|---|---|
| R1 v1, AC1 | A signed-in actor may submit a request **if and only if** they own it, its state is Draft, and requested units are a whole number from 1 through 5 inclusive. All three conditions must hold. |
| R1 v1, AC2 | Successful submission saves the entered units, changes Draft to Submitted and displays confirmation that the request was submitted. |
| R1 v1, AC3 | An attempt failing any AC1 condition is rejected with feedback that submission was not completed. Saved units, owner and state stay unchanged. No error priority or exact message is specified. |
| U1 v1, Request screen | Both test actors can view the selected request's owner, saved units and state, enter Requested units and select Submit in either state. Reopening Requests and selecting the exact request ID shows saved values. The editing field is distinct from the saved-units display; entry alone does not save. |
| F1 v1, sandbox fixture console | Test-only Fixture console accepts a unique Request ID, Owner, State and Saved units, then Create seeds exactly those values. Lookup by exact ID supports collision checks and Delete of that record. Alice and Bob have separate test sessions. Only this isolated sandbox and test-created records are authorized in this fictional scenario. |

Scope: submission through the supplied screen using whole-number inputs; actor identity, current state and unit limits interact. Authentication, concurrent updates and other lifecycle events are not specified here. This selection is not a finding that those risks are acceptable in a real project.

Unknowns: blank/non-integer input handling, other states/events, exact feedback wording, concurrency and timing. These are questions for the fictional product owner, not additional pass/fail rules. All selected tests assert semantic feedback only. No engineering route, table or status-code assertion is implied.

### 2. Plan-owned strategy (selection rationale)

| Risk / obligations | Technique and target | Selection / residual risk |
|---|---|---|
| Incorrect quantity acceptance, AC1–3 | Partitions plus boundary values; both rejection classes and both threshold neighborhoods | Six numeric representatives with other conditions satisfied, so a failed result identifies the quantity rule. Farther extremes and unknown data types are not covered. |
| Owner/state gates bypassed, AC1/3 | Decision table; exercise each independent failing gate and an overlapping denial | Single-condition failures prevent one gate masking another; add a combined non-owner/Submitted/above-limit check because unauthorized mutation has high impact. Other multi-failure combinations remain sampled, not proven. |
| Incorrect lifecycle mutation, AC2/3 | State transitions; Draft→Submitted plus specified rejected self-loops | Successful paths and independently seeded Submitted retries check the state gate. No invented withdraw/reopen paths or long sequence suite. |

For this bounded illustration, prioritize setup, successful submissions, then rejection/edge cases on independent fixtures. No full Cartesian suite or pairwise target is claimed: explicit rule interactions are more useful here. The fictional acceptance owner must confirm the omitted combinations/residual risk before using this selection as a real plan; that acceptance is **pending**, not assumed.

### 3. Case-owned derivation

#### Partitions and boundaries

Within the selected whole-number domain: P-low = n < 1; P-valid = 1 ≤ n ≤ 5; P-high = n > 5. These predicates are disjoint and cover that domain, not every possible UI input. Representatives at 0 and 6 cover the rejection classes; 1, 2, 4, 5 cover valid endpoint neighborhoods. Increment is 1 from AC1's whole-number rule: lower neighborhood 0/1/2, upper 4/5/6. Valid input 2 is reused on independent fixtures for gate-isolation cases. Fractions/blank/text are unresolved, not silently grouped into a rejection class.

#### Decision table

O = actor is owner; D = state is Draft; V = units in P-valid. For this binary gate model all eight truth combinations are feasible under F1. A dash means either value yields the **same sourced outcome**, not an untested permission grant.

| Rule | O | D | V | Outcome from R1 | Selected tests |
|---|---|---|---|---|---|
| D1 | No | — | — | Reject; saved state/units/owner unchanged | TC-007, TC-009 |
| D2 | Yes | No | — | Reject; unchanged | TC-008 |
| D3 | Yes | Yes | No | Reject; unchanged | TC-001, TC-006 |
| D4 | Yes | Yes | Yes | Submit, save units, confirm | TC-002–TC-005 |

Rows are mutually exclusive and collectively cover the binary model (4 + 2 + 1 + 1 truth combinations). Testing one representative does **not** execute all combinations represented by a dash. No row asserts which error appears when multiple conditions fail.

#### Concrete selected cases and oracles

Every row below is a separate manual case, with R1 v1 AC1 plus the listed outcome obligation, and U1/F1 v1 for navigation/setup only. Each fixture starts with owner Alice and saved units **3**. Use a fresh tester-chosen run token `[RUN]` and exact request ID `[RUN]-[TC-ID]`; perform F1's exact-ID absence check before Create. If the ID exists, choose a new run token, do not overwrite. No test consumes another test's record.

| TC ID | Actor | Initial state | Enter units | Obligation / derivation | Expected saved units / state / feedback |
|---|---|---|---|---|---|
| TC-001 | Alice | Draft | 0 | AC3; P-low, lower outside, D3 | 3 / Draft / not completed |
| TC-002 | Alice | Draft | 1 | AC2; P-valid, lower on, D4 | 1 / Submitted / submitted |
| TC-003 | Alice | Draft | 2 | AC2; P-valid, lower inside, D4 | 2 / Submitted / submitted |
| TC-004 | Alice | Draft | 4 | AC2; P-valid, upper inside, D4 | 4 / Submitted / submitted |
| TC-005 | Alice | Draft | 5 | AC2; P-valid, upper on, D4 | 5 / Submitted / submitted |
| TC-006 | Alice | Draft | 6 | AC3; P-high, upper outside, D3 | 3 / Draft / not completed |
| TC-007 | Bob | Draft | 2 | AC3; owner gate alone fails, D1 | 3 / Draft / not completed |
| TC-008 | Alice | Submitted | 2 | AC3; state gate alone fails, D2 | 3 / Submitted / not completed |
| TC-009 | Bob | Submitted | 6 | AC3; overlapping denial, D1 | 3 / Submitted / not completed |

Owner stays Alice in **every** case. Every entered quantity differs from the saved baseline of 3; rejection checks include unchanged saved values, not just feedback.

#### Complete common procedure, bound separately to every row

**Type:** requirement-derived Functional (TC-002–005), Negative/Edge (TC-001/006/008), Permission (TC-007/009). **Environment:** F1 isolated sandbox, U1 v1 screen. **Preconditions:** fixture console access and the row's signed-in test actor; no real user data. All procedure variables come from the row or the explicit baseline above.

Setup in the fixture console: look up the exact request ID and confirm absence; enter that ID, Owner Alice, the row's Initial state and Saved units 3 into their respective fields; select Create; confirm the resulting record's four values. Each field entry is a separate manual action. If any setup observation differs, stop this case as blocked rather than repair unrelated records. Open the row actor's separate session at Requests.

| Step | One action | Expected observation |
|---|---|---|
| 1 | Select the exact fixture Request ID in Requests. | Detail shows owner Alice, saved units 3 and the row's Initial state. |
| 2 | Replace Requested units with the row's Enter units value. | Editing field shows that value; saved-units display remains 3. |
| 3 | Select Submit. | Semantic feedback matches the row; displayed owner, saved units and state match the row's oracle. |
| 4 | Open Requests. | Request list is visible. |
| 5 | Select the exact fixture Request ID again. | Persisted owner remains Alice; saved units and state match the row's oracle. |

**Overall verdict:** all observations match, including persistent unchanged values for rejection. **Evidence when authorized to run:** record run token, exact ID, actor, build/configuration, step observations and post-action values; capture failure diagnostics without secrets. **Cleanup:** after required diagnostic retention, in F1 look up the exact created ID, verify it belongs to this run, select Delete and verify exact-ID absence. Do not delete another run's records; on failure retain ID/diagnostics and report the orphan for scoped recovery. Each case's actual result and evidence are blank; status is **Not run**.

#### Transition mapping and limits

| Confirmed event/path | Tests / basis |
|---|---|
| Draft + permitted Submit → Submitted | TC-002–005, AC1/2 |
| Draft + denied Submit → Draft, unchanged | TC-001/006/007, AC3 |
| Submitted + Submit → Submitted, rejected and unchanged | TC-008/009, AC1/3; seeded independently rather than dependent on a success case |

This covers the specified transitions/denials, not every history. TC-008 tests a repeated submission's state guard using a seeded Submitted record; it does not prove retry behavior involving network failure, event duplication or session history.

### 4. Combination accounting and final coverage review

Expanding the numeric factor to {low, valid, high} gives 2 owner values × 2 states × 3 quantity partitions = **12 feasible partition combinations**. The nine selected values exercise six distinct combinations: owner/Draft/low, valid and high; non-owner/Draft/valid; owner/Submitted/valid; non-owner/Submitted/high. Multiple valid values intentionally cover different boundaries within one combination.

The six feasible combinations **not selected** are:

| Omitted combinations | Reason / residual risk |
|---|---|
| Non-owner + Draft + low or high (2) | Owner gate is isolated in TC-007 and quantity gates in TC-001/006; TC-009 samples overlap. Other overlap-specific defects could escape. |
| Owner + Submitted + low or high (2) | State gate is isolated in TC-008; quantity failures are tested in Draft. State-dependent validation defects could escape. |
| Non-owner + Submitted + valid or low (2) | TC-009 samples this dual-gate state with high input, not every partition. Interactions specific to valid/low input could escape. |

No combination is declared impossible. Those omissions are a proposed risk trade-off, not additional covered tests. Expand them if source changes, defect history or impact warrants it; do not reduce explicit obligations to meet an arbitrary case count. Pairwise coverage has not been targeted or verified.

Static review: AC1's conjunction has a success and each independently failing gate; AC2's save/transition/feedback obligations map to TC-002–005; AC3's rejection/unchanged owner/units/state/feedback map to TC-001/006–009. P-low/P-valid/P-high, both three-point boundary neighborhoods, all four decision rows and the three specified transition types have selected representatives. This is **designed coverage**, not execution evidence or proof of all combinations.

If R1 instead said only “validate units,” neither the partitions, thresholds nor expected verdicts could be derived. Keep known actor/state obligations, mark quantity-dependent cases blocked, and ask the product owner for the allowed domain, limits and failure behavior. Do not reuse this example's 1–5 rule as a default.
