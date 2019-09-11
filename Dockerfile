FROM circleci/python:3.6.9

RUN sudo pip install --upgrade \
	awscli \
	elastalert==0.2.1

ADD d2l-enhancements/ /usr/local/lib/python3.6/site-packages/elastalert/d2l/
