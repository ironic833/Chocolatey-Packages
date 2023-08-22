
$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download2.terra-master.com/TerraMaster_TNAS_for_win_V3.2.0.6.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' #only one of these: exe, msi, msu
  url           = $url
  file          = "$toolsDir\TNASPCSetup.msi"
  #file         = $fileLocation

  softwareName  = 'tnas-v3-2-0-6*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'c9dad3e6ee795a30ebb15589ba19c83e'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  
}

## Install-ChocolateyPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage



Get-ChocolateyUnzip -FileFullPath "$toolsDir\TNASPCSetup_v3.2.0.6.zip" -Destination $toolsDir
Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Path $packageArgs.file