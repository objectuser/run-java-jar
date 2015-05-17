FROM java:8
VOLUME /tmp
VOLUME /app
EXPOSE 8080
ENTRYPOINT ["sh","/app/app.sh"]