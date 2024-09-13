FROM zhangpeihao/alpine-java6

ADD apache-tomcat-6.0.37.tar.gz /tmp/apache-tomcat-6.0.37

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.37/apache-tomcat-6.0.37 ./apache-tomcat-6.0.37 && \
    ln -s ./apache-tomcat-6.0.37 ./tomcat 

ENV CATALINA_HOME /usr/local/tomcat



CMD /usr/local/tomcat/bin/startup.sh && tail -F /logs/catalina.out


EXPOSE 80 8080

