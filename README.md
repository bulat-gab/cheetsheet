# cheetsheet

#### [MongoDb](./MongoDB.md)
#### [Linux](./linux.md)
#### [NodeJs](./node.md)
#### [Docker](./docker.md)

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
`git rm -r --cached .` - Ignore already commited files  

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
`ssh-keygen -t rsa -b 4096 -C "gabdrakhmanov.br@gmail.com"`  
`ssh-add ~/.ssh/id_rsa`  


## PowerShell
`rm C:\path\to\folder -r -fo` - `rm -rf` equivalent
