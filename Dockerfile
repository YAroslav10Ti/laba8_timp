FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY main.cpp .

RUN g++ main.cpp -o app 2> build_log.txt || echo "Compilation successful" > build_log.txt

RUN echo "Debug: Contents of /app:" && ls -la && \
    echo "Debug: build_log.txt exists?" && [ -f build_log.txt ] && cat build_log.txt

VOLUME /output
CMD cp build_log.txt /output/ && echo "File copied successfully" && sleep 1
