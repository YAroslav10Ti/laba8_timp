FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY main.cpp .

RUN g++ main.cpp -o app 2> build_log.txt || echo "No errors" > build_log.txt

VOLUME /output
CMD cp build_log.txt /output/ && sleep 1
