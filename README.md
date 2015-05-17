# run-java-jar
A Docker image for running shell script that might refer to a Java JAR file or anything else.

I use this for deploying a Spring Boot application to AWS Elastic Beanstalk.

The image runs a shell script: `/app/app.sh`. For my own purposes, I put my Spring Boot JAR file, called `app.jar` in the same location.

I then run the app with Docker:
```
docker run -it --rm -p 8080:8080 -v /my/file/location:/app objectuser/run-java-jar
```

The `/my/file/location` directory contains both `app.sh` and `app.jar`.

Using this on AWS EB, I deploy something like the following `Dockerrun.aws.json` file:

```
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "objectuser/run-java-jar",
    "Update": "false"
  },
  "Ports": [
    {
      "ContainerPort": "8080"
    }
  ],
  "Volumes": [
    {
      "HostDirectory": "/var/app/current",
      "ContainerDirectory": "/app"
    }
  ],
  "Logging": "/var/log"
}
```
You may want to use "Update": "true" in the file above if you want to ensure you have the latest version of this image.
