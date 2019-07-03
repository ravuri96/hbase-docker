#!/bin/sh

if [ ! -z $HBASE_ZOOKEEPER_QUORUM ] && [ ! -z $HBASE_ZOOKEEPER_QUORUM ];
then
echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" > /opt/hbase-1.2.0-cdh5.7.0/conf/hbase-site.xml
echo "<configuration>
    <property>
        <name>hbase.cluster.distributed</name>
        <value>true</value>
    </property>
    <property>
        <name>hbase.zookeeper.quorum</name>
        <value>$HBASE_ZOOKEEPER_QUORUM</value>
    </property>
    <property>
        <name>hbase.zookeeper.property.clientPort</name>
        <value>$HBASE_ZOOKEEPER_PROPERTY_CLIENTPORT</value>
    </property>
    <property>
        <name>hbase.rootdir</name>
        <value>file:///opt</value>
    </property>
    <property>
       <name>hbase.master.port</name>
       <value>60000</value>
    </property>
    <property>
       <name>hbase.master.info.port</name>
       <value>60010</value>
    </property>
    <property>
       <name>hbase.regionserver.port</name>
       <value>60020</value>
    </property>
    <property>
       <name>hbase.regionserver.info.port</name>
       <value>60030</value>
    </property>
     <property>
       <name>hbase.regionserver.info.port</name>
       <value>60030</value>
    </property>
    <property>
       <name>hbase.localcluster.port.ephemeral</name>
       <value>false</value>
    </property>
    <property>
       <name>hbase.regionserver.info.bindAddress</name>
       <value>0.0.0.0</value>
    </property>
    <property>
       <name>hbase.regionserver.info.port.auto</name>
       <value>false</value>
    </property>
    <property>
        <name>hbaseindexer.defaults.for.version.skip</name>
        <value>true</value>
    </property>
    <property>
        <name>hbaseindexer.zookeeper.znode.parent</name>
        <value>/ngdata/hbaseindexer</value>
        <description>Root ZNode for HBase Indexer in ZooKeeper.</description>
    </property>
    <property>
        <name>hbase.replication</name>
        <value>true</value>
    </property>
    <property>
        <name>hbase.mapreduce.bulkload.max.hfiles.perRegion.perFamily</name>
        <value>128</value>
    </property>
    <property>
        <name>hbase.fs.tmp.dir</name>
        <value>/tmp/hbase</value>
    </property>
</configuration>" >> /opt/hbase-1.2.0-cdh5.7.0/conf/hbase-site.xml
fi

/usr/bin/supervisord -c /etc/supervisord.conf
