# -*- coding: utf-8 -*-
import os
from setuptools import setup

base_dir = os.path.dirname( __file__ )
setup(
	name = 'd2l',
	packages = [ 'd2l' ],
	setup_requires = 'setuptools'
)
