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
RUN  git clone https://github.com/imraneee1528/Html.git --branch master
RUN  cd Html/HTML.py-0.04/ \
    && python setup.py install
RUN  pip install django-environ==0.4.5
COPY libgeos.py  /usr/local/lib/python2.7/dist-packages/django/contrib/gis/geos/
COPY . .
ENV DJANGO_SETTINGS_MODULE="kobocat_settings"
ENV PYTHONPATH="/usr/src/app/env:$PYTHONPATH"
ENV DJANGO_LIVE_RELOAD="False"
ENV DJANGO_SITE_ID="1"
ENV DJANGO_SECRET_KEY="P2Nerc3oG2564z5mHTGUhAoh2CzOMVenWBNMNWgWU796n"
ENV CLEAN_APT_CACHE="True"
ENV DATABASE_URL="postgis://$KOBO_PSQL_DB_USER:$KOBO_PSQL_DB_PASS@$DATABASE_SERVER_IP:5432/$KOBO_PSQL_DB_NAME"
ENV HOME_DIR="/usr/src/app"
ENV PSQL_ADMIN="postgres"
ENTRYPOINT ["/bin/sh", "manual.sh"]
