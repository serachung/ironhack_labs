from datetime import datetime
import logging
import pandas as pd

logger = logging.getLogger('nodes.data_transform')


def update(client, params):

	params.df['date'] = str(datetime.today().year).zfill(4) + str(datetime.today().month).zfill(2) + str(datetime.today().day).zfill(2)
	params.df = params.df.reset_index(drop=True)


def done(client, params):
	return False



