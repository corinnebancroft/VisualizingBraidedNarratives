#!/usr/bin/python

#This program downloads two different database dumps from a collection
#of databases; each db is structurally identical, and from each one,
#we want the following items:

# 1. A SQL dump of the entire db.
# 2. An XML dump of the entire db.

#These dumps are found on a web server. Following this, the script runs 
#the Saxon XSLT engine to generate three CSV files from each database.

import urllib.request
import subprocess
import os

#This is the (current) list of database names, minus the leading "narratives_".
dbs = ["de", "gs", "hp", "original", "pnp", "pod", "tkam", "to", "tt", "sh", "fs", "s", "utc"] 

for db in dbs:
    print(f"Getting dbs for {db}...")
    url1 = f"https://hcmc.uvic.ca/narrdev/exports/{db}/dump/narratives_{db}.sql"
    url2 = f"https://hcmc.uvic.ca/narrdev/exports/{db}/dump/narratives_{db}.xml"
    fname1 = f"data/{db}/dump/narratives_{db}.sql"
    fname2 = f"data/{db}/dump/narratives_{db}.xml"
    urllib.request.urlretrieve(url1, fname1)
    urllib.request.urlretrieve(url2, fname2)
print("Finished getting SQL and XML dumps...")

print("Now attempting to run Java/Saxon process to generate CSV files...")

result = subprocess.run(['java', '-jar',  'lib/saxon-he-12.5.jar', '-s:xslt/process_db.xsl', '-xsl:xslt/process_db.xsl'])

print("Done! You could now commit changes to the repository.")