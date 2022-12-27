FROM tomcat:latest
ADD .target/* /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh, "run"]
