docker-ccw
====================

Docker compose file and docker file for running linnaeus

Persistent volumes
 - "/data/linnaeus/www:/var/www/html"  
   Filled from repository https://github.com/naturalis/linnaeus when empty. 
 - "/data/linnaeus/apachelog:/var/log/apache2"
   apache access and error logs
 - "/data/linnaeus/initdb:/docker-entrypoint-initdb.d"
   initdb 
 - "/data/linnaeus/db:/var/lib/mysql"
   persistent mysql volume

webserver runs on port 80

Contents
-------------
Dockerfile creates the naturalis/ccw container



Instruction building image
-------------
No special instructions
```
docker build naturalis/ccw:0.0.1 .
```

Instruction running docker-compose.yml
-------------

#### preparation
- Copy env.template to .env and adjust variables. 
- Copy initdb directory to /data/ccw/initdb
- Edit /data/ccw/initdb/1_init.sql and adjust PASSWORD to correct password set in .env
- Copy mysql_config_template to  /data/ccw/mysqlconf/custom_config.cfg


````
docker-compose up -d
````

Usage
-------------

````


````

