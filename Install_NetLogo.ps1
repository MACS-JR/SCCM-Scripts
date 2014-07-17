#Jeff Reichel - Mexico Academy & Central School - 07.16.2014

Start-Process -FilePath "NetLogo5.0.5Installer.exe" -ArgumentList " -q" -WindowStyle hidden -PassThru -Wait

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$_${Env:ProgramData}\Microsoft\Windows\Start Menu\Programs\NetLogo 5.0.5.lnk")
$Shortcut.TargetPath = "$_${Env:ProgramFiles(x86)}\NetLogo 5.0.5\NetLogo 5.0.5.exe"
$Shortcut.Arguments = ""
$Shortcut.IconLocation = "$_${Env:ProgramFiles(x86)}\NetLogo 5.0.5\NetLogo 5.0.5.exe"
$Shortcut.Description ="NetLogo 5.0.5"
$Shortcut.WorkingDirectory ="H:"
$Shortcut.Save()

$Shortcut = $WshShell.CreateShortcut("$_${Env:SYSTEMDRIVE}\Users\Public\Desktop\NetLogo 5.0.5.lnk")
$Shortcut.TargetPath = "$_${Env:ProgramFiles(x86)}\NetLogo 5.0.5\NetLogo 5.0.5.exe"
$Shortcut.Arguments = ""
$Shortcut.IconLocation = "$_${Env:ProgramFiles(x86)}\NetLogo 5.0.5\NetLogo 5.0.5.exe"
$Shortcut.Description ="NetLogo 5.0.5"
$Shortcut.WorkingDirectory ="H:"
$Shortcut.Save()

