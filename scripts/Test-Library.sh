#!/usr/bin/env bash
# Static counterpart to Test-Library.ps1. Compatible with Bash 3.2+.
set -eo pipefail
export LC_ALL=C

usage() {
    printf 'Usage: bash %s [--root DIRECTORY | -Root DIRECTORY]\n' "${0##*/}"
}
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
while (($#)); do
    case $1 in
        --root|-Root|-r)
            if (($# < 2)); then usage >&2; exit 2; fi
            root=$2; shift 2 ;;
        --help|-h) usage; exit 0 ;;
        *) usage >&2; exit 2 ;;
    esac
done
if [[ ! -d $root/skills || ! -f $root/skills/REGISTRY.md ]]; then
    printf 'ERROR: Root must contain skills/ and skills/REGISTRY.md: %s\n' "$root" >&2
    exit 1
fi
root=$(cd -- "$root" && pwd)
expected=(
    using-ba-super-powers discovery-intake scope-decomposition
    applying-project-conventions manage-project-team writing-ba-skills
    continuous-skill-improvement writing-user-stories
    writing-acceptance-criteria adversarial-story-review gap-analysis
    writing-meeting-summaries process-mapping figma-design-analysis
    synthesize-requirements writing-brds writing-client-emails
    writing-release-notes convert-word-to-markdown writing-test-cases
    writing-test-plans writing-playwright-tests post-test-evidence
    requirements-change-impact defect-analysis-and-handoff
    ado-operations fetch-ado-work-items ado-work-item-creation
    sync-stories-from-ado comment-on-ado-item ado-move-board-item
    ado-board-blocker-analysis ado-ready-for-work-analysis ado-estimate
    github-operations github-story-publishing github-project-board
    github-story-update
)
issues=0
fail() { printf 'FAIL: %s\n' "$*"; issues=$((issues + 1)); }
contains() {
    local needle=$1 value
    shift
    for value in "$@"; do
        [[ $value == "$needle" ]] && return 0
    done
    return 1
}
skills=() names=() docs=()
# Capture find output first so traversal failures cannot become a false PASS.
listing=$(find "$root/skills" -type f -name SKILL.md -print) || exit 1
# Use NUL-delimited traversal for spaces, tabs and newlines in file names.
while IFS= read -r -d '' file; do
    skills+=("$file")
    name=${file%/*}
    # PowerShell inventory comparisons are case insensitive.
    names+=("$(printf '%s' "${name##*/}" | tr '[:upper:]' '[:lower:]')")
done < <(find "$root/skills" -type f -name SKILL.md -print0)
for name in "${expected[@]}"; do
    contains "$name" "${names[@]}" || fail "Missing skill: $name"
done
for name in "${names[@]}"; do
    contains "$name" "${expected[@]}" || fail "Unexpected skill: $name"
