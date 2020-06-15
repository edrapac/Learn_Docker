# Examining Entrypoints 

Building on what we worked with last time, lets take a look at a different dockerfile

```
FROM ubuntu
RUN apt-get update
RUN apt-get install htop
ENTRYPOINT ["htop"]
```

Particularly, the Entrypoint line
`ENTRYPOINT ["htop"]`

Last lesson we stated that the entrypoint are commands that are ran as the very final command before user input. Expanding on that - When docker images, (and later containers) are built from docker files, the commands in the dockerfile are ran from top to bottom. The very last command in a dockerfile should be an entrypoint cmd. This command actually executes in the container right before the the user commands execute, and you can see evidence of that if you enter the container. 

Run the following command in this folder

`docker build -t learn_docker` 

Once built, run 

`docker run -it learn_docker bash`

And observe how you now are dropped into the `htop` process that was started by the Entrypoint command <i>just</i> before your `bash` command was executed 
![htop](/images/htop_Learn_Docker_Exercise_3.png)