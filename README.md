# On-prem-AD-App

# 1 Create OUs, Groups, Users

Run on DC1
Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name HRUsers -Path "DC=ntms,DC=local"
New-ADOrganizationalUnit -Name SecurityGroups -Path "DC=ntms,DC=local"

New-ADGroup -Name HR-Admins -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"
New-ADGroup -Name HR-Managers -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"
New-ADGroup -Name HR-Employees -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,DC=ntms,DC=local"

Import-Module ActiveDirectory

$baseOU = "cn=Users,DC=ntms,DC=local"

$users = @(
    @{Name="Alice Admin"; Sam="alice"; Group="HR-Admins"},
    @{Name="Bob Manager"; Sam="bob"; Group="HR-Managers"},
    @{Name="Charlie Employee"; Sam="charlie"; Group="HR-Employees"}
)

foreach ($u in $users) {

    # Create user if not exists
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($u.Sam)'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name $u.Name `
            -SamAccountName $u.Sam `
            -UserPrincipalName "$($u.Sam)@ntmscloud.in" `
            -AccountPassword (ConvertTo-SecureString "ntms123#" -AsPlainText -Force) `
            -Enabled $true `
            -Path $baseOU
    }

    # Fetch the user object explicitly
    $userObj = Get-ADUser -Identity $u.Sam

    if ($userObj) {
        Add-ADGroupMember `
            -Identity $u.Group `
            -Members $userObj.DistinguishedName
    }
    else {
        Write-Host "❌ User $($u.Sam) not found" -ForegroundColor Red
    }
}



# 2 Step 2 — Kerberos SPN Configuration (DC1)
 setspn -S HTTP/hrapp.ntms.local SERVER1
setspn -S HTTP/Server1 SERVER1
setspn -S HTTP/Server1.ntms.local SERVER1

# Step 3 — DNS / Hostname
hrapp - ip of server1
Ensure DNS resolves correctly.

# Step 4 — IIS Installation (Server1)
Install-WindowsFeature `
  Web-Server,
  Web-Windows-Auth,
  Web-Asp-Net45,
  NET-Framework-45-ASPNET `
  -IncludeManagementTools
iisreset

# Step 5 — IIS Site Configuration
Import-Module WebAdministration

New-WebSite -Name HRApp -Port 80 -PhysicalPath "C:\inetpub\HRApp"

Remove-WebBinding -Name HRApp -Port 80 -Protocol http
New-WebBinding -Name HRApp -Port 80 -HostHeader "hrapp.ntms.local"
<img width="1412" height="730" alt="image" src="https://github.com/user-attachments/assets/fd91c8f4-b154-4ce6-bf27-b3da4f41c875" />


# Step 6 — IIS Authentication Settings
HRapp - Authentication --- providers ---Negotiate
<img width="1438" height="726" alt="image" src="https://github.com/user-attachments/assets/28958c5d-34fc-4e7e-beaf-2bd79b9970e4" />

# Step 7 - Copy contents hrapp from this repo to c:\inetpub on server1. DC1 - domain controller , server1 - member server - Configured from AD repo.
<img width="1138" height="497" alt="image" src="https://github.com/user-attachments/assets/9b8ff46e-79d4-4ef4-9a39-a8a17c793857" />
