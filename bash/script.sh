#!/bin/bash

log() {
    echo "$1"
    echo "$1" >> "$LOG_FILE"
}

if [[ "$1" == "-d" && -n "$2" ]]; then
    BASE_DIR="$2"
else
    read -p "Введите путь для создания директорий: " BASE_DIR
fi

LOG_FILE="${BASE_DIR}/script.log"
> "$LOG_FILE"  

log "Начало работы скрипта"

if ! getent group dev > /dev/null; then
    log "Создание группы dev"
    groupadd dev
else
    log "Группа dev уже существует"
fi

for user in $(awk -F: '($3 >= 1000) {print $1}' /etc/passwd); do
    if ! groups "$user" | grep -q "\bdev\b"; then
        log "Добавление пользователя $user в группу dev"
        usermod -aG dev "$user"
    else
        log "Пользователь $user уже в группе dev"
    fi
done

SUDOERS_FILE="/etc/sudoers.d/dev_sudo"
if [[ ! -f "$SUDOERS_FILE" ]]; then
    log "Настройка прав sudo для группы dev"
    echo "%dev ALL=(ALL) NOPASSWD:ALL" > "$SUDOERS_FILE"
    chmod 440 "$SUDOERS_FILE"
else
    log "Права sudo для группы dev уже настроены"
fi

for user in $(awk -F: '($3 >= 1000) {print $1}' /etc/passwd); do
    USER_DIR="${BASE_DIR}/${user}_workdir"
    if [[ ! -d "$USER_DIR" ]]; then
        log "Создание директории $USER_DIR для пользователя $user"
        mkdir -p "$USER_DIR"
        chown "$user:$user" "$USER_DIR"
        chmod 660 "$USER_DIR"
        
        setfacl -m g:dev:r-x "$USER_DIR"
    else
        log "Директория $USER_DIR уже существует"
    fi
done

log "Работа скрипта завершена"