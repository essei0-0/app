FROM node:12.4.0-alpine

WORKDIR /front/my-nuxt-app

RUN apk update
RUN apk add git
RUN npm install -g npm
RUN npm install -g vue-cli
ENV HOST 0.0.0.0
EXPOSE 8080