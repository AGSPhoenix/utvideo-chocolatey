$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/umezawatakeshi/utvideo/releases/download/utvideo-21.3.1/utvideo-21.3.1-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '6328C204811FBE36DF68CB04752C328951F76B2459C6258034D43FC2EEC9F4C8'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
