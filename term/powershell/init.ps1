## Includes all configs that are needed.



if ($IsLinux) {
    . "$PSScriptRoot/global.ps1"
    . "$PSScriptRoot/linux.ps1"
} elseif ($IsWindows) {
    . "$PSScriptRoot\global.ps1"
    . "$PSScriptRoot\windows.ps1"
}