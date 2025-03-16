if ($IsIDE -ne $True) {
    fastfetch
}


# Arch Linux Only
function FullSystemUpdate() {
    Write-Output "Updating pacman..."
    sudo pacman -Syyu

    Write-Output "Updating yay..."
    yay -Syu

    Write-Output "Updating flatpak..."
    flatpak update
}