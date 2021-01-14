

```bash
$ hdfs dfs -mkdir -p platzi # Creamos un directorio en Hadoop
$ hdfs dfs -ls
$ hdfs dfs -put ejemplo.txt platzi/

```

# Comparando con elasticSearch

```bash
$ docker network create -d bridge hadoopNet

$ docker run -p 9200:9200 -p 9300:9300 --net=hadoopNet --name elasticsearch \
    -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.6.2

$ docker run -it --rm --net=hadoopNet --name logstash -v "$PWD/pipeline":/app --entrypoint bash docker.elastic.co/logstash/logstash:7.6.2

$ docker run --rm --name kibana --net=hadoopNet -p 5601:5601 kibana:7.6.2

```
