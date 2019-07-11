FROM alpine:3.9
ENV DOCKERIZE_VERSION v0.6.1
RUN apk add wget bash jq
RUN wget -q https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
ENTRYPOINT [ "dockerize", "-timeout", "180s", "-wait", "tcp://sqlserver:1433", "-wait", "http://prometheus:9090", "-wait", "http://prometheus-exporter-mssql:8080/metrics" ]
WORKDIR /app
ADD test.sh test.sh
RUN ["chmod", "+x", "/app/test.sh"]
CMD [ "/app/test.sh" ]