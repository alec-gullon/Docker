FROM composer:latest

WORKDIR /app
COPY . /app
RUN composer install
RUN cp .env.example .env
RUN php artisan key:generate

EXPOSE 80

CMD php artisan serve --host=0.0.0.0 --port=80