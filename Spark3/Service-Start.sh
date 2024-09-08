#!/bin/bash

# Start the first process
#/opt/spark/bin/spark-class org.apache.spark.deploy.master.Master --host $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG
#source ~/.bashrc
bash /opt/spark/sbin/start-master.sh
# wait 
# # # Start the second process
# export SPARK_HOME="/mnt/spark"
# /opt/livy/bin/livy-server start
  
# # # # Wait for any process to exit
# wait -n
tail -f /dev/null
# # # # Exit with status of process that exited first
# exit $?