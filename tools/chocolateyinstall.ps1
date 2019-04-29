$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://umezawa.dyndns.info/archive/utvideo/utvideo-20.4.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = 'A053B14C6D949633968764C3696B0B0B5D878A58DE3C9CB77564C245D6E36B4F'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
