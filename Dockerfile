
FROM node:12-slim
# Change working directory
WORKDIR "/app"
# Copy package.json and package-lock.json
COPY package*.json ./
# Install npm production packages 
RUN npm install --production


FROM node:12-slim
WORKDIR "/app"

COPY --from=0 /app/node_modules /app/node_modules
COPY . /app

ENV NODE_ENV production
ENV PORT 3000
USER node
EXPOSE 3000

CMD ["npm", "start"]
