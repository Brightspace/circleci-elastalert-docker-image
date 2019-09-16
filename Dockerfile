FROM circleci/python:2.7.16

ENV ELASTALERT_URL https://github.com/Yelp/elastalert/archive/v0.1.39.zip

RUN sudo pip install --upgrade \
	awscli \
	"elasticsearch<7" \
	"setuptools>=11.3"

RUN \
	wget -O /var/tmp/elastalert.zip $ELASTALERT_URL \
	&& mkdir -p /opt/ \
	&& sudo unzip /var/tmp/elastalert.zip -d /opt/ \
	&& rm /var/tmp/elastalert.zip \
	&& sudo mv /opt/elastalert-*/ /opt/elastalert/ \
	&& cd /opt/elastalert/ \
	&& sudo python setup.py install

ADD d2l-enhancements/ /usr/local/lib/python2.7/site-packages/d2l/
