FROM tomcat:10-jdk17-temurin

LABEL maintainer="rohan <rohan.deshmukh.dev@gmail.com>"

EXPOSE 8080

COPY target/maven-web-app.war /usr/local/tomcat/webapps/maven-web-app.war
