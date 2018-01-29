from elastalert.enhancements import BaseEnhancement
from elastalert.enhancements import DropMatchException
from os import environ

class AppendDataCenter(BaseEnhancement):

	def process(self, match):
		if 'D2L_DATA_CENTER' in environ:
			match['d2l_data_center'] = environ['D2L_DATA_CENTER']
		else:
			match['d2l_data_center'] = 'unknown'

class ExcludeDevelopmentEnvironments(BaseEnhancement):

	def process(self, match):
		if 'D2L_DEVELOPMENT_ENVIRONMENT' in environ:
			if environ['D2L_DEVELOPMENT_ENVIRONMENT'] == 'True':
				raise DropMatchException()
