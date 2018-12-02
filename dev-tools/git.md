# Git

`git fetch origin --prune` - delete old origin branches  
`git clean -n` - show which untracked files will be deleted  
`git clean -f` - delete them  
`git clean -fd` - delete directories  
`git push origin dev:master` - push local dev branch to origin/master  
`git rebase --preserve-merges -i HEAD~5` - rebase and show merge commits  
`git rebase -i --root` - rebase onto first commit  
`git rm -r --cached .` - Ignore already commited files

## Delete merged branches from local store

`git branch --merged| egrep -v "(^\*|master|develop|dev)"` - shows merged branches, excluding _master, develop and dev_
`git branch --merged| egrep -v "(^\*|master|develop|dev)" | xargs git branch -d` - deletes

#### On Windows

`git branch --merged | grep -E -v "(master|develop|dev)"`  
`git branch --merged | grep -E -v "(master|develop|dev)" | xargs git branch -d`

### Undo rebase

`git reflog`  
Suppose the old commit was HEAD@{5} in the ref log:  
`git reset --hard HEAD@{5}` or `git reset --hard "HEAD@{5}"` under Windows

### Associate git repository with ssh key

In Git Bash:  
`` eval `ssh-agent -s`  ``  
`ssh-keygen -t ed25519 -C "ENTER_YOUR_EMAIL"`  
`ssh-add ~/.ssh/id_rsa`

## Add git config per folder

Add section at the end of the file `~/.gitconfig`:

```
[includeIf "gitdir:C:/dev/"]
    path = C:/Users/USERNAME/.gitconfig.personal
```

File `.gitconfig.personal`:

```
[user]
    name = MY_MANE
    email = MY_EMAIL
```
