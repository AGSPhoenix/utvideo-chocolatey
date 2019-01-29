#py3.5-3.7

import subprocess
import sys

#os.startfile doesn't support capturing output, so let's go hunt down where the AHK executable is so we can run .ahk files directly
#this asks Windows what action is associated with .ahk files
associations = subprocess.run(['assoc', '.ahk'], stdout=subprocess.PIPE, shell=True)
runnerName = associations.stdout.decode().rstrip().split('=')[1]

#and this asks what command is run for that action. I'm not sure why this 2-stage translation exists, but it does
ftype = subprocess.run(['ftype', runnerName], stdout=subprocess.PIPE, shell=True)
#this stuff below is roughtly equivalent to the regex `.*?"(.*?)"`
#it extracts the stuff in between the first set of double quotes
#...I probably should have just used regexes
tmp = ftype.stdout.decode().rstrip()
start = tmp.find('"') +1
end   = start + tmp[start:].find('"')
ahkExecutable = tmp[start:end]

assert "AutoHotkey.exe" in ahkExecutable

def getNumberOfCodecs():
    response = subprocess.run([ahkExecutable, 'utvideo test.ahk'], stdout=subprocess.PIPE)
    assert response.returncode == 0
    return int(response.stdout.decode())

codecsAtStart = getNumberOfCodecs()

#install
subprocess.run("choco install utvideo -dv -s .".split())

codecsAfterInstall = getNumberOfCodecs()

if not codecsAfterInstall > codecsAtStart:
    print("Number of codecs didn't increase after install!")
    sys.exit(1)

#uninstall
subprocess.run("choco uninstall utvideo".split())

codecsAfterUninstall = getNumberOfCodecs()

if not codecsAfterUninstall == codecsAtStart:
    print("Uninstall didn't return system to initial state!")
    sys.exit(2)

