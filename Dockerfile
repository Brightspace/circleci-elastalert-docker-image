FROM circleci/python:2.7.13

RUN sudo pip install --upgrade \
	awscli \
	elastalert==0.1.28

ADD d2l-enhancements/ /usr/local/lib/python2.7/site-packages/elastalert/d2l/
