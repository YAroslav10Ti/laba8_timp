FROM ubuntu:latest

RUN apt-get update && apt-get install -y g++

WORKDIR /app

COPY main.cpp .

# Компилируем и сохраняем лог
RUN g++ main.cpp -o app 2> build_log.txt || touch build_log.txt

# Создаём директорию для вывода и копируем лог
RUN mkdir -p /output
CMD cp build_log.txt /output/ && exit 0
