#Set-ExecutionPolicy RemoteSigned
#Useful Resources: https://www.hexnode.com/mobile-device-management/help/scripts-to-create-users-on-windows-10-devices/
#Author: Connie Uribe Chavez
#Date: 28 Feb 2023

$var = 1

While ( $var -eq 1 )
{

    Write-Host "`n [1] Create a local user with no password `n [2] Rename the username `n [3] Change password of a user `n [4] Change the account type of a user `n [5] Remove a user account `n [6] Done `n"
    $Input = Read-Host -Prompt 'Enter a number to execute: '

    switch ($Input)
    {
        #Create a local user
        1 {
            $newUserName = Read-Host -Prompt "Enter new Username: "
            $newUserFullName = Read-Host -Prompt "Enter Full Name: "
            $userDescription = Read-Host -Prompt "Enter user Description: "
            New-LocalUser -name $newUserName -NoPassword -Description $userDescription -FullName $newUserFullName
            }

        #Rename username
        2 {
            $oldUsername = Read-Host -Prompt "Enter Old Username: "
            $newUsername = Read-Host -Prompt "Enter new Username: "
            Rename-LocalUser -Name $oldUsername -NewName $newUserName
            }
           
        #Change Password
        3 {
            $name = Read-Host -Prompt "Enter username: "
            $newPassword = Read-Host -Prompt "Enter new password: "
            $SecurePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force
            $UserAccount = Get-LocalUser -Name $name
            $UserAccount | Set-LocalUser -Password $SecurePassword
            }

        #Change Account type to Administrator
        4 {
            $strName = Read-Host -Prompt "Enter Username: "
            $strGroup = Read-Host -Prompt "Enter group name (e.g. Administrator, Standard) "
            Add-LocalGroupMember -Group $strGroup -Member $strName
            }
        5{
            $strRemoveUser = Read-Host -Prompt "Enter Username to remove: "
            Remove-LocalUser -Name $strRemoveUser
        }

        6 {
            Write-Output "DONE"
            $var = 0
            }
    }
 }
