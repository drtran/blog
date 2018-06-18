FROM java
MAINTAINER Kiet T. Tran

RUN useradd -ms /bin/bash tomcatuser
USER tomcatuser
WORKDIR /home/tomcatuser

RUN curl -o ./apache-tomcat-8.5.31.tar.gz http://apache.mirrors.lucidnetworks.net/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
RUN gzip -d apache-tomcat-8.5.31.tar.gz 
RUN tar xvf apache-tomcat-8.5.31.tar

COPY target/blog-0.0.1-SNAPSHOT.war ./apache-tomcat-8.5.31/webapps/blog.war

CMD ["./apache-tomcat-8.5.31/bin/catalina.sh", "run"]

EXPOSE 8080