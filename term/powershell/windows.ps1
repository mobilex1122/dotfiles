if ($IsIDE -ne $True) {
    fastfetch
}





if ($PWD.Path  -eq "C:\Windows\System32") {
    slog "Forcefully set Home location!"
    Set-Location $HOME
}
