FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/

RUN npm install

# Bundle app source
COPY . /usr/src/app

RUN npm run build

EXPOSE 3000

ENV NODE_OPTIONS=--openssl-legacy-provider

CMD [ "npm", "start" ]