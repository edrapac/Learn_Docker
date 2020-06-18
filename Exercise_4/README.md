# Networking

From here on in the lessons will get a bit more advanced so its important to understand everything as they are very important concepts. A reminder that all the material discussed can be found in the [Docker Documentation](https://docs.docker.com/)

Networking with docker will be broken up into 2 main categorys 

1. Container to Host communications, including how to expose ports
2. Container to Container communication and network definitions

So let's get started!

## Exposing ports and communicating with containers
Up to this point we have seen containers that aren't very long lived. That is, the containers we have experimented with were created, executed a short line of code or command, and then terminated. But what if I wanted to say, run a web server from a container? Is that possible? How do I do that?

The answer is, yes it's very possible and in some production environments, that's exactly how companies do it. At a high level, they create a Docker image with all the configurations as to how to run their web app and then use that container (often many redundant instances of it) to host their app. We will discuss later why that's useful but just be aware that Docker can and is frequently used for long-lived containers 

So that brings us to networking. When a container is created, any service that it runs that you might want to reach from the host must be published. Docker has a very convenient way of doing this, when using `docker run` it is in the form of the `-p` command

The `-p` command publishes ports from the container to the host, the syntax is like such
```
docker run -p port_on_host:port_on_container myimage
```

So, something like `docker run -p 8080:80 myimage` says, take the service that is running on the container on port 80, and make it accessible to the host on port 8080 of the <i>host</i>

Best we demo that, in this directory you will notice a Dockerfile. From this dir, run the following commands 

`docker build -t exercise4 .`

and then 

`docker run -dit -p 8080:80`

Then open up a browser such as Google Chrome and go to http://localhost:8080 

Do you see the web page?