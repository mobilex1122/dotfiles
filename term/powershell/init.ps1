## Includes all configs that are needed.


## Allows showing simple version of the shell if used in terminal.
$Global:IsIDE = $env:IsIDE -eq "1"

if ($IsIDE) {
    . "$PSScriptRoot/ide-mode.ps1"    
}

if ($IsLinux) {
    . "$PSScriptRoot/global.ps1"
    . "$PSScriptRoot/linux.ps1"
} elseif ($IsWindows) {
    . "$PSScriptRoot\global.ps1"
    . "$PSScriptRoot\windows.ps1"
}