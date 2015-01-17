

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

ENV NAGIOS_USER nagios
ENV FALCON_USER falcon
ENV SQOOP_USER	sqoop
ENV KNOX_USER knox

# A common group shared by services.
ENV HADOOP_GROUP hadoop 
ENV MAPRED_GROUP mapred 
ENV NAGIOS_GROUP nagios 

# User & Groups

RUN addgroup $HADOOP_GROUP \
&& addgroup $MAPRED_GROUP \
&& useradd -g $HADOOP_GROUP $HDFS_USER \
&& useradd -g $HADOOP_GROUP $ACCUMULO_USER \
&& useradd -g $HADOOP_GROUP $OOZIE_USER \
&& useradd -g $HADOOP_GROUP $ZOOKEEPER_USER \
&& useradd -g $HADOOP_GROUP $HBASE_USER \
&& useradd -g $HADOOP_GROUP $WEBHCAT_USER \
&& useradd -g $HADOOP_GROUP $HIVE_USER \
&& useradd -g $HADOOP_GROUP $PIG_USER \
&& useradd -g $HADOOP_GROUP $MAPRED_USER \
&& useradd -g $MAPRED_GROUP $MAPRED_USER \
&& useradd -g $HADOOP_GROUP $YARN_USER \
&& useradd -g $NAGIOS_GROUP $NAGIOS_USER \
&& useradd -g $HADOOP_GROUP $FALCON_USER \
&& useradd -g $HADOOP_GROUP $SQOOP_USER \
&& useradd -g $HADOOP_GROUP $KNOX_USER



# Hadoop Service - HDFS
# Space separated list of directories where NameNode will store file system image. For example, /grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn
ENV DFS_NAME_DIR /hadoop/hdfs/nn
RUN mkdir -p $DFS_NAME_DIR 
chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR 
chown -R 755 $DFS_NAME_DIR

# Space separated list of directories where DataNodes will store the blocks.For example, /grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn
ENV DFS_DATA_DIR /hadoop/hdfs/dn
RUN mkdir -p $DFS_DATA_DIR 
RUN chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR 
RUN chown -R 755 $DFS_DATA_DIR

# Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, /grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn
ENV FS_CHECKPOINT_DIR /hadoop/hdfs/snn
RUN mkdir -p $FS_CHECKPOINT_DIR 
RUN chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR 
RUN chown -R 755 $FS_CHECKPOINT_DIR

# Directory to store the HDFS logs.
ENV HDFS_LOG_DIR /var/log/hadoop/hdfs
RUN mkdir -p $HDFS_LOG_DIR 
RUN chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR 
RUN chown -R 755 $HDFS_LOG_DIR

# Directory to store the HDFS process ID.
ENV HDFS_PID_DIR /var/run/hadoop/hdfs
RUN mkdir -p HDFS_PID_DIR 
RUN chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR 
RUN chown -R 755 $HDFS_PID_DIR

# Directory to store the Hadoop configuration files.
ENV HADOOP_CONF_DIR /etc/hadoop/conf
RUN mkdir -p $HADOOP_CONF_DIR 
RUN chown -R $HDFS_USER:$HADOOP_GROUP $HADOOP_CONF_DIR 
RUN chown -R 755 $HADOOP_CONF_DIR



# Hadoop Service - YARN 

# Space separated list of directories where YARN will store temporary data. For example, /grid/hadoop/yarn/local /grid1/hadoop/yarn/local /grid2/hadoop/yarn/local
ENV YARN_LOCAL_DIR /hadoop/yarn/local
RUN mkdir -p $YARN_LOCAL_DIR
RUN chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_DIR
RUN chown -R 755 $YARN_LOCAL_DIR

# Directory to store the YARN logs.
ENV YARN_LOG_DIR /var/log/hadoop/yarn
RUN mkdir -p $YARN_LOG_DIR
RUN chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOG_DIR
RUN chown -R 755 $YARN_LOG_DIR
# Space separated list of directories where YARN will store container log data. For example, /grid/hadoop/yarn/logs /grid1/hadoop/yarn/logs /grid2/hadoop/yarn/logs
ENV YARN_LOCAL_LOG_DIR /hadoop/yarn/logs
RUN mkdir -p $YARN_LOCAL_LOG_DIR
RUN chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_LOG_DIR
RUN chown -R 755 $YARN_LOCAL_LOG_DIR
# Directory to store the YARN process ID.
ENV YARN_PID_DIR /var/run/hadoop/yarn
RUN mkdir -p $YARN_PID_DIR
RUN chown -R $YARN_USER:$HADOOP_GROUP $YARN_PID_DIR
RUN chown -R 755 $YARN_PID_DIR

