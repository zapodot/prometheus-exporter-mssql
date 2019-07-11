#!/bin/bash
sleep 10
echo "Calling Prometheus HTTP API"
if wget -q -O- 'http://prometheus:9090/api/v1/label/__name__/values' | jq '.data[] | select(. == "mssql_deadlocks")'; then
    echo "Tests passed"
    exit 0
else
    echo "Test failed"
    exit 2
fi