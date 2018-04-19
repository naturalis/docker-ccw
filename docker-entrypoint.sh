#!/bin/bash
# create symlinks
ln -s /data/documents /var/www/html/documents
ln -s /data/xml /var/www/html/xml


# copy default configs and modify password based on environment variables
/bin/sed -i -E "s/host = \".*/host = \"$MYSQL_HOST\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/db = \".*/db = \"$MYSQL_DB\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/user = \".*/user = \"$MYSQL_USER\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/pw = \".*/pw = \"$MYSQL_PASSWORD\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/taxa_db = \".*/taxa_db = \"$MYSQL_TAXA_DB\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/literature_db = \".*/literature_db = \"$MYSQL_LITERATURE_DB\";/" /var/www/html/includes/config.inc.php
/bin/sed -i -E "s/citat_db = \".*/citat_db = \"$MYSQL_CITAT_DB\";/" /var/www/html/includes/config.inc.php

/bin/sed -i -E "s/host = \".*/host = \"$MYSQL_HOST\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/db = \".*/db = \"$MYSQL_DB\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/user = \".*/user = \"$MYSQL_USER\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/pw = \".*/pw = \"$MYSQL_PASSWORD\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/taxa_db = \".*/taxa_db = \"$MYSQL_TAXA_DB\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/literature_db = \".*/literature_db = \"$MYSQL_LITERATURE_DB\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/citat_db = \".*/citat_db = \"$MYSQL_CITAT_DB\";/" /var/www/html/admin/admin_config.inc.php
/bin/sed -i -E "s/htdocs/html/g" /var/www/html/admin/admin_config.inc.php

mkdir -p /data/documents
mkdir -p /data/html/xml
mkdir -p /var/www/html/thumbnails
mkdir -p /var/www/html/images
chmod 777 -R /data/documents
chmod 777 -R /data/xml
chmod 777 -R /var/www/html/thumbnails
chmod 777 -R /var/www/html/images


# run server
/usr/sbin/apache2ctl -D FOREGROUND