done
if ((${#skills[@]} != ${#expected[@]})); then
    fail "Expected ${#expected[@]} skills, found ${#skills[@]}"
fi
registry=$(cat -- "$root/skills/REGISTRY.md")
for file in "${skills[@]}"; do
    directory=${file%/*}; directory=${directory##*/}
    # Emit frontmatter metadata; no YAML library is needed by either checker.
    metadata=$(awk '
        { sub(/\r$/, ""); if (NR == 1) sub(/^\357\273\277/, "") }
        NR == 1 { if ($0 != "---") exit; opened=1; next }
        opened && !closed && $0 == "---" { closed=(NR > 2); opened=0; next }
        opened && !closed {
            if (!named && /^name:[[:space:]]*[^[:space:]]/) {
                name=$0; sub(/^name:[[:space:]]*/, "", name)
                sub(/[[:space:]]*$/, "", name)
                sub(/^"+/, "", name); sub(/"+$/, "", name)
                sub(/^\047+/, "", name); sub(/\047+$/, "", name)
                named=1
            }
            if (/^description:[[:space:]]*[^[:space:]]/) description=1
        }
        END { print closed+0; print name; print description+0 }
    ' "$file")
    { IFS= read -r header; IFS= read -r actual; IFS= read -r description; } <<< "$metadata"
    if [[ $header != 1 ]]; then fail "Missing frontmatter: $file"; continue; fi
    [[ $actual == "$directory" ]] || fail "Name mismatch: $file"
    [[ $description == 1 ]] || fail "Missing description: $file"
    text=$(cat -- "$file")
    lower=$(printf '%s' "$text" | tr '[:upper:]' '[:lower:]')
    [[ $lower == *common.md* ]] || fail "Missing common contract reference: $actual"
    case $(printf '%s' "$actual" | tr '[:upper:]' '[:lower:]') in
        github-*) [[ $lower == *github_mutations.md* ]] || fail "Missing GitHub contract reference: $actual" ;;
    esac
    [[ $registry == *"($actual/SKILL.md)"* ]] || fail "Missing registry link: $actual"
done
for reference in COMMON.md PROJECT_CONTEXT.md ADO_MUTATIONS.md GITHUB_MUTATIONS.md TEST_EVIDENCE.md; do
    [[ -f $root/references/$reference ]] || fail "Missing shared reference: $reference"
done

listing=$(find "$root" \( -path "$root/.local" -o -path "$root/.git" \) -prune -o -type f -name '*.md' -print) || exit 1
while IFS= read -r -d '' file; do docs+=("$file"); done < <(
    find "$root" \( -path "$root/.local" -o -path "$root/.git" \) -prune -o -type f -name '*.md' -print0
)
for file in "${docs[@]}"; do
    # Strip closed triple-backtick blocks and inline code, as in the PS checker.
    # An unclosed fence remains live text, matching its regular expression.
    targets=$(awk '
        { sub(/\r$/, ""); if (NR == 1) sub(/^\357\273\277/, "")
          if (/^```/) {
              if (fenced) { fenced=0; block="" }
              else { fenced=1; block=$0 "\n" }
          } else if (fenced) block=block $0 "\n"
          else text=text $0 "\n"
        }
        END {
            text=text block
            gsub(/`+[^`\r\n]*`+/, "", text)
            while (match(text, /\[[^]\r\n]*\]\([^)\r\n]+\)/)) {
                link=substr(text, RSTART, RLENGTH)
                sub(/^[^]]*\]\(/, "", link); sub(/\)$/, "", link)
                sub(/^[[:space:]]*/, "", link); sub(/[[:space:]]*$/, "", link)
                print link
                text=substr(text, RSTART+RLENGTH)
            }
        }
    ' "$file")
    while IFS= read -r target; do
        [[ -n $target ]] || continue
        [[ $target =~ ^([a-zA-Z][a-zA-Z0-9+.-]*:|#) ]] && continue
        path=${target%%#*}
        [[ -n $path ]] || continue
        # Decode percent escapes without interpreting backslashes or plus signs.
        decoded= remaining=$path invalid=0
        while [[ -n $remaining ]]; do
            if [[ $remaining =~ ^%([0-9a-fA-F]{2}) ]]; then
                hex=${BASH_REMATCH[1]}
                if [[ $hex == 00 ]]; then invalid=1; break; fi
                printf -v char '%b' "\\x$hex"
                decoded=$decoded$char; remaining=${remaining:3}
            else
                decoded=$decoded${remaining:0:1}; remaining=${remaining:1}
            fi
        done
        if ((invalid)); then fail "Invalid relative link in $file: $target"
        elif [[ ! -e ${file%/*}/$decoded ]]; then fail "Broken relative link in $file: $target"
        fi
    done <<< "$targets"
done
if ((issues)); then
    printf 'Library validation failed with %s issue(s).\n' "$issues" >&2
    exit 1
fi
printf 'PASS: %s skills; %s Markdown files; inventory, frontmatter, references, registry, and relative file links.\n' "${#skills[@]}" "${#docs[@]}"
printf 'Static validation only. No assistant behavior or external integration was tested.\n'
