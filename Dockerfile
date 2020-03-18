FROM composer:latest

WORKDIR /app
COPY . /app
RUN composer install

EXPOSE 80

CMD php artisan serve --host=0.0.0.0 --port=80
