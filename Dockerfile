FROM circleci/python:3.6.9

ENV ELASTALERT_URL https://github.com/Brightspace/elastalert/archive/d2l-0.2.1.1.zip

RUN sudo pip install --upgrade \
	awscli \
	"setuptools>=11.3"

RUN \
	wget -O /var/tmp/elastalert.zip $ELASTALERT_URL \
	&& mkdir -p /opt/ \
	&& sudo unzip /var/tmp/elastalert.zip -d /opt/ \
	&& rm /var/tmp/elastalert.zip \
	&& sudo mv /opt/elastalert-*/ /opt/elastalert/ \
	&& cd /opt/elastalert/ \
	&& sudo python3 setup.py install

ADD d2l-enhancements/ /usr/lib/python3.6/site-packages/d2l/
