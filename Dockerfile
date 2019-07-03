FROM java:8-jre-alpine

LABEL maintainer "PREM RAVURI <prem.ravuri@philips.com>"

ENV JAVA_HOME "/usr/lib/jvm/java-1.8-openjdk/jre"

WORKDIR /

COPY entrypoint.sh /

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

# Expose HBase ports
# 21081 – zookeeper port
# 60000 – master api port
# 60010 – master web port
# 60020 – regionserver api port
# 60030 – regionserver web port
EXPOSE 60000 60010 60020 60030

ENTRYPOINT ["/entrypoint.sh"]
