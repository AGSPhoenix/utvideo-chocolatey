#py3.5-3.7

import urllib.request
import subprocess
import json
import sys
import os

apiKey = os.environ['appveyor_api_key']

accountName = "AGSPhoenix"
projectSlug = "utvideo-chocolatey"

request = urllib.request.Request(f"https://ci.appveyor.com/api/projects/{accountName}/{projectSlug}", headers={"Authorization":"Bearer "+apiKey})
response = urllib.request.urlopen(request)

assert response.getcode() == 200

response = json.loads(response.read())

statuses = [job['status'] for job in response['build']['jobs']]
if "queued" in statuses: #some tests haven't run
    print("aborting deploy due to unfinished jobs")
    sys.exit(0)

#FIXME breaks if jobs run concurrently
if len([x for x in statuses if x == "success"]) == len(statuses)-1: #all the other build have succeeded, and this is the last one
    #if we've gotten to this point, all tests have passed and we can push
    proc = subprocess.run(["choco", "push", "--api-key", os.environ['chocolatey_api_key']])
    print("choco push returned " + str(proc.returncode))
    sys.exit(proc.returncode) #propogate chocolatey errors, or success

print("oh noes weird number of jobs or something?")
sys.exit(1) #something weird happened with the jobs