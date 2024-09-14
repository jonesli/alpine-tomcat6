FROM openjdk:7

ADD apache-tomcat-6.0.24.tar.gz /tmp/apache-tomcat-6.0.24

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.24/apache-tomcat-6.0.24 ./apache-tomcat-6.0.24 && \
    ln -s ./apache-tomcat-6.0.24 ./tomcat && \
    rm -rf /usr/local/tomcat/webapps/* && \
    ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY ROOT.war /usr/local/tomcat/webapps

ENV CATALINA_HOME /usr/local/tomcat

CMD /usr/local/tomcat/bin/startup.sh && tail -F /usr/local/tomcat/logs/catalina.out

EXPOSE 80 8080
