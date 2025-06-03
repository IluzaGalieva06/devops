1. Прописываем Dockerfile

2. Создаем необходимые файлы:

- init_postgres.sh(Это скрипт инициализации базы данных PostgreSQL , который запускается при старте контейнера)
- index.html(Этот файл представляет собой тестовую HTML-страницу, которая будет отображаться при доступе к веб-серверу Nginx)

3. Потом собираем образ командой: docker build -t galieva_ii_image_2025-06-03 .
![img.png](imgs/img.png)
4. Вывод слоев образа командой: docker history galieva_ii_image_2025-06-03
![img_1.png](imgs/img_1.png)

Образ создался
![img_2.png](imgs/img_2.png)

Открывает html 
![img_3.png](imgs/img_3.png)
