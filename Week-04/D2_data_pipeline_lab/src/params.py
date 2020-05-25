from pandas import DataFrame

class Params:
	"""
	Parameters for the Cinema Lab.
	"""

	# url for Cinemark's website:
	url = 'https://www.cinemark.com.br/sao-paulo/filmes/em-cartaz'

	## Database connection params
	user = 'postgres'
	password = 'g0disl0vee'
	host = 'localhost'
	database = 'cinemark'

	url_string = f'postgresql+psycopg2://{user}:{password}@{host}/{database}'

	df = DataFrame()
	
	raw_data = '../data/raw/'
	external_data = '../data/external/'
	processed_data = '../data/processed/'
	intermediate_data = '../data/intermediate/'

	log_name = '../log/dump.log'

	# if this is set to True, then all the nodes will be automatically 
	# considered not up-to-date and will be rerun.
	rerun = False 


