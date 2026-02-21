function Add-ToPath {
    param([string]$Dir)

    if ($IsLinux) {
        $full = (Resolve-Path $Dir).Path
        if (-not ($env:PATH.Split(":") -contains $full)) {
            $env:PATH += ":$full"
        }
    }
}
