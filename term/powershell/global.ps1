## Global config (Used on all systems) ##

$OMPConfig = "$PSScriptRoot/../omp/config.json"

if ($IsIDE -eq $True) {
    $OMPConfig = "$PSScriptRoot/../omp/config-ide.json"
}

oh-my-posh init pwsh --config $OMPConfig | Invoke-Expression

## Personal Preference

Set-Alias -Name code -Value codium

function StartEditor() {
    Start-Process kate $args
}
Set-Alias -Name edit -Value StartEditor