param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$expected = @(
    'using-ba-super-powers', 'discovery-intake', 'scope-decomposition',
    'applying-project-conventions', 'manage-project-team', 'writing-ba-skills',
    'continuous-skill-improvement', 'writing-user-stories',
    'writing-acceptance-criteria', 'adversarial-story-review', 'gap-analysis',
    'writing-meeting-summaries', 'process-mapping', 'figma-design-analysis',
    'synthesize-requirements', 'writing-brds', 'writing-client-emails',
    'writing-release-notes', 'convert-word-to-markdown', 'writing-test-cases',
    'writing-test-plans', 'writing-playwright-tests', 'post-test-evidence',
    'requirements-change-impact', 'defect-analysis-and-handoff',
    'ado-operations', 'fetch-ado-work-items', 'ado-work-item-creation',
    'sync-stories-from-ado', 'comment-on-ado-item', 'ado-move-board-item',
    'ado-board-blocker-analysis', 'ado-ready-for-work-analysis', 'ado-estimate',
    'github-operations', 'github-story-publishing', 'github-project-board',
    'github-story-update'
)
$issues = [System.Collections.Generic.List[string]]::new()
$skillRoot = Join-Path $Root 'skills'
$skills = @(Get-ChildItem -LiteralPath $skillRoot -Filter 'SKILL.md' -Recurse -File)
$names = @($skills | ForEach-Object { $_.Directory.Name })
foreach ($name in $expected) {
    if ($names -notcontains $name) { $issues.Add("Missing skill: $name") }
}
foreach ($name in $names) {
    if ($expected -notcontains $name) { $issues.Add("Unexpected skill: $name") }
}
if ($skills.Count -ne $expected.Count) { $issues.Add("Expected $($expected.Count) skills, found $($skills.Count)") }

$registry = Get-Content -LiteralPath (Join-Path $skillRoot 'REGISTRY.md') -Raw -Encoding UTF8
foreach ($skill in $skills) {
    $text = Get-Content -LiteralPath $skill.FullName -Raw -Encoding UTF8
    $header = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---(?:\r?\n|$)')
    if (-not $header.Success) {
        $issues.Add("Missing frontmatter: $($skill.FullName)")
        continue
    }
    $nameMatch = [regex]::Match($header.Groups[1].Value, '(?m)^name:\s*([^\r\n]+)')
    $actual = $nameMatch.Groups[1].Value.Trim().Trim('"').Trim("'")
    if ($actual -cne $skill.Directory.Name) { $issues.Add("Name mismatch: $($skill.FullName)") }
    if ($header.Groups[1].Value -notmatch '(?m)^description:\s*\S') {
        $issues.Add("Missing description: $($skill.FullName)")
    }
    if ($text -notmatch 'COMMON\.md') { $issues.Add("Missing common contract reference: $actual") }
    if ($actual -like 'github-*' -and $text -notmatch 'GITHUB_MUTATIONS\.md') {
        $issues.Add("Missing GitHub contract reference: $actual")
    }
    if (-not $registry.Contains("($actual/SKILL.md)")) { $issues.Add("Missing registry link: $actual") }
}

foreach ($reference in @('COMMON.md', 'PROJECT_CONTEXT.md', 'ADO_MUTATIONS.md', 'GITHUB_MUTATIONS.md', 'TEST_EVIDENCE.md')) {
    if (-not (Test-Path -LiteralPath (Join-Path $Root "references/$reference") -PathType Leaf)) {
        $issues.Add("Missing shared reference: $reference")
    }
}

# The ignored .local directory holds local trial and release records, including partial
# library snapshots whose relative links are not expected to resolve.
$localRoot = Join-Path (Resolve-Path -LiteralPath $Root).ProviderPath '.local'
$docs = @(Get-ChildItem -LiteralPath $Root -Filter '*.md' -Recurse -File | Where-Object {
    -not $_.FullName.StartsWith($localRoot + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)
})
foreach ($doc in $docs) {
    $text = Get-Content -LiteralPath $doc.FullName -Raw -Encoding UTF8
    # Examples of Markdown syntax inside code are not live links.
    $linkText = [regex]::Replace($text, '(?ms)^```[^\r\n]*\r?\n.*?^```[^\r\n]*(?:\r?\n|$)', '')
    $linkText = [regex]::Replace($linkText, '`+[^`\r\n]*`+', '')
    foreach ($match in [regex]::Matches($linkText, '\[[^\]\r\n]*\]\(([^)\r\n]+)\)')) {
        $target = $match.Groups[1].Value.Trim()
        if ($target -match '^(?:[a-zA-Z][a-zA-Z0-9+.-]*:|#)') { continue }
        $pathPart = ($target -split '#', 2)[0]
        if (-not $pathPart) { continue }
        try {
            $path = Join-Path $doc.DirectoryName ([Uri]::UnescapeDataString($pathPart))
            if (-not (Test-Path -LiteralPath $path)) {
                $issues.Add("Broken relative link in $($doc.FullName): $target")
            }
        } catch {
            $issues.Add("Invalid relative link in $($doc.FullName): $target")
        }
    }
}

if ($issues.Count) {
    $issues | ForEach-Object { Write-Output "FAIL: $_" }
    throw "Library validation failed with $($issues.Count) issue(s)."
}
Write-Output "PASS: $($skills.Count) skills; $($docs.Count) Markdown files; inventory, frontmatter, references, registry, and relative file links."
Write-Output 'Static validation only. No assistant behavior or external integration was tested.'
