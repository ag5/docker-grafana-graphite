#!/bin/bash
echo "Initializing storage directory ..."
mkdir -p /opt/storage/whisper

touch /opt/graphite/storage/graphite.db /opt/graphite/storage/index

chown -R www-data /opt/graphite/storage
chmod 0775 /opt/graphite/storage /opt/storage/whisper
chmod 0664 /opt/graphite/storage/graphite.db

cd /opt/graphite/webapp/graphite
python manage.py syncdb --noinput

/usr/bin/supervisord
