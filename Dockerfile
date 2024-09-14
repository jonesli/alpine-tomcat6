FROM zhangpeihao/alpine-java6

ADD apache-tomcat-6.0.24.tar.gz /tmp/apache-tomcat-6.0.24

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.24/apache-tomcat-6.0.24 ./apache-tomcat-6.0.24 && \
    ln -s ./apache-tomcat-6.0.24 ./tomcat 

ENV CATALINA_HOME /usr/local/tomcat

CMD /usr/local/tomcat/bin/startup.sh && tail -F /logs/catalina.out

EXPOSE 80 8080
