# A function to create desktop shortcuts in the 'Default' user's Desktop folder.
function Create-DefaultShortcut 
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0,mandatory=$true)]
        [string] $ShortcutName,
        [Parameter(Position=1,mandatory=$true)]
        [string] $ShortcutTarget,
        [Parameter(Position=2,mandatory=$false)]
        [string] $ShortCutArugements
    )

    $DefaultDesktop = "$env:SystemDrive\Users\Default\Desktop"

    if (Test-Path $ShortcutTarget) 
    {
        $ShortcutFile = "$DefaultDesktop\$ShortcutName.lnk"
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        $Shortcut.TargetPath = $ShortcutTarget
        if ($ShortCutArugements) {$Shortcut.Arguments = $ShortCutArugements}
        $Shortcut.Save()
    }
}

# Create-DefaultShortcut -ShortcutName "" -ShortcutTarget "" -ShortCutArugements ""
