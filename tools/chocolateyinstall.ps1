$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://umezawa.dyndns.info/archive/utvideo/utvideo-21.2.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = 'E140AA6934A1C6660A75AF89AB619C46A0C097BEB8499CF822B9C4CBE5AF8FA7'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
