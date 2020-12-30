$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/umezawatakeshi/utvideo/releases/download/utvideo-22.2.0/utvideo-22.2.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '658AC55003457B2E76D17961E5DB87F144309F5E80A43793929442716DF697BA'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
