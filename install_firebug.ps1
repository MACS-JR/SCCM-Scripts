#Jeff Reichel - Mexico Academy & Central School - 07.11.2014

Param(
     [Parameter(Mandatory=$True)]
     [string[]]$action
	 )
	 
$addon_file = "firebug-2.0.1-fx.xpi"
$addon_id = "firebug@software.joehewitt.com"
$file_source = "\\macssccm01\repository$\Apps\FireFox_Add-on_Firebug"
$file_dest = "${env:ProgramFiles(x86)}\Mozilla Firefox\browser\extensions"
$reg_location = 'HKLM:\SOFTWARE\Wow6432Node\Mozilla\Firefox\Extensions'
$reg_path = $reg_location -split '\\'

If ($action -eq 'install') {
	if (-not (Test-Path ("$file_dest\$addon_file"))) {
		Copy-Item "$file_source\$addon_file" -Destination "$file_dest\"
	}
	if (-not (Test-Path ($reg_location))) {
		New-Item -Path ($reg_path[0..($reg_path.count - 2)] -join '\') -Name "Extensions"
	}
	if (-not (Get-Itemproperty -Path $reg_location -Name $addon_id)) {
		New-ItemProperty -Path $reg_location -Name $addon_id -PropertyType String -Value "$file_dest\$addon_file" -Force
	}
}
elseif ($action -eq 'uninstall') {
	if (Test-Path ("$file_dest\$addon_file")) {
		Remove-Item "$file_dest\$addon_file"
	}
	if (Get-Itemproperty -Path $reg_location -Name $addon_id) {
		Remove-ItemProperty -Path $reg_location -Name $addon_id
	}
}