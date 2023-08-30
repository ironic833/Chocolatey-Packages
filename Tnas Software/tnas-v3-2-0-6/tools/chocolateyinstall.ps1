
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download2.terra-master.com/TerraMaster_TNAS_for_win_V3.2.0.6.zip' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  file          = "$toolsDir\TNASPCSetup.msi"
  softwareName  = 'tnas-v3-2-0-6*' 
  checksum      = 'c9dad3e6ee795a30ebb15589ba19c83e'
  checksumType  = 'md5' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  
}

Get-ChocolateyUnzip -FileFullPath "$toolsDir\TNASPCSetup_v3.2.0.6.zip" -Destination $toolsDir

$checkSumReturn = Get-ChecksumValid `-File $file -Checksum $checksum -ChecksumType $checksumType

Write-Host "Checksum: $checkSumReturn" >> check.txt

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Path $packageArgs.file