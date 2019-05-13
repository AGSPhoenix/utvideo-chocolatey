$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://umezawa.dyndns.info/archive/utvideo/utvideo-20.5.1-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = 'BD9AC6F34DF5FE50E76B76CC9C9509EE0AE3B9B1F39BB5687A09D37230F34452'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
