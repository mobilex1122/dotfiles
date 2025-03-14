## Global config (Used on all systems) ##

oh-my-posh init pwsh --config "$PSScriptRoot/../omp/config.json" | Invoke-Expression

## Personal Preference
Set-Alias -Name code -Value codium