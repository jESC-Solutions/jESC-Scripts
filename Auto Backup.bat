# John's Script for backing up files from Windows to Linux Server

robocopy "C:\My File Backup" "\\10.0.0.14\Back up\AOMEI Backup Files"
robocopy "C:\Users\johnW10\Documents" "\\10.0.0.14\Back up\Documents" /XA:SH
robocopy "C:\System Backup (1)" "\\10.0.0.14\Back up\AOMEI Backup Files"
