1. Прописываем Dockerfile

2. Создаем необходимые файлы:

- init_postgres.sh(Это скрипт инициализации базы данных PostgreSQL , который запускается при старте контейнера)
- index.html(Этот файл представляет собой тестовую HTML-страницу, которая будет отображаться при доступе к веб-серверу Nginx)

3. Потом собираем образ командой: docker build -t galieva_ii_image_2025-06-04 .
![img.png](imgs/img.png)
![img_1.png](imgs/img_1.png)
4. Вывод слоев образа командой: docker history galieva_ii_image_2025-06-04
![img_2.png](imgs/img_2.png)
![img_3.png](imgs/img_3.png)

Образ создался
![img_4.png](imgs/img_4.png)