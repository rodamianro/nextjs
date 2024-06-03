FROM node:19-alpine as base
WORKDIR /home/node/app
COPY . .
RUN mkdir -p /node_modules && chown -R node:node ./
RUN npm install

FROM base as develop
ENTRYPOINT [ "npm", "run" ]
CMD [ "dev" ]