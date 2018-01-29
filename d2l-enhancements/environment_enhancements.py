from elastalert.enhancements import BaseEnhancement
from os import environ

class AppendDataCenter(BaseEnhancement):
	def process(self, match):
		match['d2l_data_center'] = 'test01'

class ExcludeDevelopmentEnvironments(BaseEnhancement):
	def process(self, match):
		# do nothing
