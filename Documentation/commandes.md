# Commands to Retrieve Local User & Group SIDs

This documentation lists essential PowerShell commands to **enumerate the Security Identifiers (SIDs)** of **local users** and **local groups** on a Windows machine.

These cmdlets require PowerShell 5.1+ or Windows 10+.
On older systems (or if the commands are unavailable), you can fall back to WMI

---

## Local User SID Enumeration

```powershell
Get-LocalUser | Select-Object Name, SID
```

## Local Group SID Enumeration

```powershell
Get-LocalGroup | Select-Object Name, SID
```

## Export Results to CSV
```powershell
Get-LocalUser | Select Name, SID | Export-Csv LocalUsers_SID.csv -NoTypeInformation
Get-LocalGroup | Select Name, SID | Export-Csv LocalGroups_SID.csv -NoTypeInformation
```

## Local User SID Enumeration && Local Group SID Enumeration (WMI)
```powershell
Get-WmiObject -Class Win32_UserAccount | Select Name, SID
Get-WmiObject -Class Win32_Group | Select Name, SID
```