
FROM mhart/alpine-node:12
FROM alpine:3.9
# Change working directory
WORKDIR "/app"
# Update packages and install dependency packages for services
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean \
 && echo 'Finished installing dependencies'
# Copy package.json and package-lock.json
COPY package*.json ./
# Install npm production packages 
RUN npm install --production


FROM node:12-slim
WORKDIR "/app"
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean \
 && echo 'Finished installing dependencies'

COPY --from=0 /app/node_modules /app/node_modules
COPY . /app

ENV NODE_ENV production
ENV PORT 3000
USER node
EXPOSE 3000

CMD ["npm", "start"]
