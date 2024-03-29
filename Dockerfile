FROM alpine:latest

LABEL maintainer "PREM RAVURI <ravuripremchand@gmail.com>"

LABEL application Apache_Hbase

ENV JAVA_HOME "/usr/lib/jvm/java-1.8-openjdk/jre"

ENV APPLICATION_HOME /

ENV CONFIG_FILE_PATH /opt/hbase-1.2.0-cdh5.12.1/conf/hbase-site.xml

ENV CONFIG_FILE_TEMPLATE_PATH /hbase-site.xml.template

WORKDIR ${APPLICATION_HOME}

# Expose HBase ports
# 21081 – zookeeper port
# 60000 – master api port
# 60010 – master web port
# 60020 – regionserver api port
# 60030 – regionserver web port

EXPOSE 60000 60010 60020 60030

COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /
RUN set -x && \
    apk add --no-cache supervisor openjdk8 wget bash&& \
    apk add --update libintl && \
    apk add --virtual build_deps gettext &&  \
    wget -q http://archive.cloudera.com/cdh5/cdh/5/hbase-1.2.0-cdh5.12.1.tar.gz -P /opt && \
    tar xzf /opt/hbase-1.2.0-cdh5.12.1.tar.gz  -C /opt && \
    chown -R root: /opt/hbase-1.2.0-cdh5.12.1 && \
    rm -fr /opt/hbase-1.2.0-cdh5.12.1.tar.gz && \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    chmod 777 /entrypoint.sh && \
    apk del wget build_deps wget

COPY hbase-site.xml.template $CONFIG_FILE_TEMPLATE_PATH


ENTRYPOINT ["/entrypoint.sh"]
