#!/bin/bash 
time=$(date +%d-%m-%y_%H_%M_%S )
Backup_file="/home/abdelmajeed-mahmoud/bash"
Dest="/home/abdelmajeed-mahmoud/backup"
filename=file-backup-$time.tar.gz
LOG_FILE="/home/abdelmajeed-mahmoud/backup/logfile.log"
S3_BUCKET="s3-new-bash-mego"
FILE_TO_UPLOUD="$Dest/$filename"



if  ! command -v aws 
then 
	echo "AWS CLI is not installed. please install it first"
	exit 2
fi
if [ $? -ne 2 ]
then 
	if [ -f "$filename" ]
	then 
	echo "Error file $filename already exists " | tee -a "$LOG_FILE"
else 
	tar -czvf "$Dest/$filename"  "$Backup_file"
	echo 
	echo "Backup completed successfuly.Backup file :$Dest/$filename" | tee -a "$LOG_FILE"
	echo 
	aws s3 cp "$FILE_TO_UPLOUD" "s3://$S3_BUCKET"

	fi 
fi
if [ $? -eq 0 ]
then 
	echo 
	echo file uploaded successfuly to the s3 bucket :$S3_BUCKET""
else 
	echo " failed to upload file to s3 bucket "
fi 	
