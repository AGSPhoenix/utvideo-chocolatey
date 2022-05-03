$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/umezawatakeshi/utvideo/releases/download/utvideo-23.0.1/utvideo-23.0.1-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '50D4EDEFBC7D8A3C577BE7FE5789E9AEB122D59EADA1A6164487B31ECB109313'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
