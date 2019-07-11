# prometheus-exporter-mssql
Docker packaging for the SQLServer exporter created by [DanielOliver](//github.com/DanielOliver/mssql_exporter)
The docker image is based on the [Google Cloud distroless dotnet](https://console.cloud.google.com/gcr/images/distroless/GLOBAL/dotnet?gcrImageListsize=30) image which should keep it small and relatively secure. 

## Exposed ports
| Port | Protocol | Description                                     |
| ---- | -------- | ----------------------------------------------- |
| 8080 | http     | Endpoint where the /metrics endpoint is exposed |

## Environment variables
All environment variables documented in Daniel's readme file are supported and some of them even have default values. 
| Name                            | Default value                          | Note                             |
| ------------------------------- | -------------------------------------- | -------------------------------- |
| PROMETHEUS_MSSQL_DataSource     |                                        | Server=tcp:localhost,1433;Initial Catalog=database;Persist Security Info=False;User ID=user;Password=password;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30; |
| PROMETHEUS_MSSQL_ConfigFile     | _/data/data.json_                      | mount your volume here           |
| PROMETHEUS_MSSQL_AddExporterMetrics | false | Whether or not the exporter itself should report metrics      |
 
## Volumes
| Volume         | Description                                     |
| -------------- | ----------------------------------------------- |
| /data          | mount point for configuration files             |

