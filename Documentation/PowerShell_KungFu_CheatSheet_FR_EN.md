# 🥷 PowerShell Kung-Fu – Cheat Sheet (FR & EN)

Fiche mémo complète des commandes PowerShell pour l’administration, la cybersécurité, et la réponse à incident. Version bilingue 🇫🇷/🇬🇧.

---

## 🇫🇷 Version Française

### Fichiers & Dossiers
```powershell
Get-ChildItem -Path . -Recurse
New-Item -Path "apples" -ItemType Directory
Get-Content -Path fichier.txt
Set-Content -Path fichier.txt -Value "Texte"
Copy-Item -Path source.txt -Destination C:\Backup\
Remove-Item -Path fichier.txt
```

### Utilisateurs & Groupes
```powershell
Get-LocalUser
Get-LocalGroup
Get-LocalGroupMember -Group "Administrators"
New-LocalUser -Name "bob" -Password (Read-Host -AsSecureString)
```

### Services & Processus
```powershell
Get-Service
Start-Service -Name WinDefend
Stop-Service -Name Spooler
Get-Process
Stop-Process -Name notepad
```

### Réseau
```powershell
Get-NetIPConfiguration
Test-Connection google.com
Resolve-DnsName example.com
Get-NetTCPConnection
```

### Journaux d’événements (logs)
```powershell
Get-EventLog -LogName System -Newest 20
Get-WinEvent -LogName Security -MaxEvents 10
Get-WinEvent -ListLog * | Where-Object {$_.IsEnabled}
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} | Format-List
```

### Active Directory (nécessite RSAT)
```powershell
Get-ADUser -Filter *
Get-ADUser -Filter {GivenName -eq "Robert"} -Properties Surname
```

### Gestion à distance
```powershell
Enable-PSRemoting -Force
Invoke-Command -ComputerName PC01 -ScriptBlock { Get-Service }
Enter-PSSession -ComputerName PC01
```

### Registre Windows
```powershell
Get-Item -Path "HKCU:\Software"
New-Item -Path "HKCU:\Software\MonApp" -Force
New-ItemProperty -Path "HKCU:\Software\MonApp" -Name "Mode" -Value "Dark" -PropertyType String
```

### Exploration d’objets
```powershell
"texte" | Get-Member
(Get-Process)[0].Path
```

### Modules & Packages
```powershell
Get-Module
Get-Module -ListAvailable
Install-Module -Name PSReadLine
```

### Outils divers
```powershell
Get-Command
Get-Help Get-Process -Full
Clear-Host
Start-Sleep -Seconds 5
```

---

## 🇬🇧 English Version

### Files & Directories
```powershell
Get-ChildItem -Path . -Recurse
New-Item -Path "apples" -ItemType Directory
Get-Content -Path file.txt
Set-Content -Path file.txt -Value "Text"
Copy-Item -Path source.txt -Destination C:\Backup\
Remove-Item -Path file.txt
```

### Local Users & Groups
```powershell
Get-LocalUser
Get-LocalGroup
Get-LocalGroupMember -Group "Administrators"
New-LocalUser -Name "bob" -Password (Read-Host -AsSecureString)
```

### Services & Processes
```powershell
Get-Service
Start-Service -Name WinDefend
Stop-Service -Name Spooler
Get-Process
Stop-Process -Name notepad
```

### Networking
```powershell
Get-NetIPConfiguration
Test-Connection google.com
Resolve-DnsName example.com
Get-NetTCPConnection
```

### Event Logs
```powershell
Get-EventLog -LogName System -Newest 20
Get-WinEvent -LogName Security -MaxEvents 10
Get-WinEvent -ListLog * | Where-Object {$_.IsEnabled}
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} | Format-List
```

### Active Directory (requires RSAT)
```powershell
Get-ADUser -Filter *
Get-ADUser -Filter {GivenName -eq "Robert"} -Properties Surname
```

### Remote Management
```powershell
Enable-PSRemoting -Force
Invoke-Command -ComputerName PC01 -ScriptBlock { Get-Service }
Enter-PSSession -ComputerName PC01
```

### Registry
```powershell
Get-Item -Path "HKCU:\Software"
New-Item -Path "HKCU:\Software\MyApp" -Force
New-ItemProperty -Path "HKCU:\Software\MyApp" -Name "Mode" -Value "Dark" -PropertyType String
```

### Object Exploration
```powershell
"hello" | Get-Member
(Get-Process)[0].Path
```

### Modules & Packages
```powershell
Get-Module
Get-Module -ListAvailable
Install-Module -Name PSReadLine
```

### Miscellaneous Tools
```powershell
Get-Command
Get-Help Get-Process -Full
Clear-Host
Start-Sleep -Seconds 5
```

---

PowerShell Kung-Fu!