# task1doker
Создание 1 докера
Создаем по образу докер:
docker build . -f Dockerfile.db
Запускаем докер
docker run --rm -p 5432:5432 --name docker_test -e POSTGRES_PASSWORD=keypass -e POSTGRES_USER=SERG -e POSTGRES_DB=db_test -d postgres
