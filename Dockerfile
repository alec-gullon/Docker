FROM node:alpine as assets
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run prod

FROM composer:latest
WORKDIR /app

COPY --from=assets /app/public /app/public

RUN composer install
RUN cp .env.example .env
RUN php artisan key:generate

EXPOSE 80

CMD php artisan serve --host=0.0.0.0 --port=80