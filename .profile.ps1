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

# Set up shell to use starship
if (Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (& starship init powershell)
}
