FROM circleci/python:3.8.5

ENV ELASTALERT_URL https://github.com/Brightspace/elastalert/archive/d2l-v0.2.4.1.zip
ENV TZ UTC

RUN sudo pip install --upgrade \
	awscli \
	setuptools

RUN \
	wget -O /var/tmp/elastalert.zip $ELASTALERT_URL \
	&& sudo unzip /var/tmp/elastalert.zip -d /var/tmp/ \
	&& rm /var/tmp/elastalert.zip \
	&& sudo mv /var/tmp/elastalert-*/ /var/tmp/elastalert/ \
	&& cd /var/tmp/elastalert \
	&& sudo python3 setup.py install \
	&& cd ~ \
	&& sudo rm -fr /var/tmp/elastalert

ADD d2l-enhancements/ /usr/local/lib/python3.8/site-packages/d2l/