# Hadoop Service - MAPREDUCE

# Directory to store the MapReduce daemon logs.
ENV MAPRED_LOG_DIR /var/log/hadoop/mapred
RUN mkdir -p $MAPRED_LOG_DIR
RUN chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR
RUN chown -R 755 $MAPRED_LOG_DIR
# Directory to store the mapreduce jobhistory process ID.
ENV MAPRED_PID_DIR /var/run/hadoop/mapred
RUN mkdir -p $MAPRED_PID_DIR
RUN chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR
RUN chown -R 755 $MAPRED_PID_DIR
#
# Hadoop Service - Hive

# Directory to store the Hive configuration files.
ENV HIVE_CONF_DIR /etc/hive/conf
RUN mkdir -p $HIVE_CONF_DIR
RUN chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_CONF_DIR
RUN chown -R 755 $HIVE_CONF_DIR
# Directory to store the Hive logs.
ENV HIVE_LOG_DIR /var/log/hive
RUN mkdir -p $HIVE_LOG_DIR
RUN chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_LOG_DIR
RUN chown -R 755 $HIVE_LOG_DIR
# Directory to store the Hive process ID.
ENV HIVE_PID_DIR /var/run/hive
RUN mkdir -p $HIVE_PID_DIR
RUN chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_PID_DIR
RUN chown -R 755 $HIVE_PID_DIR
#
# Hadoop Service - WebHCat (Templeton)
#

# Directory to store the WebHCat (Templeton) configuration files.
ENV WEBHCAT_CONF_DIR /etc/hcatalog/conf/webhcat
RUN mkdir -p $WEBHCAT_CONF_DIR
RUN chown -R $WEBHCAT_USER:$HADOOP_GROUP $WEBHCAT_CONF_DIR
RUN chown -R 755 $WEBHCAT_CONF_DIR

# Directory to store the WebHCat (Templeton) logs.
ENV WEBHCAT_LOG_DIR /var/log/webhcat
RUN mkdir -p $WEBHCAT_LOG_DIR
RUN chown -R $WEBHCAT_USER:$HADOOP_GROUP $WEBHCAT_LOG_DIR
RUN chown -R 755 $WEBHCAT_LOG_DIR
# Directory to store the WebHCat (Templeton) process ID.
ENV WEBHCAT_PID_DIR /var/run/webhcat
RUN mkdir -p $WEBHCAT_PID_DIR
RUN chown -R $WEBHCAT_USER:$HADOOP_GROUP $WEBHCAT_PID_DIR
RUN chown -R 755 $WEBHCAT_PID_DIR
#
# Hadoop Service - HBase
#

# Directory to store the HBase configuration files.
ENV HBASE_CONF_DIR /etc/hbase/conf 
RUN mkdir -p $HBASE_CONF_DIR
RUN chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_CONF_DIR
RUN chown -R 755 $HBASE_CONF_DIR
# Directory to store the HBase logs.
ENV HBASE_LOG_DIR /var/log/hbase 
RUN mkdir -p $HBASE_LOG_DIR
RUN chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_LOG_DIR
RUN chown -R 755 $HBASE_LOG_DIR
# Directory to store the HBase logs.
ENV HBASE_PID_DIR /var/run/hbase 
RUN mkdir -p $HBASE_PID_DIR
RUN chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_PID_DIR
RUN chown -R 755 $HBASE_PID_DIR
#
# Hadoop Service - ZooKeeper
#

