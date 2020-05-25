from bs4 import BeautifulSoup
import logging
import os
import requests

logger = logging.getLogger('nodes.data_requirements')

def check(client, params):

	logger.info(f'Accessing URL {params.url}.')
	response = requests.get(params.url)
	params.soup = BeautifulSoup(response.content, features="lxml")

