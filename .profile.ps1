# Function to start devcontainer
function devcontainer {

    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $SubCommand,
        [Parameter(Mandatory=$true, Position=1)]
        [string] $WorkspaceFolder,
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]] $Passthrough
    )

    docker run --rm -it `
        -v /var/run/docker.sock:/var/run/docker.sock `
        -v ${PWD}:${WorkspaceFolder} `
        devcontainer $SubCommand --workspace-folder $WorkspaceFolder @Passthrough
 }

# Function to format $PWD as MinGW would
function unixpwd {
    $PWD -replace '\\','/' -replace 'C:','/c'
}

# Function to authorize ed25519 public key in running named container
function addkey {

    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $ContainerName
    )

    $cmd = "umask 77 && mkdir -p ~/.ssh && cat - >> ~/.ssh/authorized_keys"
    cat ${HOME}\.ssh\id_ed25519.pub | Out-String | `
      docker exec -i $ContainerName bash -c $cmd
}

# Function for managing dotfiles
function dotfiles {

    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]] $Passthrough
    )

    git --git-dir ${HOME}\.dotfiles --work-tree $HOME @Passthrough
}

# Set up shell to use starship
if (Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (& starship init powershell)
}
