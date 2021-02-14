# Apache Hadoop + Spark + JupyterLab deployment in Docker

Deploy JupiterLab with a Spark Cluster and a HDFS.

Run `docker-build.sh` file in order to build all necessary images.

```
chmod +x docker-build.sh
./docker-build.sh
```
For all deployment:
```
docker-compose up
```
For deploy only JupyterLab with Spark Cluster:
```
docker-compose -f docker-compose-spark.yaml up
```
Available ports:

|  Port           | Usage                                       |
|-----------------|---------------------------------------------|
| `50070`         | Hadoop UI                                   |
|  `8080`         | Spark Master UI                             |
|  `8081`         | JupyterLab                                  |
|  `4040`, `4041` | Spark driver when SparkContext is launched  |


## Launch an SparkContext in Jupyter Notebook
```
from pyspark.sql import SparkSession

spark = SparkSession.\
        builder.\
        appName("pyspark-notebook").\
        master("spark://spark-master:7077").\
        config("spark.executor.memory", "512m").\
        getOrCreate()
```

## Attach files from remote hdfs

```
df = spark.read.csv('hdfs://hadoop-master:9000/[FILE_DIRECTORY]')
```

## Default configuration:
- Hadoop Cluster (1 Master Node, 2 Slaves)
- Spark Cluster (1 Master Node, 1 Worker Node)
- Jupyter deployment


## Python dependencies
All Python librearies should be listed in `jupyerlab/config/requirements.txt`.
