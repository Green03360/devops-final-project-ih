FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV PORT=8706
EXPOSE 8706

CMD ["npm", "start"]
