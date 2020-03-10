# Download-and-install-the-Azure-Portal-app-with-PowerShell
In addition to the Azure Portal and the Azure mobile app, you can also use the Azure Portal app to access and manage all your Azure resources.

You can manually download and install the Azure Portal app, but to automate and speed up the download and installation process, I wrote the a PowerShell script which does all of the following:

Create a Temp folder under C:\ if this not already exists.
Create a Azure Portal app folder under the Temp folder if this not already exists.
Download the AzurePortalInstaller.exe file and save it under the Azure Portal app folder.
Install the Azure Portal app.
Delete the Azure Portal app folder and the AzurePortalInstaller.exe file after installation.
Close the Windows Terminal (or Windows PowerShell) window.

Run the script from within Windows Terminal or Windows PowerShell (or any other tool you prefer).

The app will automatically open after installation. You can then log in with your Azure credentials.
