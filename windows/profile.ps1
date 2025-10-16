Function dev {Set-Location -Path C:\dev}
Function ll {ls}

Function dockerps { docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}" }

# Git related aliases
Function gs {git status $args}
Function ghide {git update-index --skip-worktree $args}
Function gunhide {git update-index --no-skip-worktree $args}
Function ghidden {git ls-files -v . | findstr "^S"}
Function gconflicted {
  $conflictingFiles = git status --porcelain;
  $gitDir = git rev-parse --show-toplevel;

  $result = "";
  foreach ($file in $conflictingFiles) {
    if ($file.StartsWith('UU', 'CurrentCultureIgnoreCase')) {
        $filePath = $gitDir + '/' + $file.Substring(3);
        Write-Host $filePath
        code $filePath
    }
  }
}
Function gmerged { git branch --merged | Select-String -Pattern "main|dev" -NotMatch }
Function g-delete-merged {
        $mergedBranches = git branch --merged | Select-String -Pattern "main|dev" -NotMatch
        foreach ($branch in $mergedBranches) {
                git branch -d $branch.ToString().TrimStart(' ')
        }
}


Function reboot {shutdown /r /t $args}

# Aliases to quickly access configuration files
Function bashcfg {code $env:USERPROFILE\.bashrc}
Function gitcfg {code $env:USERPROFILE\.gitconfig}
Function pscfg {code $PROFILE}

Function vs {& "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe" $args}

function grep {
  param (
      [string]$pattern,
      [string]$path = $null,
      [switch]$ignoreCase,
      [switch]$recursive,
      [switch]$wholeWord,
      [switch]$help
  )

  # Show help if no pattern is provided
  if (-not $pattern -or $help -or $pattern -eq "--help") {
      Write-Output @"
Usage: grep [options] "pattern" [file/directory]

Options:
--help         Show this help message
-ignoreCase    Perform case-insensitive search
-recursive     Search files in subdirectories
-wholeWord     Match whole words only

Examples:
grep "error" file.txt           # Search for "error" in file.txt
grep "timeout" -ignoreCase      # Case-insensitive search
grep "fail" C:\logs\*.log -recursive  # Recursive search in logs
grep --help                     # Show this help message
"@
      return
  }

  # If used after ls (Get-ChildItem), filter filenames instead of reading file contents
  if ($input) {
      $input | Where-Object { $_.Name -match $pattern }
      return
  }

  # Ensure path is valid if specified
  if ($path -and -not (Test-Path $path -PathType Leaf)) {
      Write-Host "Error: Please specify a valid file path." -ForegroundColor Red
      return
  }

  $params = @{
      Path    = $path
      Pattern = $pattern
  }

  if ($ignoreCase) { $params['CaseSensitive'] = $false }
  if ($recursive) { $params['Recurse'] = $true }
  if ($wholeWord) { $params['Pattern'] = "\b$pattern\b" }

  try {
      Select-String @params -ErrorAction Stop
  } catch {
      if ($_.Exception -match "Access to the path .* is denied") {
          Write-Host "Skipping protected folder: $($_.Exception.Message)" -ForegroundColor Yellow
      } else {
          Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
      }
  }
}


# Work related aliases
. "$HOME\Documents\WindowsPowerShell\WorkProfile.ps1"

# Github related aliases
Function ghpr {  gh pr list --author "@me" }

# Other

# Launch lf explorer and update current directory on exit
function lf {
    $temp = [System.IO.Path]::GetTempFileName()

    # Detect platform based on environment variable
    if ($env:OS -eq "Windows_NT") {
        # Default location for Windows portable lf
        $lfPath = Join-Path $env:LOCALAPPDATA "lf-windows-amd64\lf.exe"
    } else {
        # Use 'which' to locate lf on Linux/macOS
        $lfPath = (bash -c "command -v lf").Trim()
    }

    if (-not (Test-Path $lfPath)) {
        Write-Error "lf not found. Expected location:`n - $lfPath"
        return
    }

    # Run lf and record last directory
    & $lfPath -last-dir-path $temp

    if (Test-Path $temp) {
        $dir = Get-Content $temp
        if ($dir -and (Test-Path $dir)) {
            Set-Location $dir
        }
        Remove-Item $temp
    }
}



# Fix Rider's terminal.
# git log command doesn't work properly in Rider's terminal
if ($env:WT_SESSION -or $env:TERM_PROGRAM -eq "JetBrains") {
    $env:GIT_PAGER = "cat"
}