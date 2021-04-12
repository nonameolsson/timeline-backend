FROM node:14-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./package.json ./yarn.lock /usr/src/app/

RUN yarn install --production --frozen-lockfile
RUN yarn build

COPY ./ /usr/src/app

ENV NODE_ENV production
ENV PORT 80
EXPOSE 80

CMD [ "yarn", "start" ]
