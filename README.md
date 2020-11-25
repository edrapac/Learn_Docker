# Learn_Docker
Docker 101

### This repo will hopfully provide all the resources for someone with little/no docker experience to learn docker

## Getting Started

There plenty of great educators out on the magical site of YouTube, some far better than I. Take a moment to watch the following videos before proceeding any further

What is docker? A video that introduces you to docker, some basic command syntax, as well as how to install it on Linux or Mac. 
* https://www.youtube.com/watch?v=JprTjTViaEA

Using windows? No worries!

First make sure to enable and install WSL2...
* https://docs.microsoft.com/en-us/windows/wsl/install-win10

Then follow this guide to installing Docker desktop with WSL2 backend!
* https://docs.docker.com/docker-for-windows/wsl/

## Hello world, my name is Docker

So now that you're familiarized with some basic docker commands, it's time to play around with some exercises. The majority of the exercises in this repo will be in separate folders however the introductory exercise can be done right here from the README

## Table of contents 
* Exercise 1 (see below!)
* Exercise 2: [Disecting Dockerfiles](/Exercise_2/)
* Exercise 3: [Examining Entrypoints](/Exercise_3/)
* Exercise 4: [Networking](/Exercise_4/)
* Exercise 5: [Advanced Entrypoints, File Configs](/Exercise_5/)
### Exercise 1: Ubuntu Playground
<i>Note: Not all of the exercises will have a task to complete with a click to reveal answer section</i>

1. Pull the latest Ubuntu image

<details>
  <summary>Click to reveal command</summary>
  
`docker pull ubuntu:latest`
</details>

2. Using that image, create a container and drop into a bash shell prompt

<details>
  <summary>Click to reveal command</summary>
  
`docker run -it ubuntu bash`
</details>

3. Exit that shell (`exit` - everyone gets a free command) and now daemonize a docker ubuntu container. You don't have to run a command with it if you dont want. Give it a name to make the next step easier.

<details>
  <summary>Click to reveal command</summary>
  
`docker run -it -d --name container_name ubuntu`
</details>

4. Find the daemonized container, then connect to it and have it echo the current user

<details>
  <summary>Click to reveal command</summary>
  
  This is a 2 part process

  Find the container:
  * `docker ps`

  Connect to it and echo the user:
  * ` docker exec -it container_name whoami`
</details>

5. Find the Container's IP

<details>
  <summary>Click to reveal command</summary>
  
`docker inspect container_name | grep -i ipaddress`
Bonus if you used grep :smile:
</details>

6. Attach to the daemonized container

<details>
  <summary>Click to reveal command</summary>
  
`docker attach container_name`
</details>

7. Create a new container, mount this repo inside it, call that directory Learn_Docker. (Hint: do this from a `docker run` command, end the command with bash so that when the container is brought up you end up in a shell and can verify the dir is there. Stuck? If you are on Linux or Mac mount `$(pwd)` inside the container. If you're on windows checkout [this guide](https://medium.com/@kale.miller96/how-to-mount-your-current-working-directory-to-your-docker-container-in-windows-74e47fa104d7))

<details>
  <summary>Click to reveal command</summary>

Alright I'll admit this might be a tough one

On Mac or Linux run the following
`docker run -it -v $(pwd):/Learn_docker ubuntu bash`

The idea here is that $(pwd) is the absolute path to the current working directory, held in a temporary variable

On windows (ugh) 
`docker run -it -v //c/path/to/this/folder:/Learn_docker ubuntu bash`

What the heck? Well, you need to convert your windows file path to linux-y file path, and the way of doing that is starting the path with double slashes `//` then the `c` drive or whatever drive you have. Honestly, run `$(pwd)` in gitbash from this folder then just add an extra `/`. You <b>did</b> install gitbash like I told you to right? :wink: 
</details>

8. Cleanup!

List all your containers you created in the process of this exercise and remove them 

<details>
  <summary>Click to reveal command</summary>
  
`docker ps -a`

`docker rm containerid` 
</details>

This concludes exercise 1! Please use the folders for the rest of the exercises!