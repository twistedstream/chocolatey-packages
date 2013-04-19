$packageName = 'Grails'
$grailsVersionName = 'grails-2.2.1'
$url = 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/{0}.zip' -f $grailsVersionName
$unzipLocation = $Env:chocolatey_bin_root
if (!$unzipLocation) {
	$unzipLocation = 'C:\grails'
}
$homeDirectory = Join-Path $unzipLocation $grailsVersionName

try { 

  Install-ChocolateyZipPackage "$packageName" "$url" "$unzipLocation"

  Install-ChocolateyEnvironmentVariable "GRAILS_HOME" $homeDirectory Machine
  Install-ChocolateyPath "%JAVA_HOME%\bin" Machine
  Install-ChocolateyPath "%GRAILS_HOME%\bin" Machine
  
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}