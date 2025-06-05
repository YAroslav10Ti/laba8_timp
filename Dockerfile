FROM ubuntu:latest

RUN apt-get update && apt-get install -y g++

WORKDIR /app

COPY main.cpp .

RUN g++ main.cpp -o app 2> build_log.txt

CMD ["sh", "-c", "cp build_log.txt /output"]
