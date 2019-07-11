#!/bin/bash
wget -q -O- http://prometheus:9090/api/v1/label/__name__/values | grep mssql\_deadlocks