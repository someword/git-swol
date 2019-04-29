# Docker Run
Any current devops/sysadmin resume should list docker as something you are familiar with.   Not just because it's cool but because it's a pretty good solution to packaging/running software.

Here we will go over the basics of `docker run`
## Basics
  * input/output - Get familiar with the flags --interactive, --tty and --detach.   What if you don't supply any of these flags?   I find myself mostly using `--interactive --tty` when i am running interactive commands via a container. What happens to stderr and stdout from the container.    Do they get merged into one stream or can you operate on each stdout/stderr individually.
  * logs - Most of the containers are run in --detach mode without someone watching the messages from the containers.  How do you use `docker logs` to view the logs of a given container.
  * exec - In one window launch a container with `docker run` and in another window use `docker exec` to connect to that running container.   This would be similar to sshing into a host but instead of changing anything here you would most likely change the Dockerfile used to build the image the container used.
  * working directory - You can pass the `--workdir /some/path` flag to docker run.  Why would this be useful?
  * environmental variables - $Env vars are a popular mechanism to provide configuration options to your container.  Using this example `docker run -it alpine /bin/sh -c 'echo $USER'` what would you change so that when you echo $USER in the container it prints out a  value.  Try setting the $USER variable through using both the `--env` and `--env-file` command.  While this topic seems trivial it's pretty important to understand and be able to debug what the environment is in the running container.
  * volumes - passing in volumes to a container is pretty important.   On your workstation create a directory with some simple html in it and mount the html into the nginx container root html dir so that html is what get's served up.   I often use docker containers as cli tools and frequently mount in things like my ~/.aws directory into the container.   What happens if you specify a src volume that does not exist?
  * expose - Another important topic to know about is `--expose`.   Modify the following command `docker run -it nginx` so that port 8080 on your workstation points to the port nginx is listening on in the container.   Finding the git repo that has the Image Dockerfile and entrypoint scripts will help you determine what port the application is going to listen on.
  * entrypoint - If you have a container that is not behaving and you want to get into the container and then start the app you may need to override the entrypoint.   If the entrypoint on a iamge is set to `/entrypoint.sh` you can circumvent that by running `docker run --entrypoint=sh <imagenamme>`.  Then when you are in the container you can debug the /entrypoint.sh script further.

## Exercises

# References
https://www.udemy.com/docker-and-kubernetes-the-complete-guide/learn/v4/overview
