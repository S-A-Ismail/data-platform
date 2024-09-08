#!/bin/bash

# Start the first process
source ~/.bashrc
/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG
wait -n
tail -f /dev/null
# # # Exit with status of process that exited first
exit $?