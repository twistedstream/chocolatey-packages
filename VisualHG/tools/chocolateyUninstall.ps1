$packageName = 'VisualHG'
$msiPath = Join-Path $Env:LOCALAPPDATA ('Temp\chocolatey\' + $packageName + '\' + $packageName + 'Install.MSI')
$statements = '/x "' + $msiPath + '" /quiet'
Start-ChocolateyProcessAsAdmin $statements "msiexec"

& (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'resetVS2012.ps1')

Write-Host "Uninstall complete!"