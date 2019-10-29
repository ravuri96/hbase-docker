#!/bin/sh

#subistute the environment varibles

envsubst < "$CONFIG_FILE_TEMPLATE_PATH" > "$CONFIG_FILE_PATH"

#show the config file

cat $CONFIG_FILE_PATH

#start the hbase and tail logs

/usr/bin/supervisord -c /etc/supervisord.conf