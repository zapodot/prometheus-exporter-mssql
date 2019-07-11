FROM alpine:3.9 AS build-env
ARG MSSQL_EXPORTER_VERSION="0.3.0"
ENV DOWNLOAD_URI=https://github.com/DanielOliver/mssql_exporter/releases/download/${MSSQL_EXPORTER_VERSION}/mssql_exporter_linux_x64.tar
RUN apk add curl
RUN echo "Downloading from ${DOWNLOAD_URI}" && mkdir target && curl -O -J -L ${DOWNLOAD_URI} -o /mssql_exporter_linux_x64.tar && tar xvf /mssql_exporter_linux_x64.tar -C target/


FROM gcr.io/distroless/dotnet
LABEL maintainer="zapodot@gmail.com"
VOLUME /data
ENV PROMETHEUS_MSSQL_ConfigFile="/data/data.json"
ENV PROMETHEUS_MSSQL_ServerPath="/metrics"
ENV PROMETHEUS_MSSQL_ServerPort=8080
ENV PROMETHEUS_MSSQL_AddExporterMetrics="false"
COPY --from=build-env /target /app/
WORKDIR /app
CMD [ "./mssql_exporter", "serve" ]