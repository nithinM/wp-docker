FROM node:9.3.0

MAINTAINER Nithin Madhuranga <nithin@axis.lk>

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoclean

RUN npm install -g yarn

WORKDIR /var/www/html
