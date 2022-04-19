To test your Docker installation, run:
  docker run hello-world
Docker commands
Here are some of the commands you will use most often with Docker.
Running a docker container
docker run is the most important command. Here are basic use cases and options.
•	docker run [image] creates container from the specified image and runs it.
•	docker run -d [image] detaches the container, i.e. puts it in background when it is launched.
Monitoring running containers
•	docker ps shows running containers. Each container can be referred to by name or ID
•	docker logs shows the output of docker containers
•	docker stats shows the resource utilization (CPU, memory, etc...) of running containers
Working with running containers
•	docker stop stops a running container. For example, docker stop 8a6f2b255457 where 8a6f2b255457 is the container id you got from running docker ps
•	ctrl+p+q allows you to get out of container without exiting it
•	docker exec -it [id] bash opens an interactive bash shell (if it exists in the container) on a running container
•	docker commit [id] -m "message about commit..." creates an image from a running container. You can then move this image to another docker host to run it somewhere else, use it as a checkpoint on a long analysis if you think you might want to go back to this point, or share the image with others.



Getting data in and out of docker containers
A Docker container has its own file system. Be default, it cannot read or write to host files or access hos services (like databases). There are a few ways to get data in and out of a container.
•	To mount host files within the Docker container so that they can be modified and read, run the container with docker run -v.
•	To open ports on the Docker container for incoming web, database, and other access, run the container with docker run -p. This allows you, for example, to serve web sites from the container.
•	Use the docker cp command on the host to get files in and out of the container. First run docker ps to get its Container ID, then run e.g. docker cp a14d91a64fea:/root/tmp Downloads/ to copy the /root/tmp directory from the container to the Downloads/ directory of the host.
•	From within the container, use standard network protocols and tools such as git, wget, and sft to move files in and out of the container.
Managing images and containers
As you use docker more you may need to clean things up once and a while to optimize resource utilization.
•	docker ps -a shows all containers, including those that are running and those that are stopped. Stopped containers aren't using CPU or memory, but they do use diskspace. You can use docker cp to get files in and out of them. This is useful if you remember something you needed after you stopped a container. It is a pain if you have a bunch of stopped containers that, like zombies, chew up your disk space.
•	docker rm allows you to remove a container. This completely wipes it from your system.
•	docker images shows all the docker images on your system.
•	docker rmi allows you to remove images on your system. This can be useful for reclaiming disk space.

