# Docker

### Docker powershel auto complete

https://github.com/matt9ucci/DockerCompletion  
`Install-Module DockerCompletion -Scope CurrentUser`  
`Import-Module DockerCompletion`  
`PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force` - Install Git Autocomplete  
`Add-PoshGitToProfile -AllHosts` - Add to terminal  

# Profile setup
`Test-Path $PROFILE` - test profile existence  
`New-Item -Path $PROFILE -ItemType File -Force` - create empty profile  

