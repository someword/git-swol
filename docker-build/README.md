# Docker Build
Building docker images can be as simple or complex as you like or your use case dictates

Here we will go over the basics of `docker build`
## Background
While you should have the experience to build images using different patterns it's important to keep some of these thoughts in mind.
  * Do i need to build an image?  Often times you don't actually need to build an image.   For example the ever popular nginx image on dockerhub can be modified by just passing in the correct arguments when the container is launched.   You can enable ssl and mount in certs and a config file without actually changing the image itself.  Mount in the html you want to serve from the container.   You don't need a customized image for that.   So when you are building an image for reals keep in mind that it's like writing code.   You now need to maintain the image going forward and it's now another responsibility for you and your team.  If you do need to build an image because you need a slight modification to the original try to leverage the upstream as much as possible.
  * Size matters.  Using images that are based on alpine linux can keep your images small.   In the world of containers they are pushed/pulled all over the place so the difference between a 256MB image and 1GB one can be a few seconds of time shaved off or your build/deployment process.  Consider a situation where you have the need to use a python image.   If you go with python:latest you'll get a debian based image which is about 929MB in size.

  ```
  ❯ docker run -it python cat /etc/os-release |head -1
  PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
  ```

  If you go with the alpine version you'll get an image that is 90MB in size and is based on alpine linux.   Nothing in life is free so keep in mind while alpine linux is a great container OS you may hit some edge cases where something doesn't work on alpine because it uses the MUSL libc instead of gLibc.

  ```
  ❯ docker run -it python:alpine cat /etc/os-release |head -1
  NAME="Alpine Linux"
  ```

  Other things to consider wrt to image size is how you construct the image.  Installing packages correctly is where you can get the most image size savings.   It doesn't matter what package manager  you use you want all of the package goodness to happen in one layer.   This article gives a nice overview of how to do this correctly in alpine https://www.sandtable.com/reduce-docker-image-sizes-using-alpine/ but the idea is the same for rpm/deb based OS'es.
  * No secrets.   Don't put anything sensitive in your docker image.   Treat it like a git repo and if it accidentally gets leaked somewhere you will be ok.   Secrets should be passed in at run time.
  * Registries.   Many public docker registries exist and it's common to run or subscribe to a private registry for your organization.   Check out quay.io, https://cloud.google.com/container-registry/, https://aws.amazon.com/ecr/.
  * UID/GID.  When you are running containers in a CI/CD system and the CI/CD system runs as say the user jenkins.  If you run a container that creates files on the host filesystem those files will be owned by the UID that created them in the container.   If that is root then jenkins won't be able to cleanup those files.   Just something to be aware of
  * WHen using upstream images you should pin the version you use.   For example use alpine:3.1.8 instead of alpine:latest.  If you rely on latest then at some point it will break.   Then as part of your care and feeding you need to refresh the image version that your image is based off of.

## Topics
  * CMD & ENTRYPOINT - Here is a good write up on the difference between CMD & ENTRYPOINT http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/.  I typically create an script called /entrypoint.sh and have that executed as the ENTRYPOINT.  The entrypoint.sh script will usually get configured via environmental variables.  Checkout build002 dir for an example.
  * Self container binary.  If you are building a binary image then you don't really need a feature rich container.  You can use the scratch container which is empty and just copy your binary into the image.   Check out build003 for an example.
  * Multi stage builds.   This is done in build003 but check out https://docs.docker.com/develop/develop-images/multistage-build/ for more details.
  * Understand that the port you expose in the container does not have to be the same as the port exposed on the host running the container.   The container itself has it's own network stack and the host port will get mapped to the container port.
  * Docker images are just tarballs of tarballs like the old Solaris FLAR.  Unpack a multilayer image and unpack all the tar balls for each layer and poke around.   https://mikulskibartosz.name/what-is-inside-a-docker-image-81f68ea14181
  * Docker caching.  When you build a Docker image a cache is used and if the Dockerfile has not changed since the last build then the new build will not actually do any of the steps in the Dockerfile.   Sometimes you'll need to force a full build so you would build with `--no-cache`.




# References
https://docs.docker.com/engine/reference/builder/
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
