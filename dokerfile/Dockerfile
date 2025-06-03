# Используем базовый образ Ubuntu 22.04
FROM ubuntu:22.04

# Указываем автора
MAINTAINER Галиева Илюза <galievailyu@yandex.ru>

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Moscow

# Обновляем систему и устанавливаем Nginx и PostgreSQL
RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx postgresql && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /home/ubuntu

# Устанавливаем переменную окружения
ENV APP_HOME=/var/www/html

# Копируем свой index.html в веб-директорию
COPY index.html $APP_HOME/

# Добавляем скрипт инициализации БД
ADD init_postgres.sh /tmp/init_postgres.sh
RUN chmod +x /tmp/init_postgres.sh

# Создаем volume для хранения данных PostgreSQL
VOLUME ["/var/lib/postgresql", "/etc/nginx"]

# Открываем порты: 80 для Nginx, 5432 для PostgreSQL
EXPOSE 80 5432

# Создаем отдельного пользователя и переключаемся на него
USER www-data

# Команда запуска: запускаем Nginx и PostgreSQL
CMD service postgresql start && \
    /tmp/init_postgres.sh && \
    nginx -g 'daemon off;'