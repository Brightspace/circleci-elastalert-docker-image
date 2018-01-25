FROM circleci/python:2.7.13

RUN sudo pip install --upgrade \
	awscli \
	elastalert==0.1.28
