$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://umezawa.dyndns.info/archive/utvideo/utvideo-21.1.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '0F7AEB009E933536581D10B2CFA3909016F814B411F5A920434FD87EC0139EF5'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
