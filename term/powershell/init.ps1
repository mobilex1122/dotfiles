## Includes all configs that are needed.


## Allows showing simple version of the shell if used in terminal.
Clear-Host

$Global:IsIDE = $env:IsIDE -eq "1"

$Global:StartLog = @()
function Start-Log-Log() {
    param (
        $msg
    )

    $Global:StartLog += $msg
}


function Start-Log-Print() {
    Write-Output "PWSH Startup log"
    Write-Output "================"
    foreach ($item in $Global:StartLog) {
        Write-Host $item
    }

}


Set-Alias -Name slog -Value Start-Log-Log
Set-Alias -Name start-log -Value Start-Log-Print

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