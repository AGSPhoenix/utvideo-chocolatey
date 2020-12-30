import os
import re
import json
import hashlib
import urllib.request

# os.chdir(os.environ['GITHUB_WORKSPACE']) #checked out repo on runner?
print("running in " + os.getcwd())

print("fetching release definition")
with urllib.request.urlopen("https://api.github.com/repos/umezawatakeshi/utvideo/releases/latest") as f:
    resp = json.load(f)

releaseVersion = resp['tag_name'].split('-')[1]

#       Finds windows release in list of assets V           Get actual file URL V
releaseUrl = [x for x in resp['assets'] if "-win.exe" in x['name']][0]['browser_download_url']
print("downloading release")
with urllib.request.urlopen(releaseUrl) as f:
    release = f.read()

hasher = hashlib.sha256(release)
releaseHash = hasher.hexdigest().upper()

#Update installer variables. A templating engine like Jinja2 would be nice, but I don't wanna deal with pulling in deps
print("updating installer")
installer = ""
with open("tools/chocolateyinstall.ps1", "rt") as f:
    for line in f.readlines():
        if line.startswith("$url"):
            installer += f"$url        = '{releaseUrl}'\n"
        elif line.startswith("  checksum      = "):
            installer += f"  checksum      = '{releaseHash}'\n"
        else:
            installer += line

with open("tools/chocolateyinstall.ps1", "wt") as f:
    f.write(installer)


#update nuspec. Replacing the nultiline releaseNotes with basic text processing is too fiddly, so use etree
print("nuspec")
with open('utvideo.nuspec', encoding="utf_8") as f:
    nuspec = f.read()

nuspec = re.sub(r"<version>.*</version>",
                f"<version>{releaseVersion}</version>",
                nuspec)

nuspec = re.sub(r"<projectSourceUrl>.*</projectSourceUrl>",
                f"<projectSourceUrl>{releaseUrl}</projectSourceUrl>",
                nuspec)

docsUrl = [x for x in resp['assets'] if "-readme.en.html" in x['name']][0]['browser_download_url']
nuspec = re.sub(r"<docsUrl>.*</docsUrl>",
                f"<docsUrl>{docsUrl}</docsUrl>",
                nuspec)

releaseNotes = resp['body'].split('---')[0].rstrip()
nuspec = re.sub(r"<releaseNotes>.*</releaseNotes>",
                f"<releaseNotes>{releaseNotes}</releaseNotes>",
                nuspec,
                flags = re.DOTALL)

with open('utvideo.nuspec', 'w', encoding="utf_8", newline='') as f:
    f.write(nuspec)

print("done")

# import code
# code.interact(local=locals())