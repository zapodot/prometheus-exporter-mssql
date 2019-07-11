# prometheus-exporter-mssql
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/zapodot/prometheus-exporter-mssql.svg) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/zapodot/prometheus-exporter-mssql.svg)

Docker packaging for the Prometheus SQLServer exporter created by [DanielOliver](//github.com/DanielOliver/mssql_exporter).

The docker image is based on the [Google Cloud distroless dotnet](https://console.cloud.google.com/gcr/images/distroless/GLOBAL/dotnet?gcrImageListsize=30) image which should keep it small and relatively secure. 

## Exposed ports
| Port | Protocol | Description                                     |
| ---- | -------- | ----------------------------------------------- |
| 8080 | http     | Endpoint where the /metrics endpoint is exposed |

## Environment variables
All environment variables documented in [Daniel's readme file](://github.com/DanielOliver/mssql_exporter/blob/master/README.md) are supported and some of them even have default values. 

| Name                                                                   | Default value                 | Note                                                                     |
| -------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------------- |
| PROMETHEUS_MSSQL_DataSource                |   -                                     | Server=tcp:_hostname_,1433;Initial Catalog=_database_;Persist Security Info=False;User ID=_user_;Password=_password_; |
| PROMETHEUS_MSSQL_ConfigFile                   | _/data/data.json_          | mount your configuration volume here        |
| PROMETHEUS_MSSQL_ServerPath | _/metrics_ | The endopoint that prometheus can scrape metrics from |
| PROMETHEUS_MSSQL_ServerPort | _8080_ | The port to expose the endpoint through |
| PROMETHEUS_MSSQL_AddExporterMetrics | false                                | Whether or not the exporter itself should report metrics      |

 
## Volumes
| Volume         | Description                                     |
| -------------- | ----------------------------------------------- |
| /data          | mount point for configuration files             |

