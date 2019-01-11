# cheetsheet

## docker 

`docker pull` - get container from Docker Hub
`docker ps` - list running containers  
`docker ps -a` - list all containers

`docker build --pull -t myapp .` - builds docker image named _myapp_ from DockerFile in the current directory  
`docker run --name myapp_sample --rm -it -p 8000:80 myapp` - runs docker container from myapp image. 8000 - outer port, 80 port inside container.  
`docker stop myapp_sample -t <seconds>` - Stops the specified container. Time - seconds to wait for stop before killing it  
docker ps – list all containers  
docker stop $(docker ps -a -q) – stop all containers  
docker rm $(docker ps -a -q) – remove all containers  
docker images - list all docker images  
docker rmi <image_id> – remove a docker image  

## NuGet
`nuget pack`  
`nuget pack foo.nuspec`  
`nuget pack foo.csproj`  
`nuget pack foo.csproj -Properties Configuration=Release`  
`nuget pack foo.csproj -Build -Symbols -Properties owners=janedoe,xiaop;version="1.0.5"`  

Create a package from project foo.csproj, using MSBuild version 12 to build the project  
`nuget pack foo.csproj -Build -Symbols -MSBuildVersion 12 -Properties owners=janedoe,xiaop;version="1.0.5`  

Create a package from project foo.nuspec and the corresponding symbol package using the new recommended format .snupkg  
`nuget pack foo.nuspec -Symbols -SymbolPackageFormat snupkg`  

`nuget pack foo.nuspec -Version 2.1.0`  
`nuget pack foo.nuspec -Version 1.0.0 -MinClientVersion 2.5`  
`nuget pack Package.nuspec -exclude "*.exe" -exclude "*.bat"`  
