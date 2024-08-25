## docker 
[DockerFile example](./DockerFile)

`docker pull name:version` - get container from Docker Hub  
`docker ps` - list only running containers  
`docker ps -a` - list all containers

`docker exec -it cont_name bash` - enter bash shell inside a container   
`docker build --rm --pull -t <image name> .` - builds docker image from DockerFile in the current directory; removes intermediary created images.    
`docker run --name <container name> --rm -it -p 8000:80 <image name>` - runs docker container from image. 8000 - outer port, 80 port inside container; cleans up container's file system after exit    
`docker exec -it <container name> bash` - connects to a running container  
`docker ps` – list all containers  
`docker stop <container name> -t <seconds>` - Stops the specified container. Time - seconds to wait for stop before killing it  
`docker stop $(docker ps -a -q)` – stop all containers  
`docker rm $(docker ps -a -q)` – remove all containers  
`docker images` - list all docker images  
`docker rmi <image_id>` – remove a docker image  
`docker system prune` - clean up any resources — images, containers, volumes, and networks — that are dangling (not associated with a container)  
`docker system prune -a` -  additionally remove any stopped containers and all unused images  
