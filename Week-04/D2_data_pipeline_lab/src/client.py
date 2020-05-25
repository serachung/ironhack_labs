import logging
from sqlalchemy import create_engine

logger = logging.getLogger('client.py')


class Client:
	"""
	Connection to the PostgreSQL database. 
	"""

	def __init__(self, params):
		"""
		Connect to the database.

		Use the information contained in the params.py file 
		to connect to the postgreSQL database.
		"""
		try:
			self.engine = create_engine(params.url_string)
			self.conn = self.engine.connect()
		except Exception as e:
			logger.warning('Could not connect to the database on client.py file.')
			logger.warning('Verify your credentials.')
