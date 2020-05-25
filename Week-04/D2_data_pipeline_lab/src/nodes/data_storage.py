from sqlalchemy import create_engine
import logging


logger = logging.getLogger('nodes.data_storage')


def update(client, params):
	engine = create_engine(params.url_string)
	conn = engine.connect()
	params.df.to_sql('movies', conn, index=False, if_exists='append')


def done(client, params):
	logger.info('Checking if storage node is up-to-date.')
	return False

