$MsiPath = "googlechromestandaloneenterprise64.msi"
$LogName = "GoogleChromeInstall.log"
$LogPath = "C:\Service\Logs\$LogName"

# Create Log Folder
if (-not (Test-Path "C:\Service\Logs")) {
    New-Item -Path "C:\Service\Logs" -ItemType Directory -Force | Out-Null
}

# Install Chrome
msiexec /i "$MsiPath" /qn /l*a "$LogPath"

Start-Sleep -Seconds 20

# Cloud Management Enrollment Token Reg Value:
 
# Reg Path, Name, Value
$RegPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"

$Name = "CloudManagementEnrollmentToken"

$Value = "a49915fe-39c2-45b4-b19b-e682268e5825"

# Creates Reg Key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    }

# Creates Reg Value
Set-ItemProperty -Path $RegPath -Name $Name -Value $Value -Type String