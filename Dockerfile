FROM node:alpine as assets
WORKDIR /app
COPY . .
RUN npm install
RUN npm run prod

FROM composer:latest
COPY --from=assets /app /app

WORKDIR /app

RUN composer install
RUN cp .env.example .env
RUN php artisan key:generate

EXPOSE 80

CMD ls
# CMD php artisan serve --host=0.0.0.0 --port=80