FROM java:8
MAINTAINER https://github.com/objectuser/run-java-jar
VOLUME /tmp
VOLUME /app
EXPOSE 8080
ENTRYPOINT ["sh","/app/app.sh"]
