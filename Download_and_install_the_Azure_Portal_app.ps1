<#
.SYNOPSIS
 
A script used to download and install the Microsoft Azure Portal app.
 
.DESCRIPTION
 
A script used to download the Azure Portal app on a Windows Server 2016/2019 or Windows 10. The exe file will be downloaded
in the Azure Portal app folder under the Temp folder. After installation the Azure Portal app folder and the .exe file will 
be deleted. Three seconds after the completion of the script the Windows Terminal (or PowerShell) window will be closed.
 
.NOTES
 
Filename:       Download_and_install_the_Azure_Portal_app.ps1
Created:        02/01/2020
Last modified:  02/01/2020
OS:             Windows Server 2016/2019 or Windows 10        
PowerShell:     5.1
Version:        1.0
Author:         Wim Matthyssen
Twitter:        @wmatthyssen
Action:         Change variables were needed to fit your needs
Disclaimer:     This script is provided "As IS" with no warranties.
 
.EXAMPLE
 
.\Download_and_install_the_Azure_Portal_app.ps1
 
.LINK
 
https://tinyurl.com/td9423z
#>
 
## Variables

$scriptName = "Download_and_install_the_Azure_Portal_app"
$tempFolderName = "Temp"
$tempFolder = "C:\" + $tempFolderName
$itemType = "Directory"
$azurePortalAppFolderName = "Azure Portal app"
$tempAzurePortalAppFolder = $tempFolder + "\" + $azurePortalAppFolderName
$azurePortalAppUrl = "https://portal.azure.com/app/Download?acceptLicense=true"
$azurePortalAppExe = "AzurePortalInstaller.exe"
$azurePortalAppPath = $tempAzurePortalAppFolder + "\" + $azurePortalAppExe
$writeEmptyLine = "`n"
$writeSeperator = " - "
$writeSpace = " "
$time = Get-Date -UFormat "%A %m/%d/%Y %R"
$foregroundColor1 = "Red"
$foregroundColor2 = "Yellow"
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
 
## Start script execution

Write-Host ($writeEmptyLine + "#" + $writeSpace + $scriptName + $writeSpace + "script started" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor1 $writeEmptyLine 
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
 
## Create C:\Temp folder if not exists
 
If(!(test-path $tempFolder))
{
New-Item -ItemType $itemType -Force -Path $tempFolder | Out-Null
}
 
Write-Host ($writeEmptyLine + "#" + $writeSpace + $tempFolderName + $writeSpace + "folder available" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor2 $writeEmptyLine
 
##----------------------------------------------------------------------------------------------------------------------------------------------------
 
## Create Azure Portal app folder in C:\Temp if not exists
 
If(!(test-path $tempAzurePortalAppFolder))
{
New-Item -Path $tempFolder -Name $azurePortalAppFolderName -ItemType $itemType | Out-Null
}
  
Write-Host ($writeEmptyLine + "#" + $writeSpace + $azurePortalAppFolderName + $writeSpace + "folder available in"`
+ $writeSpace + $tempFolderName + $writeSpace + "folder" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor2 $writeEmptyLine
 
##----------------------------------------------------------------------------------------------------------------------------------------------------
 
## Download the Azure Portal app to Temp folder
 
(New-Object System.Net.WebClient).DownloadFile($azurePortalAppUrl, $azurePortalAppPath)
 
Write-Host ($writeEmptyLine + "#" + $writeSpace + $azurePortalAppExe + $writeSpace +  "available" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor2 $writeEmptyLine
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
 
## Install the Azure Portal app
 
& $azurePortalAppPath
 
Write-Host ($writeEmptyLine + "# The" + $writeSpace + $AzurePortalAppFolderName + $writeSpace`
+ "is installed, you can now logon with your credentials" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor2 $writeEmptyLine
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
 
## Remove AzurePortalInstaller.exe file and Azure Portal app folder from Temp folder after installation
 
Start-Sleep 2
Get-ChildItem -Path $tempAzurePortalAppFolder -Force -Recurse  | Remove-Item -Force -Recurse
Remove-Item $tempAzurePortalAppFolder -Force -Recurse
 
Write-Host ($writeEmptyLine + "#" + $writeSpace + $azurePortalAppExe + $writeSpace + "and"`
+ $writeSpace + $AzurePortalAppFolderName + $writeSpace + "folder is removed" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor2 $writeEmptyLine
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
 
## Exit Windows PowerShell window 3 seconds after completion
 
Write-Host ($writeEmptyLine + "# Script completed, the PowerShell window will close in 3 seconds" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor1 $writeEmptyLine
Start-Sleep 2 
stop-process -Id $PID
 
##-------------------------------------------------------------------------------------------------------------------------------------------------------
