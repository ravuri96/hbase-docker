# hbase-docker

This is regular light weight hbase docker image which run in **hbase.cluster.distributed mode**. This image can be used for testing and local enviroments to spinup a spinup a hbase in distributed mode.


## To build image:
Clone the repo and build the docker image using the commands below:

```
docker build -t hbase-docker:${tag_name_which_you_like} .
```

## To start the docker image:

```
docker-compose up -d
```

After starting up the docker container. verify that all services are running.

copy paste the both links in browser and see all the service are working.
http://localhost/60010 - hbase master server
http://localhost/60030 - hbase region server
