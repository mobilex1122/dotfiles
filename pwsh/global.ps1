## Global config (Used on all systems) ##


function GoTo-Lab {

    param (
        [string]$labPath
    )
    $base = "~/Projects"

    Set-Location "$base/$labPath"

}
Set-Alias -Name lab -Value GoTo-Lab

$OMPConfig = "$PSScriptRoot/../omp/config.json"

if ($Global:IsIDE -eq $True) {
    $OMPConfig = "$PSScriptRoot/../omp/config-ide.json"
}

oh-my-posh init pwsh --config $OMPConfig | Invoke-Expression

## Personal Preference

Set-Alias -Name lg -Value lazygit

function GitClone() {

    git clone $args
    if($?) {
        Write-Output ""
        Write-Output "Hipiti hopiti this code is now my property"
    }
}

Set-Alias -Name yoink -Value GitClone
