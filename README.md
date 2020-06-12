# Learn_Docker
Docker 101

### This repo will hopfully provide all the resources for someone with little/no docker experience to learn docker

## Getting Started

There plenty of great educators out on the magical site of YouTube, some far better than I. Take a moment to watch the following videos before proceeding any further

What is docker? A video that introduces you to docker, some basic command syntax, as well as how to install it on Linux or Mac. Using windows? No worries!
* https://www.youtube.com/watch?v=JprTjTViaEA

Installing Docker Desktop on Windows 10
* https://www.youtube.com/watch?v=_9AWYlt86B8

## Hello world, my name is Docker

So now that you're familiarized with some basic docker commands, it's time to play around with some exercises. The majority of the exercises in this repo will be in separate folders however the introductory exercise can be done right here from the README

### Exercise 1: Ubuntu Playground
<i>Note: all the exercises will have a task to complete, and then a click to reveal answer section</i>

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