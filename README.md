# Get-IPInfo
Quickly look up IP Information including location, ISP and Organization in PowerShell

PowerShell Gallery: https://www.powershellgallery.com/packages/Get-IPInfo/

# Usage
General
``` 
Import-Module Get-IPInfo
Get-IPInfo -ip <ip addr> -raw:<$true/$false>
```
Parameters and Flags
```
Mandatory 
-ip : Specify IP Address for Lookup

Optional
-raw : Flag to dump raw JSON instead of formatted output
```

# Installation
Automated Installation
```
Install-Module Get-IPInfo
```

Manual Installation
1. Download latest binaries from the Releases tab
2. Browse to C:\Program Files\WindowsPowershell\Modules
3. Paste the entire Get-IPInfo folder under Modules folder

If you have an older version installed, please delete the Get-IPInfo folder before proceeding.
