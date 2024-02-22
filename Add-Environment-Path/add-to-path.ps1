param (
    [string]$DirectoryToAdd
)

# Get the current PATH environment variable value
$CurrentPath = [System.Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::Machine)

# Check if the directory is already in the PATH
if ($CurrentPath -notlike "*$DirectoryToAdd*") {
    # If not, append the directory to the PATH
    $NewPath = $CurrentPath + ";" + $DirectoryToAdd

    # Set the new PATH
    [System.Environment]::SetEnvironmentVariable("PATH", $NewPath, [System.EnvironmentVariableTarget]::Machine)

    Write-Host "The directory has been added to the PATH."
} else {
    Write-Host "The directory is already in the PATH."
}
