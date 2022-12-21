#!/usr/bin/env bash
#Code Download
git clone https://cicd_mpower:appskeypassword@bitbucket.org/mpowersocial/src_csvp.git
# Requirments Installations
pip install --no-cache-dir -r req.txt
pip install -U -e git+https://bitbucket.org/fomcl/savreaderwriter.git#egg=savreaderwriter
pip install -U -e git+https://github.com/kobotoolbox/pyxform.git@66090280c98dd02823bb63b89571d5714b754425#egg=pyxform
pip install -U -e git+https://github.com/onaio/python-json2xlsclient.git@62b4645f7b4f2684421a13ce98da0331a9dd66a0#egg=python_json2xlsclient
pip install -U -e git+https://github.com/jbalogh/django-nose.git@eca356f1c9ea9c8950d30d27f8d562ca0f6d2ffb#egg=django_nose

#source code Information
export SRC_DIR=${SRC_DIR:-"$HOME_DIR/src_csvp"}
export KOBOCAT_PATH=${KOBOCAT_PATH:-"$SRC_DIR/kobocat"}
export KOBOCAT_TEMPLATES_PATH=${KOBOCAT_TEMPLATES_PATH:-"$SRC_DIR/kobocat-template"}
#Datbase Information
export KOBO_PSQL_DB_NAME=${KOBO_PSQL_DB_NAME:-"csvp"}
export KOBO_PSQL_DB_USER=${KOBO_PSQL_DB_USER:-"kobo"}
export KOBO_PSQL_DB_PASS=${KOBO_PSQL_DB_PASS:-"password"}
export DATABASE_SERVER_IP=${DATABASE_SERVER_IP:-"192.168.19.88"}
export DATABASE_URL=${DATABASE_URL:-"postgis://$KOBO_PSQL_DB_USER:$KOBO_PSQL_DB_PASS@$DATABASE_SERVER_IP:5432/$KOBO_PSQL_DB_NAME"}
# Project Run 
cd $KOBOCAT_PATH
python manage.py runserver 0.0.0.0:8000
