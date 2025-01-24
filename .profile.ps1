# Function to format path as MinGW would
function unixpath {

    param (
        [string] $Path = $PWD
    )
    $Path -replace '\\','/' -replace 'C:','/c'
}

# Function for managing dotfiles
function dit {

    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]] $Passthrough
    )

    git -c status.showUntrackedFiles=no --git-dir $HOME\dotfiles\.git --work-tree $HOME @Passthrough
}

# Set up shell to use starship
if (Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (& starship init powershell)
}

# Set up shell to use fnm
if (Get-Command fnm -errorAction SilentlyContinue)
{
    fnm env --use-on-cd | Out-String | Invoke-Expression
}

# Set up completion for kubectl
if (Get-Command kubectl -errorAction SilentlyContinue)
{
    kubectl completion powershell | Out-String | Invoke-Expression
}

# Set up completion for cmctl
if (Get-Command cmctl -errorAction SilentlyContinue)
{
    cmctl completion powershell | Out-String | Invoke-Expression
}
