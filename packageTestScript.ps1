param(
    [string]$PackageName
)

if (-not $PackageName) {
    Write-Host "Please provide a package name."
    exit 1
}

$chocoCommand = "choco install $PackageName --debug --verbose --source"

Write-Host "Running the following command:"
Write-Host $chocoCommand

# Uncomment the line below to actually execute the command
# Invoke-Expression $chocoCommand
