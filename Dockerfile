FROM circleci/python:2.7.15

RUN sudo pip install --upgrade \
	awscli \
	elastalert==0.1.39

ADD d2l-enhancements/ /usr/local/lib/python2.7/site-packages/elastalert/d2l/
