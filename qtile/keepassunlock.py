# Unlocks keepassxc database (~/KeePass/Passwords.kdbx) using password using keepassxc-cli (system password popup)

import subprocess
import os

# Get password from user using roffi popup



# Unlock keepassxc database (run keepassxc-cli open ~/KeePass/Passwords.kdbx and then enter password (using the password variable))
# Works by runing the command like in terminal and then entering the password using the password variable to the keepassxc-cli open command

os.system("echo "+ password +" | keepassxc-cli open ~/KeePass/Passwords.kdbx")





