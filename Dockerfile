
FROM node:24.11.0-alpine
WORKDIR /app
COPY package*.json .
RUN npm install
#TODO remove then user-config.json file and replace by an .env from COPY to prevent leaking api keys to docker image.
COPY . .
RUN npm run build
RUN npm install -g .
RUN chmod +x tits-script.sh
RUN chmod 0644 tits-cron
RUN crontab tits-cron
ENTRYPOINT ["/usr/sbin/crond", "-f"]