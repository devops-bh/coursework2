FROM node:latest

WORKDIR /app
COPY . .

EXPOSE 8080 8080

CMD ["node", "server.js"]
