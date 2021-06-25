FROM python:3.9.5-slim-buster as elastalert

RUN \
	apt-get -y update && \
	apt-get -y install unzip

ADD \
	https://github.com/jertel/elastalert2/archive/c4d7347c253c45bd84c219b85671989af639f3c5.zip \
	/tmp/elastalert.zip

RUN \
	unzip /tmp/elastalert.zip -d /tmp/ && \
	rm /tmp/elastalert.zip && \
	mv /tmp/elastalert*/ /tmp/elastalert/

RUN \
	cd /tmp/elastalert && \
	pip install setuptools wheel && \
	python setup.py sdist bdist_wheel

# -----------------------------------------------------------------------------------------

FROM python:3.9.5-slim-buster as d2l-enhancements

ADD d2l-enhancements/ /tmp/d2l-enhancements/

RUN \
	cd /tmp/d2l-enhancements && \
	pip install setuptools wheel && \
	python setup.py sdist bdist_wheel

# -----------------------------------------------------------------------------------------

FROM cimg/python:3.9.5

COPY --from=elastalert /tmp/elastalert/dist/*.tar.gz /tmp/elastalert/dist/
COPY --from=d2l-enhancements /tmp/d2l-enhancements/dist/*.tar.gz /tmp/d2l-enhancements/dist/

RUN \
	sudo apt-get -y update && \
	sudo apt-get -y upgrade && \
	sudo apt-get -y autoremove && \
	sudo rm -rf /var/lib/apt/lists/* && \
	pip install --upgrade awscli pip && \
	pip install /tmp/elastalert/dist/*.tar.gz && \
	pip install /tmp/d2l-enhancements/dist/*.tar.gz && \
	sudo rm -rf /tmp/*

ENV TZ "UTC"
