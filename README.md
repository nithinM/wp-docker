##wp-docker - Docker for Wordpress development

####Prerequisite

- [git](https://git-scm.com/downloads)
- [Docker and Docker Compose](https://www.docker.com/products/docker/) latest

####Installation

1 - Clone the **wp-docker** in to your **Wordpress** project root directory
```
git clone https://github.com/nithinM/wp-docker.git
```

2 - Update environment variables in `develop.sh` if needed. (recommended to use **APP_PORT** as **80**)

3 - Update external network name `WP-DOCKER` in `docker-compose.yml` if needed.

4 - Create new network if needed. (change `WP-DOCKER` to yours, if you change it)
```
docker network create WP-DOCKER
```
5 - Add a custom domain to the hosts file. (see the below example)

```
127.0.0.1 wpdocker.local
0.0.0.0 wpdocker.local
```

6 - Build the environment and run the containers
```
./develop.sh up -d
```

####Useful commands

- List containers
```
./develop.sh
```

