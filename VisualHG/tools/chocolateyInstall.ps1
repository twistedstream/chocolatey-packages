$packageName = 'VisualHG'
$installerType = 'MSI'
$url = 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=visualhg&DownloadId=289940&FileTime=129623969865630000&Build=20218'
$url64 = $url
$silentArgs = '/quiet'
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes

try { 

  & (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'resetVS2012.ps1')
  
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}