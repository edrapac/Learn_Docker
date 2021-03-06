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

Last lesson we stated that the entrypoint are commands that are ran as the very final command before user input. Expanding on that - When docker images, (and later containers) are built from docker files, the commands in the dockerfile are ran from top to bottom. The very last command in a dockerfile can be an entrypoint cmd. This command actually executes in the container right before the the user commands execute, and you can see evidence of that if you enter the container. 

## Demonstration 

Run the following command in this folder

`docker build -t learn_docker .` 

Once built, run 

`docker run -it learn_docker bash`

And observe how you now are dropped into the `htop` process that was started by the Entrypoint command <i>just</i> before your `bash` command was executed 
![htop](/images/htop_Learn_Docker_Exercise_3.png)

### Multiple commands or commands w/params? No problem!

You might notice about that the above command is a single line command with no parameters, so how would one pass params or different commands? Its easy

```
ENTRYPOINT ["command1","param1","param2"]
```
such as 
```
ENTRYPOINT ["htop","-t"]
```

Which is the cmd line equivalent of `htop -t`


Now for your assignment (should be a fun one):

Create a Dockerfile that...
* Is a ubuntu/debian based
* Runs an apt-get update 
* Installs nmap
* Runs nmap against an IP address or block of addresses as an Entrypoint command
