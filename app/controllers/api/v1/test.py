#import urllib
#import requests

#status = {
#	"message": yes
#}

#response = requests.post("http://localhost:3001/events", json=status)

import json

a = {'name':'Sarah', 'age': 24, 'isEmployed': True }

def sample(p): 
	python2json = json.dumps(p)
#	print python2json
sample(p)
