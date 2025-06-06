FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY main.cpp .

# Явно перенаправляем вывод компиляции
RUN { g++ main.cpp -o app 2>&1; echo $? > exit_code; } | tee build_log.txt
RUN [ "$(cat exit_code)" = "0" ] && echo "Compilation successful" >> build_log.txt

VOLUME /output
CMD cp build_log.txt /output/ && echo "Log file copied to /output" && sleep 1
