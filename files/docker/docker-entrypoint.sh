#!/bin/sh
export GALAXY_DB='postgres://postgres:'$PG_ENV_POSTGRES_PASSWORD'@db:5432/postgres'
python /opt/env_to_ini.py /opt/galaxy.ini.template /opt/galaxy/config/galaxy.ini
sh run.sh --no-create-venv --skip-venv
