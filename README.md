docker-ccw
====================

Docker compose file and docker file for running linnaeus


Contents
-------------
Dockerfile in folder ccw creates the naturalis/ccw container



Instruction building image
-------------
No special instructions.

```
docker build naturalis/ccw:0.0.2 .
```

Instruction running docker-compose.yml
-------------

The repository is compatible with the puppet naturalis/puppet-docker_compose manifest and can be deployed using that manifests. 

#### preparation
- Copy env.template to .env and adjust variables. 
- Repo checkout only works is /var/www/html inside ccw container is empty, the entrypoint script will try to checkout te repo but can only succeed the first time.

````
docker-compose up -d
````

Usage
-------------
Apache can be accessed directly on port 8080
Minio can be accessed directly on port 9000
Traefik dashboard can be accessed on port 8081
If there is a valid traefik.toml with or without SSL then both services can be accessed through port 80/443. 
It is advised to setup firewall rules and only allow 80/443 to the server running the docker-compose project, use port 8080,9000 and 8081 using a SSH tunnel.


