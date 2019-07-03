FROM java:8-jre-alpine

LABEL maintainer "PREM RAVURI <prem.ravuri@philips.com>"

ENV JAVA_HOME "/usr/lib/jvm/java-1.8-openjdk/jre"

WORKDIR /

COPY supervisord.conf /etc/supervisord.conf

RUN \
    apk add --no-cache \
    supervisor \
    wget \
    bash && \
    wget -q http://archive.cloudera.com/cdh5/cdh/5/hbase-1.2.0-cdh5.12.1.tar.gz -P /opt && \
    tar xzf /opt/hbase-1.2.0-cdh5.12.1.tar.gz  -C /opt && \
    chown -R root: /opt/hbase-1.2.0-cdh5.12.1 && \
    rm -fr /opt/hbase-1.2.0-cdh5.12.1.tar.gz && \
    apk del wget
    
COPY hbase-site.xml /opt/hbase-1.2.0-cdh5.12.1/conf/hbase-site.xml

# Expose HBase ports
# 21081 – zookeeper port
# 60000 – master api port
# 60010 – master web port
# 60020 – regionserver api port
# 60030 – regionserver web port
EXPOSE 60000 60010 60020 60030

CMD bash /usr/bin/supervisord -c /etc/supervisord.conf
