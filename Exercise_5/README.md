# Advanced Entrypoints, File Configs

Lets go back to to the topics we looked in Exercise 3. Namely, Entrypoints and Commands to set the state of the container. We know that the Entrypoint command in the Dockerfile can specify commands to be ran before user input, but typing out all the commands into that single line can be cumbersome, and prone to error. 

In this lesson, we are going to look at how you can write a bash script that the container will run from its Entrypoint specification.

## The goal

The goal of this container will be pretty simple, we want to create an Ubuntu container with the user Fred, then add the root user to Fred's user group. All of this will be done from a short script instead of commands we feed to the Entrypoint command. Additionally, once the script has ran to completion, we want it to then run any extra user input that is supplied at runtime.

## A short Bash lesson
Up to this point we've seen some bash but its best to formally review the commands and methods we will be using in the lesson. In order to accomplish our above goal we will be using the following commands

* `useradd` - adds a user to the operating system and specifies configs for that user such as home directory and default shell

* `groupadd` - creates a new user group 

* `groupmod` - modifies a user group, frequently used for adding users to a group 

## Responsible scripting
Another thing worth mentioning that is somewhat unique to bash is it's error handling - when bash encounters an error in a multi line script, it does not halt by default, nor does it provide useful error messages. By default, bash will continue on to the next line and often not even report the error. This can can range from mildly annoying side effects to <i>extremely</i> destructive behavior depending on what you are doing. That is why we will prepend our bash script (and you should do the same for all bash scripts) with the following command:

`set -eou pipefail` 

What does that do?

* `pipefail` - From gnu manual:
	> If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully
* `-e` exits the script immediately on error
* `-o` used for pipes, causes a pipe to fail immediately if any of the commands in the pipe don't exit successfully. A pipeline is something like `cat myfile | uniq | wc -l` and the `-o` option would ensure that if either the `cat`,`uniq`, or `wc` commands failed the pipe would immediately be exited
* `-u` treat unset variables as an error and exit immediately. If you do something like `cat $a` without having set the value of `$a` the script will immediately exit. 