# Общее

Набор скриптов для загрузки локального кеша Maven в центральный репозиторий компании на основе Sonatype Nexus 3.x

## Список файлов

* 00-exec.sh - Файл запуска загрузки
* 01-upload-pom.sh - Загрузка только POM файлов
* 02-upload-all.sh - Загрузка JAR и POM файлов

## Пример использования

Запуск скрипта из командной строки
```
./00-exec.sh nexus.server-n01.local maven-local user P@ssw0rd ~/.m2/repository
```

Интерактивный запуск

```
./00-exec.sh
```