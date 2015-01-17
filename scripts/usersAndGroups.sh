
# User which will own the HDFS services.
ENV HDFS_USER hdfs 

# User which will own the YARN services.
ENV YARN_USER yarn 

# User which will own the MapReduce services.
ENV MAPRED_USER mapred 

# User which will own the Pig services.
ENV PIG_USER pig 

# User which will own the Hive services.
ENV HIVE_USER hive 

# User which will own the Templeton services.
ENV WEBHCAT_USER hcat 

# User which will own the HBase services.
ENV HBASE_USER hbase 

# User which will own the ZooKeeper services.
ENV ZOOKEEPER_USER zookeeper 

# User which will own the Oozie services.
ENV OOZIE_USER oozie 

# User which will owen the Accumulo services.
ENV ACCUMULO_USER accumulo

# A common group shared by services.
ENV HADOOP_GROUP hadoop 
