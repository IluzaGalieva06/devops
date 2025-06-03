#!/bin/bash
set -e

# Создаем тестовую БД и пользователя
su - postgres -c "psql -c \"CREATE USER test_user WITH PASSWORD 'test_pass';\""
su - postgres -c "psql -v ON_ERROR_STOP=1 --command=\"CREATE DATABASE test_db OWNER test_user;\""