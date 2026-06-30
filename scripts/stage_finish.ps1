param(
    [Parameter(Position = 0)]
    [string]$CommitMessage
)

$ErrorActionPreference = "Stop"

function Write-Section {
    param([string]$Message)
    Write-Host ""
    Write-Host "==> $Message"
}

function Exit-WithError {
    param([string]$Message)
    Write-Error $Message
    exit 1
}

if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
    Write-Host "Usage:"
    Write-Host '  powershell -ExecutionPolicy Bypass -File scripts/stage_finish.ps1 "stage-02: add project structure and base dependencies"'
    exit 1
}

Write-Section "Running flutter analyze"
& flutter analyze
if ($LASTEXITCODE -ne 0) {
    Exit-WithError "flutter analyze failed. Fix the reported issues before committing or pushing."
}

Write-Section "Checking git status"
$status = & git status --short
if ($LASTEXITCODE -ne 0) {
    Exit-WithError "git status failed."
}

$statusText = ($status | Out-String).Trim()
if ([string]::IsNullOrWhiteSpace($statusText)) {
    Write-Host "Working tree clean. No commit or push was created."
    exit 0
}

Write-Host $statusText

Write-Section "Staging changes"
& git add .
if ($LASTEXITCODE -ne 0) {
    Exit-WithError "git add failed."
}

& git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No staged changes after git add. No commit or push was created."
    exit 0
}

Write-Section "Creating commit"
& git commit -m $CommitMessage
if ($LASTEXITCODE -ne 0) {
    Exit-WithError "git commit failed. Review the output above."
}

Write-Section "Pushing commit"
& git push
if ($LASTEXITCODE -ne 0) {
    Write-Error "git push failed. If GitHub authentication is required, authenticate locally with Git Credential Manager or GitHub CLI, then rerun the stage finish command. Do not paste tokens into chat."
    exit 1
}

Write-Section "Stage completion finished"
$branch = (& git branch --show-current).Trim()
Write-Host "Branch: $branch"
Write-Host "Commit message: $CommitMessage"
Write-Host "Push result: success"
