# OSS Data Platform Implementation

This is an attempt by me to replicate an OSS version of a complete Data Platform that can provide you with a push button solution when setting up for a dev/test or training environment for testing an training junior resources.

The standalone modes of these tools do not replicate an enterprise implementation of DE setups. I aim to dockerize and containerize these OSS softwares and then connect them in a way that is similar to an Enterprise/Paid solution. This way getting your hands dirty here prepare you for real world DE problems.

## Things I want to incorporate in this Platform:

### - An HMS

This comprises of two artifacts,

- A persistent postgres instance for storing Table metadata.
    - Code for bringing it up and maintaining it is not part of this repository. I manually installed it on my Ubuntu server using apt and linked it to the HMS service.
    - The reason for doing so, is persisting the Table metadata even if I stop/bring down docker compose.

- A HMS service. 
    -  This I use for inititalizing the PostGres as an HMS and then using it for the same purpose.

### - A Spark Cluster

For any Data Platform Spark can be a major component, The aim for this project is to immitate Databricks (wishful thinking) but worst case scenario at least EMR providing a cluster compute or scalable DE simulated experience.

    - I use OSS spark binaries to start a Master node and the same for running worker nodes.
    - As of now I have these in static 1 M and 1 W but in future, I aim to add scalability via K8s (Wish me luck!)

### - Object Storage Replica

The Enterprise offerings I have so far compared with communicate with enterprise object stores like S3, ADLS or GCP storage. I wan't to mimic the same on local so I initially went with LocalStack to mimic S3. Although the current version of this project works but LocalStack S3 data is not stored once the Container is stopped. (It has a persistence option but behind a Pay wall so ... maybe later)

    - Workaround 1, just remove Local stack from the Docker Compose and run it persistently on the server (Like with Postgres).
    - Workaround 2, test out Minio (Which is being done on a branch rn!)

### - Future Additions

    - This is not the end, Once I am done with fixing the above. I plan on adding an Airflow node for Orchestration and a Dremio or Trico node for Data modelling on the Lakehouse (Powered by Apache Iceberg)