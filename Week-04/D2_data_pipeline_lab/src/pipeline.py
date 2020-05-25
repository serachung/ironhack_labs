from nodes import data_requirements
from nodes import data_gathering
from nodes import data_transform
from nodes import data_storage

from params import Params 
from client import Client
import logging

def process(client, params):  
	"""
	The ETL pipeline.
	"""
	data_requirements.check(client, params)

	if not data_gathering.done(client, params):
		data_gathering.update(client, params)

	if not data_transform.done(client, params):
		data_transform.update(client, params)

	if not data_storage.done(client, params): 
		data_storage.update(client, params)

if __name__ == '__main__': 

	params = Params()
	client = Client(params)

	logging.basicConfig(filename=params.log_name,
						level=logging.INFO,
						format='%(asctime)s.%(msecs)03d %(levelname)s %(module)s - %(funcName)s: %(message)s',
    					datefmt='%Y-%m-%d %H:%M:%S')
	
	process(client, params)