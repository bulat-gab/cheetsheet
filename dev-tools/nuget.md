# NuGet

`nuget pack foo.nuspec`  
`nuget pack foo.csproj -Build -Symbols -Properties Configuration=Release;owners=janedoe,xiaop;version="1.0.5"`

Create a package from project foo.csproj, using MSBuild version 12 to build the project  
`nuget pack foo.csproj -Build -Symbols -MSBuildVersion 12 -Properties owners=janedoe,xiaop;version="1.0.5`

Create a package from project foo.nuspec and the corresponding symbol package using the new recommended format .snupkg  
`nuget pack foo.nuspec -Symbols -SymbolPackageFormat snupkg`

`nuget pack Package.nuspec -Version 1.0.0 -MinClientVersion 2.5 -exclude "*.exe" -exclude "*.bat"`
