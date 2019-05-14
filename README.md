# cheetsheet

#### [MongoDb](./MongoDB.md)
#### [Linux](./linux.md)

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

## NuGet
`nuget pack foo.nuspec`   
`nuget pack foo.csproj -Build -Symbols -Properties Configuration=Release;owners=janedoe,xiaop;version="1.0.5"`  

Create a package from project foo.csproj, using MSBuild version 12 to build the project  
`nuget pack foo.csproj -Build -Symbols -MSBuildVersion 12 -Properties owners=janedoe,xiaop;version="1.0.5`  

Create a package from project foo.nuspec and the corresponding symbol package using the new recommended format .snupkg  
`nuget pack foo.nuspec -Symbols -SymbolPackageFormat snupkg`  

`nuget pack Package.nuspec -Version 1.0.0 -MinClientVersion 2.5 -exclude "*.exe" -exclude "*.bat"`  


## Git
`git fetch origin --prune` - delete old origin branches  
`git clean -n` - show which untracked files will be deleted  
`git clean -f` - delete them  
`git clean -fd` - delete directories  
`git push origin dev:master` - push local dev branch to origin/master  
`git rebase --preserve-merges -i HEAD~5` - rebase and show merge commits  
`git rebase -i --root` - rebase onto first commit  

### Delete merged branches from local store
`git branch --merged| egrep -v "(^\*|master|develop|dev)"` - shows merged branches, excluding _master, develop and dev_
`git branch --merged| egrep -v "(^\*|master|develop|dev)" | xargs git branch -d` - deletes   

#### On Windows
`git branch --merged | grep -E -v "(master|develop|dev)"`  
`git branch --merged | grep -E -v "(master|develop|dev)" | xargs git branch -d`

### Undo rebase
`git reflog`  
Suppose the old commit was HEAD@{5} in the ref log:  
`git reset --hard HEAD@{5}`  or `git reset --hard "HEAD@{5}"` under Windows  

### Associate git repository with ssh key
In Git Bash:  
```eval `ssh-agent -s` ```   
`ssh-keygen -t rsa -b 4096 -C "email@email.com"`  
`ssh-add ~/.ssh/id_rsa`  
