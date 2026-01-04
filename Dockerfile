FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm install --omit=dev

COPY . .

ENV NODE_ENV=production

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]