# Exercise 2: Disecting Dockerfiles

Until now, you've only seen docker commands being ran from the command line. But as the previous videos have shown, most (if not all) Docker development happens within Dockerfiles. The video does a pretty good job of explaining what a Dockerfile is so I'm not going to go into that. What we <i>will</i> do however, is take a close look at a relatively normal Dockerfile before creating one ourselves.

## Exhibit A: The file

The below is a full Dockerfile for an nginx container. What the container actually does is unimportant, because we are interested in the configurations for the time being.

Dockerfile 

```
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /usr/share/nginx/html/
ENTRYPOINT [“/usr/sbin/nginx”,”-g”,”daemon off;”]
```

Lets go through this line by line
L1: `FROM ubuntu` - This tell us we are pulling from a different docker repository, and to use `ubuntu` as the base image of this container. What this says is, "pull down an ubuntu image, this is the image we will then apply the following configs to "

L2: - `RUN apt-get update` - `RUN` is the command you use in a Dockerfile when you want to run a command inside the container <b>while</b> the container is being created. These commands run <b>before</b> any commands a user specifies from the command line. For example, if i use this Dockerfile to build an image called `myimage` and then I run `docker run -it myimage bash` the `RUN` command within the Dockerfile will run <b>before</b> the `bash` command I pass to the container. This is a good thing, as this specific `RUN` command updates the container's packages. `apt-get update` is ubuntu specific, and not particularly important to understand docker itself. 

L3: - `RUN` Same as above, this command however will install the nginx package

L4: - `COPY` - This command copies files from the <i>host</i> to the <i>container</i>. In this case, it is copying the file `index.html` from the current directory on the <i>host</i> to the `/usr/share/nginx/html/` on the container

L5: - `ENTRYPOINT` - More on these later. Right now, all you need to think of them as is commands that are the very final command that run before the user input.

Now for your assignment!

Create a Dockerfile that...
* Is the apache http server for base image (google it, will get you comfortable with Docker Hub)
* Runs an apt-get update 
* Copies the moveme.html file in this directory to the web dir in the apache server

Then when you have that working, build an image from that file (`docker build -t my_image_name .`) and drop into a bash shell to make sure it worked, you should find your file in the container!