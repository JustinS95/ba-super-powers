# Foundation and authoring regression scenarios

Use these fictional cases to check routing, discovery, decomposition, conventions, team configuration, authoring and improvement behavior. Expected outcomes are acceptance expectations, not recorded test results. Do not access real systems or change files merely to walk through a scenario.

| Scenario and input | Expected behavior |
|---|---|
| Request a summary from supplied readable notes | Use the relevant skill and COMMON directly; no mandatory entry-point/discovery ceremony; report source gaps honestly |
| “Write final refund AC,” no rule/actor supplied | Ask targeted questions; no invented eligibility, amount, timing or permission; block only affected finalization |
| Same refund request, but “give me an outline now” | Produce a labeled supported outline/questions, not invented policy or an implementation-ready claim |
| Notes conflict with an adopted exclusion map | Cite both sources, preserve conflict and ask who can confirm scope; unrelated work can proceed |
| Order submission and independent reporting, priority only proposed | Map actors/outcomes/dependencies and coverage; label recommended sequencing as a proposal |
| Several systems implement one end-to-end outcome | Consider keeping one capability; retain handoffs rather than splitting by system count or frontend/backend layer |
| Binding public specification requires an exact response field | Retain necessary detail with source/version/location; exclude unrelated internal DTO conventions |
| Business behavior settled, internal paging ADR absent | Proceed with supported behavior; mark observed patterns unverified rather than inventing an authoritative fallback |
| Source specifies Update but no compound Read requirement/default-role propagation | Preserve confirmed behavior; do not infer additional permission or propagation policy |
| No roster/registry, standalone story draft | Do not require YAML/UUID creation; ownership can remain unresolved when unnecessary |
| Two people share the role requested for assignment | Ask intended person or approved mapping; do not select the first match |
| Cached GUID lacks scope/email provenance or conflicts with exact-email evidence | Use PROJECT_CONTEXT; unsupported cache is not proof; stop identity-dependent action on conflict |
| User declines caching a verified in-scope identity | Keep the scoped verified result usable without cache/timestamp writes |
| Authoring request lacks edit scope or authoritative host schema | Clarify material scope; do not guess fields or claim host verification |
| Repeated evidenced workflow omission | Inspect the natural owner; propose the smallest supported correction and validation; edit only when authorized |
| Project fact or suspected cause after one incident | Keep facts project-scoped; do not create global policy from unverified causes |
| Approved skill edit reveals a shared-configuration issue outside scope | Propose expanded changes; do not silently edit configuration or the registry |

## Trial method

Check frontmatter and relative links, then run representative happy-path, edge and insufficient-input prompts in a no-side-effect context. Record actual outputs and discrepancies separately. Verify host discovery and external schemas only when permitted; static walkthroughs do not establish runtime adherence.
