$IDEIcons = @{
    'idea' = ' '
    'codium' = ' '
    'code' = ' '
    'default' = ' '
}


# Allows setting Powershell IDE Icon. For example: "\uf372" for Codium.
$env:IDEName ??= "default"
$Global:IDEName = $env:IDEName

if ($IDEIcons.ContainsKey($IDEName)) {
    $env:IDEIcon ??= $IDEIcons[$IDEName]
} else {
    $env:IDEIcon ??= " "
}


$Global:IDEIcon = $env:IDEIcon
