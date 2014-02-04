$packageName = 'VisualHG'
$installerType = 'MSI'
$url = 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=visualhg&DownloadId=763804&FileTime=130304700673700000&Build=20865'
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