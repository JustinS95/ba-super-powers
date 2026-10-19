#!/usr/bin/env bash
# Local, isolated fixtures. Optional parity: TEST_LIBRARY_POWERSHELL=pwsh bash ...
set -eo pipefail
export LC_ALL=C
project=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
checker=$project/scripts/test-library.sh
mkdir -p -- "$project/.local"
scratch=$(mktemp -d "$project/.local/checker-tests.XXXXXX")
trap 'rm -rf -- "$scratch"' EXIT
base=$scratch/base
fixture=$scratch/'fixture with spaces'
mkdir -p -- "$base/skills" "$base/references"
# Use the original inventory as an independent oracle for the counterpart.
inventory=$(awk '
    /^\$expected = @\(/ { active=1; next }
    active && /^\)/ { exit }
    active {
        while (match($0, /\047[^\047]+\047/)) {
            print substr($0, RSTART+1, RLENGTH-2)
            $0=substr($0, RSTART+RLENGTH)
        }
    }
' "$project/scripts/Test-Library.ps1")
count=0
while IFS= read -r name; do
    count=$((count + 1))
    mkdir -p -- "$base/skills/$name"
    printf -- '---\nname: %s\ndescription: Test skill\n---\nCOMMON.md GITHUB_MUTATIONS.md\n' "$name" > "$base/skills/$name/SKILL.md"
    printf '[%s](%s/SKILL.md)\n' "$name" "$name" >> "$base/skills/REGISTRY.md"
done <<< "$inventory"
[[ $count == 37 ]] || { printf 'FAIL: original inventory oracle\n' >&2; exit 1; }
for name in COMMON.md PROJECT_CONTEXT.md ADO_MUTATIONS.md GITHUB_MUTATIONS.md TEST_EVIDENCE.md; do
    : > "$base/references/$name"
done
reset_fixture() { rm -rf -- "$fixture"; cp -R -- "$base" "$fixture"; }
checks=0
check() {
    local label=$1 expected=$2 needle=${3-} output status=0 ps_output ps_status
    output=$(bash "$checker" --root "$fixture" 2>&1) || status=$?
    if [[ $status != "$expected" || $output != *"$needle"* ]]; then
        printf 'FAIL regression: %s (exit %s, wanted %s)\n%s\n' "$label" "$status" "$expected" "$output" >&2
        exit 1
    fi
    if [[ -n ${TEST_LIBRARY_POWERSHELL-} ]]; then
        ps_status=0
        ps_output=$("$TEST_LIBRARY_POWERSHELL" -NoProfile -File "$project/scripts/Test-Library.ps1" -Root "$fixture" 2>&1) || ps_status=$?
        if [[ $ps_status != "$expected" || $ps_output != *"$needle"* ]]; then
            printf 'FAIL PowerShell parity: %s (exit %s, wanted %s)\n%s\n' "$label" "$ps_status" "$expected" "$ps_output" >&2
            exit 1
        fi
        # Compare issue counts as well as expected classification and diagnostic.
        if [[ $(printf '%s\n' "$output" | grep -c '^FAIL:' || :) != $(printf '%s\n' "$ps_output" | grep -c '^FAIL:' || :) ]]; then
            printf 'FAIL issue-count parity: %s\n' "$label" >&2; exit 1
        fi
    fi
    checks=$((checks + 1))
    printf 'PASS regression: %s\n' "$label"
}
reset_fixture
check 'clean inventory from original checker' 0 'PASS: 37 skills; 43 Markdown files;'
# CRLF, quoted names, UTF-8 content, relative links, directory targets, URI skips,
# anchors, percent decoding, and code examples are all valid in one fixture.
printf -- '---\r\nname: "discovery-intake"\r\ndescription: Test\r\n---\r\ncommon.md\r\n' > "$fixture/skills/discovery-intake/SKILL.md"
mkdir -p "$fixture/docs with spaces"
touch "$fixture/docs with spaces/caf$(printf '\303\251').txt" "$fixture/docs with spaces/plus+sign.txt"
cat > "$fixture/links.md" <<'EOF'
[directory](docs%20with%20spaces#anchor)
[unicode](docs%20with%20spaces/caf%C3%A9.txt)
[plus](docs%20with%20spaces/plus+sign.txt)
[query](https://example.invalid/a?q=b)
[mail](mailto:test@example.invalid)
[anchor](#missing-anchor-is-not-checked)
`[inline](not-a-file)` and ``[inline2](also-not-a-file)``
```markdown
[example](not-a-file)
```
EOF
mkdir -p "$fixture/.local/partial"
printf '[ignored](missing)\n' > "$fixture/.local/partial/trial.md"
check 'CRLF, quotes, encoded UTF-8/spaces, URI/code skips, ignored .local' 0 'PASS:'
reset_fixture
printf '\357\273\277---\nname: discovery-intake\ndescription: Test\n---\nCOMMON.md\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'UTF-8 BOM frontmatter' 0 'PASS:'
reset_fixture
rm "$fixture/skills/discovery-intake/SKILL.md"
check 'missing skill and inventory count' 1 'Missing skill: discovery-intake'
reset_fixture
mkdir "$fixture/skills/unexpected"
printf -- '---\nname: unexpected\ndescription: Test\n---\nCOMMON.md\n' > "$fixture/skills/unexpected/SKILL.md"
check 'unexpected skill' 1 'Unexpected skill: unexpected'
reset_fixture
mkdir "$fixture/skills/nested"
cp -R "$fixture/skills/discovery-intake" "$fixture/skills/nested/"
check 'duplicate nested skill counts' 1 'Expected 37 skills, found 38'
reset_fixture
printf 'No header\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'missing frontmatter' 1 'Missing frontmatter:'
reset_fixture
printf -- '---\nname: discovery-intake\ndescription: Test\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'unclosed frontmatter' 1 'Missing frontmatter:'
reset_fixture
printf -- '---\n---\nCOMMON.md\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'empty frontmatter delimiters match original missing-header behavior' 1 'Missing frontmatter:'
reset_fixture
printf -- '---\nname: Discovery-intake\ndescription: Test\n---\nCOMMON.md\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'case-sensitive frontmatter name' 1 'Name mismatch:'
reset_fixture
printf -- '---\nname: discovery-intake\ndescription:   \n---\nCOMMON.md\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'empty description' 1 'Missing description:'
reset_fixture
printf -- '---\nname: discovery-intake\ndescription: Test\n---\n' > "$fixture/skills/discovery-intake/SKILL.md"
check 'missing common reference' 1 'Missing common contract reference: discovery-intake'
reset_fixture
printf -- '---\nname: github-operations\ndescription: Test\n---\nCOMMON.md\n' > "$fixture/skills/github-operations/SKILL.md"
check 'missing GitHub reference' 1 'Missing GitHub contract reference: github-operations'
reset_fixture
: > "$fixture/skills/REGISTRY.md"
check 'missing registry coverage' 1 'Missing registry link:'
reset_fixture
rm "$fixture/references/TEST_EVIDENCE.md"
check 'missing shared reference file' 1 'Missing shared reference: TEST_EVIDENCE.md'
reset_fixture
printf '[broken](missing%%20file.md#section)\n' > "$fixture/links.md"
check 'broken encoded relative link' 1 'missing%20file.md#section'
reset_fixture
printf '```markdown\n[broken](missing.md)\n' > "$fixture/links.md"
check 'unclosed code fence does not hide broken links' 1 'Broken relative link'
reset_fixture
printf '[bad](invalid%%00name)\n' > "$fixture/links.md"
check 'NUL escape is invalid' 1 'Invalid relative link'
reset_fixture
# The default root is relative to the script, never the caller working directory.
(cd "$scratch" && bash "$checker") > "$scratch/default.log"
grep -q '^PASS: 37 skills;' "$scratch/default.log"
checks=$((checks + 1)); printf 'PASS regression: default root from another working directory\n'
bash "$checker" -Root "$fixture" > "$scratch/alias.log"
grep -q '^PASS:' "$scratch/alias.log"
checks=$((checks + 1)); printf 'PASS regression: PowerShell-style -Root alias\n'
status=0; bash "$checker" --root "$scratch/absent" > "$scratch/invalid.log" 2>&1 || status=$?
[[ $status == 1 ]] || exit 1
checks=$((checks + 1)); printf 'PASS regression: nonexistent root fails\n'
status=0; bash "$checker" --root > "$scratch/usage.log" 2>&1 || status=$?
[[ $status == 2 ]] || exit 1
bash "$checker" --help > "$scratch/help.log"
checks=$((checks + 1)); printf 'PASS regression: missing option value and help\n'
printf 'PASS: %s regression checks.\n' "$checks"
if [[ -z ${TEST_LIBRARY_POWERSHELL-} ]]; then
    printf 'PowerShell execution parity not run (set TEST_LIBRARY_POWERSHELL to an approved PowerShell executable).\n'
fi
