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

# Function to format path as MinGW would
function unixpath {

    param (
        [string] $Path = $PWD
    )
    $Path -replace '\\','/' -replace 'C:','/c'
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

# Function to start and ssh to sshd development container
function dockerssh {

    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $ContainerName,
        [Parameter(Mandatory=$true, Position=1)]
        [string] $ImageName,
        [Parameter(Mandatory=$true, Position=2)]
        [string] $HomeVolumeName,
        [int] $HostPort = 10648
    )

    # Get username from image naming convention: [username]-sshd
    $IsMatch = $ImageName -Match ".*/([a-zA-Z0-9\-]+)-sshd:.*"
    $UserName = $Matches[1]

    # Start the container
    docker run -d --rm `
        --name $ContainerName `
        -p "${HostPort}:10648" `
        --mount "type=volume,src=${HomeVolumeName},dst=/home/${UserName}" `
        $ImageName
    # Add key to the container
    addkey -ContainerName $ContainerName
    # Delete any matching localhost entries in known_hosts
    ssh-keygen -q -R [localhost]:${HostPort}
    # Connect to running container
    ssh -p $HostPort -o "StrictHostKeyChecking no" -A ${UserName}@localhost
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

if (Get-Command fnm -errorAction SilentlyContinue)
{
    fnm env --use-on-cd | Out-String | Invoke-Expression
}
