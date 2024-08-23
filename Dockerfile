FROM node:20.17.0-alpine AS server
WORKDIR /home/node/app
COPY ./nextjs-dashboard/package.json ./nextjs-dashboard/pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

FROM server AS base
COPY ./nextjs-dashboard .

FROM base AS develop
ENTRYPOINT [ "pnpm" ]
CMD [ "dev" ]