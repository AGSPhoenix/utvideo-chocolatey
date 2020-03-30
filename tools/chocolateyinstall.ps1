$ErrorActionPreference = 'Stop';

$packageName= 'utvideo'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://umezawa.dyndns.info/archive/utvideo/utvideo-20.6.0-win.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)

  softwareName  = 'Ut Video Codec Suite'
  checksum      = '2AD91D0190EE4978499C84A98DFA71CB4344F3B32A8046AC9420BA274C497048'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
