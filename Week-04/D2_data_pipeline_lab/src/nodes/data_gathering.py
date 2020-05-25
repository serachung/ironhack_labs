import logging
import pandas as pd 

logger = logging.getLogger('nodes.data_gathering')


def update(client, params):

	classificacao = []
	trailers = []
	duracao = []

	movie_names = [movie.find('a')['title'].replace('Filme ','') for movie in params.soup.find_all('div', attrs={'class':'col-sm-6 col-md-3'})]
	movie_links = ['https://www.cinemark.com.br/' + movie.find('a')['href'] for movie in params.soup.find_all('div', attrs={'class':'col-sm-6 col-md-3'})]

	for link in movie_links:
	    classificacao.append(params.soup.find('div', attrs={'class':'movie-details'}).find_all('span')[1].text)
	    trailers.append(params.soup.find('div', attrs={'class':'movie-details'}).find_all('li')[1].find('a')['href'].replace('//','https://'))

	params.df = pd.concat([params.df, pd.DataFrame({'name': movie_names,
                              					    'trailers': trailers,
                              					    })])

def done(client, params):
	"""
	Return True if the node is up-to-date else False.
	"""
	movie_names = [movie.find('a')['title'].replace('Filme ','') for movie in params.soup.find_all('div', attrs={'class':'col-sm-6 col-md-3'})]
	params.df = pd.concat([params.df, pd.DataFrame({'name': movie_names})])

	for name in movie_names:	
		logger.info(f'Verifying if {name} movie already exists')
		if sum(name == params.df.name) != 0:    
			return True
		else:
			return False