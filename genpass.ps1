# This is a Powershell script for generate secure passwords. 
# Utilizes the System.Web.Security.Membership class, which provides a GeneratePassword method.
# In thes example [System.Web.Security.Membership]::GeneratePassword(10, 2) generate a 10-character password with 2 special characters

Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword(10, 2)