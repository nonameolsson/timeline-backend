FROM node:14-alpine

# Use production as default environment
# This can also be modified in CapRover
ARG NODE_ENV=production
ENV ENV_NODE_ENV=${NODE_ENV}

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./package.json ./yarn.lock /usr/src/app/

RUN yarn install --production --frozen-lockfile

COPY ./ /usr/src/app

RUN yarn build

ENV PORT 80
EXPOSE 80

CMD [ "yarn", "start" ]
