FROM centos
MAINTAINER santhosh@gmail.com
RUN yum update -y
RUN yum install java -y
RUN java -version
RUN yum install git -y
RUN yum install maven -y
RUN git --version
RUN mvn --version
RUN yum install wget -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN curl -O "http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz"
RUN tar -xzvf apache-tomcat-8.5.45.tar.gz
RUN mv apache-tomcat-8.5.45/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY /home/centos/DOCKERPRACTICE/App-1.0.2.jar /opt/tomcat/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/bin/startup.sh", "run"]
