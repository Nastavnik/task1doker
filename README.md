# task1doker

Задание 1 
(В вашей команде завелся джун! Джун написал скрипт на SQL и очень этим гордится. Скрипт предназначен для аналитиков, и они очень хотят им воспользоваться — да вот проблема — проверить, как скрипт работает, они не могут, у них просто нет самой базы. Но не беда — вы точно сможете помочь товарищам! Для этого вам нужно создать dockerfile, в котором необходимо описать инструкции для развертывания СУБД Postgres и добавить в этот образ автоматический запуск скрипта от вашего коллеги-джуна. На основе данного docker-файла необходимо запустить контейнер и убедиться, что база действительно поднялась и скрипт вашего коллеги отработал.)
Создаем по образу докер:
docker build . -f Dockerfile.db или docker build .
Запускаем докер
docker run --rm -p 5432:5432 --name docker_test -e POSTGRES_PASSWORD=keypass -e POSTGRES_USER=SERG -e POSTGRES_DB=db_test -d postgres
-----------------
Задание 2 
(Вы справились с предыдущим заданием — прекрасно! Аналитики с удовольствием изучили табличку, которую собрал ваш коллега-джун, да вот данных в ней маловато для полноценного исследования. Джун сразу же побежал ручками менять скрипт, но вы его остановили. Теперь вам необходимо написать специальную команду docker, которая позволит подключаться к работающему контейнеру, запускать интерфейс psql и вносить новые данные «на лету».)
docker exec -it docker_test bash (docker exec -it <container-name> bash)
далее 
psql -U <dataBaseUserName> <dataBaseName>
psql -U SERG db_test
далее
CREATE TABLE IF NOT EXISTS public.users (
    user_id BIGINT,
    name VARCHAR,
    pasport_id BIGINT);
INSERT INTO public.users (user_id, name, pasport_id) VALUES
    (1, 'ARN', 175002),
    (2, 'DORA', 182001),
    (3, 'ADAM', 181002);
--------------------------
Задание 3 
(Случилось неладное — ваш коллега-джун случайно удалил ваш прекрасно работающий контейнер. Вы, конечно же, поспешили контейнер перезапустить, да вот только новых данных, которые коллеги-аналитики добавили на предыдущем шаге, в базе не оказалось. Теперь, чтобы в будущем избежать подобных историй,  вам необходимо добавить в docker-файл специальную инструкцию, которая вызывает механизм для хранения данных в контейнере и убедиться, что он исправно работает.)
docker run --rm -d --name docker_test -p 5432:5432 -v /data:/var/lib/postgresql/data postgres:latest
Создаем Volumes -v и прописываем путь между /data:(данные в моей системе) /var/lib/postgresql/data postgres:latest (система самого контейнера)
