param (
    [string]$rootDirectory
)

# Search for all bin folders starting from the root directory
$binFolders = Get-ChildItem -Path $rootDirectory -Filter "bin" -Directory -Recurse -ErrorAction SilentlyContinue

if ($binFolders -ne $null -and $binFolders.Count -gt 0) {
    # If one or more bin folders are found, process each one
    foreach ($binFolder in $binFolders) {
        $binFolderPath = $binFolder.FullName
        # Copy the first bin folder path to the clipboard and break the loop
        $binFolderPath | Set-Clipboard
        Write-Host "The path to a bin folder has been copied to the clipboard: $binFolderPath"
        break
    }
} else {
    Write-Host "No bin folder found in the specified directory."
}