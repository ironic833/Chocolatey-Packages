
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  file          = "$toolsDir\TNASPCSetup.msi"
  softwareName  = 'TnasPC*' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  
}

Get-ChocolateyUnzip -FileFullPath "$toolsDir\TNASPCSetup_v3.2.0.6.zip" -Destination $toolsDir

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Path $packageArgs.file