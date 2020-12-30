$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/umezawatakeshi/utvideo/releases/download/utvideo-21.2.1/utvideo-21.2.1-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '88D0772FA0C145D50652103E678C5772C33D1A712C2ADA1538C283D8C8AAC883'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
