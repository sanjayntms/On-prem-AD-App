# 1 Create OUs, Groups, Users

Run on DC1
Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name HRUsers -Path "DC=ntms,DC=local"
New-ADOrganizationalUnit -Name SecurityGroups -Path "DC=ntms,DC=local"

New-ADGroup -Name HR-Admins -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"
New-ADGroup -Name HR-Managers -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"
New-ADGroup -Name HR-Employees -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"

# 2 Step 2 — Kerberos SPN Configuration (DC1)
 setspn -S HTTP/hrapp.ntms.local SERVER1
setspn -S HTTP/Server1 SERVER1
setspn -S HTTP/Server1.ntms.local SERVER1

Step 3 — DNS / Hostname
hrapp - ip of server1
Ensure DNS resolves correctly.

Step 4 — IIS Installation (Server1)
Install-WindowsFeature `
  Web-Server,
  Web-Windows-Auth,
  Web-Asp-Net45,
  NET-Framework-45-ASPNET `
  -IncludeManagementTools
iisreset

Step 5 — IIS Site Configuration
Import-Module WebAdministration

New-WebSite -Name HRApp -Port 80 -PhysicalPath "C:\inetpub\HRApp"

Remove-WebBinding -Name HRApp -Port 80 -Protocol http
New-WebBinding -Name HRApp -Port 80 -HostHeader "hrapp.ntms.local"

Step 6 — IIS Authentication Settings
HRapp - Authentication --- providers ---Negotiate
Step 7 - Copy contents hrapp from this repo to c:\inetpub on server1. DC1 - domain controller , server1 - member server - Configured from AD repo.

