FROM ubuntu:20.04
LABEL maintainer=imranjuit@gmail.com
ENV TZ=Asia/Dhaka
RUN  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
RUN  apt update \
    && apt install curl htop sudo git nano  wget net-tools python-dev gfortran libatlas-base-dev libjpeg-dev python-numpy python-pandas-doc  zlib1g-dev binutils libproj-dev libxslt1-dev libxslt1-dev libxml2-dev libmemcached-dev python-lxml   uuid-dev libcap-dev libpq-dev   python-dev build-essential postgresql-12-postgis-3 -y
RUN  apt-get clean
RUN  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py  > get-pip.py \
    && python get-pip.py
WORKDIR /usr/src/app

COPY req.txt ./
RUN pip install pip==20.3.4
RUN pip install --no-cache-dir -r req.txt
RUN  pip install -U -e git+https://bitbucket.org/fomcl/savreaderwriter.git#egg=savreaderwriter
RUN  pip install -U -e git+https://github.com/kobotoolbox/pyxform.git@66090280c98dd02823bb63b89571d5714b754425#egg=pyxform
RUN  pip install -U -e git+https://github.com/onaio/python-json2xlsclient.git@62b4645f7b4f2684421a13ce98da0331a9dd66a0#egg=python_json2xlsclient
RUN  pip install -U -e git+https://github.com/jbalogh/django-nose.git@eca356f1c9ea9c8950d30d27f8d562ca0f6d2ffb#egg=django_nose
RUN  git clone https://github.com/imraneee1528/Html.git --branch master
RUN  cd Html/HTML.py-0.04/ \
    && python setup.py install
RUN  pip install django-environ==0.4.5
COPY libgeos.py  /usr/local/lib/python2.7/dist-packages/django/contrib/gis/geos/
COPY . .
ENV DJANGO_SETTINGS_MODULE="kobocat_settings"
ENV PYTHONPATH="/usr/src/app/env:$PYTHONPATH"
ENTRYPOINT ["/bin/sh", "manual.sh"]
