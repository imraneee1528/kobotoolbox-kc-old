#!/usr/bin/env bash

# ENVIRONMENT PRESETS ALREADY IN /$SERVER_USER/koborc 	# <-- checked into the repository
# THIS FILE PULLS IN THE ENVIRONMENT AS DEFINED IN /$SERVER_USER/(env_kobocat|env_koboform) # respectively, for each project
# THESE VALUES MAY BE OVERRIDDEN BY /$SERVER_USER/env.sh (optional file) # <-- not checked into the repository

# scripts/01_environment_vars.sh

# Directories.
export HOME_VAGRANT=${HOME_VAGRANT:-"/usr/src/app"}
export SRC_DIR=${SRC_DIR:-"$HOME_VAGRANT/src_kc"}
#source code Information
export KOBOCAT_PATH=${KOBOCAT_PATH:-"$SRC_DIR/kobocat"}
export KOBOCAT_TEMPLATES_PATH=${KOBOCAT_TEMPLATES_PATH:-"$SRC_DIR/kobocat-template"}
#Datbase Information
export PSQL_ADMIN=${PSQL_ADMIN:-"postgres"}
export KOBO_PSQL_DB_NAME=${KOBO_PSQL_DB_NAME:-"kc-db"}
export KOBO_PSQL_DB_USER=${KOBO_PSQL_DB_USER:-"kobo"}
export KOBO_PSQL_DB_PASS=${KOBO_PSQL_DB_PASS:-"password"}
#export DATABASE_SERVER_IP=${DATABASE_SERVER_IP:-"192.168.19.88"}
export DATABASE_SERVER_IP=${DATABASE_SERVER_IP:-"192.168.19.220"}
export DATABASE_URL=${DATABASE_URL:-"postgis://$KOBO_PSQL_DB_USER:$KOBO_PSQL_DB_PASS@$DATABASE_SERVER_IP:5432/$KOBO_PSQL_DB_NAME"}

#settings specific details
export DJANGO_LIVE_RELOAD=${DJANGO_LIVE_RELOAD:-"False"}
export DJANGO_SITE_ID=${DJANGO_SITE_ID:-"1"}
export DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY:-"P2Nerc3oG2564z5mHTGUhAoh2CzOMVenWBNMNWgWU796n"}
export CLEAN_APT_CACHE=${CLEAN_APT_CACHE:-"True"}
export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-"kobocat_settings"}
export PYTHONPATH=${PYTHONPATH:-"/home/vagrant/env:$PYTHONPATH"}

cd $KOBOCAT_PATH
python manage.py runserver 0.0.0.0:8000
