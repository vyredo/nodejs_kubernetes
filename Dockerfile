FROM node:10

WORKDIR "/app"

COPY package.json ./

RUN npm install --production

COPY . /app

ENV NODE_ENV production
ENV PORT 3000

EXPOSE 3000

USER node

CMD ["npm", "start"]