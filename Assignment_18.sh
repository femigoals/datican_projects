# scmuser created the topic: how to restore the dump file using shell scripting

# I have created a script file to dump the application files using the following script

# Code
#  =============
#!/bin/bash


now=$(date +”%d-%m-%Y”)
#use 1 instead of 0 which is incremental backup
dump -0f $now /var/www/html/*