# Directory where ZooKeeper will store data. For example, /grid1/hadoop/zookeeper/data
ENV ZOOKEEPER_DATA_DIR TODO-ZOOKEEPER-DATA-DIR 
RUN mkdir -p $ZOOKEEPER_DATA_DIR
RUN chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_DATA_DIR
RUN chown -R 755 $ZOOKEEPER_DATA_DIR
# Directory to store the ZooKeeper configuration files.
ENV ZOOKEEPER_CONF_DIR /etc/zookeeper/conf 
RUN mkdir -p $ZOOKEEPER_CONF_DIR
RUN chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_CONF_DIR
RUN chown -R 755 $ZOOKEEPER_CONF_DIR
# Directory to store the ZooKeeper logs.
ENV ZOOKEEPER_LOG_DIR /var/log/zookeeper 
RUN mkdir -p $ZOOKEEPER_LOG_DIR
RUN chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_LOG_DIR
RUN chown -R 755 $ZOOKEEPER_LOG_DIR
# Directory to store the ZooKeeper process ID.
ENV ZOOKEEPER_PID_DIR /var/run/zookeeper 
RUN mkdir -p $ZOOKEEPER_PID_DIR
RUN chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_PID_DIR
RUN chown -R 755 $ZOOKEEPER_PID_DIR
#
# Hadoop Service - Pig
#

# Directory to store the Pig configuration files.
ENV PIG_CONF_DIR /etc/pig/conf 
RUN mkdir -p $PIG_CONF_DIR
RUN chown -R $PIG_USER:$HADOOP_GROUP $PIG_CONF_DIR
RUN chown -R 755 $PIG_CONF_DIR
# Directory to store the Pig logs.
ENV PIG_LOG_DIR /var/log/pig 
RUN mkdir -p $PIG_LOG_DIR
RUN chown -R $PIG_USER:$HADOOP_GROUP $PIG_LOG_DIR
RUN chown -R 755 $PIG_LOG_DIR
# Directory to store the Pig process ID.
ENV PIG_PID_DIR /var/run/pig 
RUN mkdir -p $PIG_PID_DIR
RUN chown -R $PIG_USER:$HADOOP_GROUP $PIG_PID_DIR
RUN chown -R 755 $PIG_PID_DIR

#
# Hadoop Service - Oozie
#

# Directory to store the Oozie configuration files.
ENV OOZIE_CONF_DIR /etc/oozie/conf 
RUN mkdir -p $OOZIE_CONF_DIR
RUN chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_CONF_DIR
RUN chown -R 755 $OOZIE_CONF_DIR
# Directory to store the Oozie data.
ENV OOZIE_DATA /var/db/oozie
RUN mkdir -p $OOZIE_DATA
RUN chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_DATA
RUN chown -R 755 $OOZIE_DATA
# Directory to store the Oozie logs.
ENV OOZIE_LOG_DIR /var/log/oozie 
RUN mkdir -p $OOZIE_LOG_DIR
RUN chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_LOG_DIR
RUN chown -R 755 $OOZIE_LOG_DIR
# Directory to store the Oozie process ID.
ENV OOZIE_PID_DIR /var/run/oozie 
RUN mkdir -p $OOZIE_PID_DIR
RUN chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_PID_DIR
RUN chown -R 755 $OOZIE_PID_DIR
# Directory to store the Oozie temporary files.
ENV OOZIE_TMP_DIR /var/tmp/oozie 
RUN mkdir -p $OOZIE_TMP_DIR
RUN chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_TMP_DIR
RUN chown -R 755 $OOZIE_TMP_DIR
#
# Hadoop Service - Sqoop
#
ENV SQOOP_CONF_DIR /etc/sqoop/conf 
RUN mkdir -p $SQOOP_CONF_DIR
RUN chown -R $SQOOP_USER:$HADOOP_GROUP $SQOOP_CONF_DIR
RUN chown -R 755 $SQOOP_CONF_DIR
#
# Hadoop Service - Accumulo
#
ENV ACCUMULO_CONF_DIR /etc/accumulo/conf 
RUN mkdir -p  $ACCUMULO_CONF_DIR
RUN chown -R $ACCUMULO_USER:$HADOOP_GROUP $ACCUMULO_CONF_DIR
RUN chown -R 755 $ACCUMULO_CONF_DIR

ENV ACCUMULO_LOG_DIR /var/log/accumulo 
RUN mkdir -p $ACCUMULO_LOG_DIR
RUN chown -R $ACCUMULO_USER:$HADOOP_GROUP $ACCUMULO_LOG_DIR
RUN chown -R 755 $ACCUMULO_LOG_DIR

# Install & Config Postgres

