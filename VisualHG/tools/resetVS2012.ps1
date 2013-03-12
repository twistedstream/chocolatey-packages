# This fix is per: 
# http://www.skimedic.com/blog/post/2012/09/27/Fixing-the-Visual-Studio-2012-and-VisualHG-Installation-Issue.aspx

$vsCmd = Join-Path ${Env:ProgramFiles(x86)} "Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"
if (Test-Path $vsCmd) {
  $statements = "/setup"
  Write-Host "Running VS2012 setup command to refresh source control plug-ins..."
  Start-ChocolateyProcessAsAdmin $statements ('"' + $vsCmd + '"')
}
