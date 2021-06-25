FROM python:3.9.5-slim-buster as builder

RUN \
	apt-get -y update && \
	apt-get -y install unzip

ADD https://github.com/jertel/elastalert2/archive/refs/tags/2.1.1.zip /tmp/elastalert.zip
RUN \
	unzip /tmp/elastalert.zip -d /tmp/ && \
	rm /tmp/elastalert.zip && \
	mv /tmp/elastalert*/ /tmp/elastalert/

RUN \
	mkdir -p /opt/elastalert && \
	cd /tmp/elastalert && \
	pip install setuptools wheel && \
	python setup.py sdist bdist_wheel


FROM python:3.9.5-slim-buster

COPY --from=builder /tmp/elastalert/dist/*.tar.gz /tmp/elastalert/dist/

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install awscli curl jq && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* && \
	pip install /tmp/elastalert/dist/*.tar.gz && \
	rm -rf /tmp/*

ENV TZ "UTC"

ADD d2l-enhancements/ /usr/local/lib/python3.9/site-packages/d2l/
