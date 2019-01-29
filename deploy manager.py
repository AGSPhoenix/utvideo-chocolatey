#py3.5-3.7

import httplib.request
import json
import os

apiKey = os.environ['appveyor_api_key']

accountName = "AGSPhoenix"
projectSlug = "utvideo-chocolatey"

request = urllib.request.Request(f"https://ci.appveyor.com/api/projects/{accountName}/{projectSlug}", headers={"Authorization":"Bearer "+apiKey})
response = urllib.request.urlopen(request)

import code
code.interact(local=locals())