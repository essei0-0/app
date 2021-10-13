FROM node:12.4.0-alpine

WORKDIR /front

RUN apk update
RUN apk add git
RUN npm install -g npm
RUN npm install -g vue-cli

#vue-app/config/index.jsの設定を環境変数で上書き。
#アクセスがlocalhostだけでなく全てのホストから可能に。
ENV HOST 0.0.0.0

#コンテナの8080開けてます。
#ここで設定してるわけではない。(ただのドキュメント)
EXPOSE 8080

WORKDIR /front/vue-app

CMD ["npm", "run", "dev"]