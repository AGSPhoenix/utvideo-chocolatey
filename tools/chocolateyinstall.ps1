$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/umezawatakeshi/utvideo/releases/download/utvideo-22.6.0/utvideo-22.6.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = 'F47069F1E870F9A13732C364C45E3DDB919FA7BBB6778C96E057B6D2240D3C19'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
