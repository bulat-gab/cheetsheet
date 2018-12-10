# cheetsheet

# docker 

`docker pull` - get container from Docker Hub
`docker ps` - list running containers  
`docker ps -a` - list all containers

`docker build --pull -t myapp .` - builds docker image named _myapp_ from DockerFile in the current directory
`docker run --name myapp_sample --rm -it -p 8000:80 myapp` - runs docker container from myapp image. 8000 - outer port, 80 port inside container.
`docker stop myapp_sample -t <seconds>` - Stops the specified container. Time - seconds to wait for stop before killing it
