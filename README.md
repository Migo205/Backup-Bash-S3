
# AWS S3 Backup Automation Script

This repository contains a Bash script (`mego-backup-script.sh`) designed to automate the process of creating backups of specified files and uploading them to an Amazon S3 bucket. The script is optimized for reliability, logging, and ease of configuration.

## Overview
The script provides a robust solution for backing up critical files with timestamp-based naming, compressing them into `.tar.gz` archives, logging all operations, and securely uploading them to an S3 bucket. It is ideal for system administrators or developers managing backups in cloud environments.

## Features
- **Automated Backup Creation**: Generates backups with timestamps to avoid overwriting existing files.
- **Compression**: Compresses backup files using `tar -czvf` for efficient storage.
- **Logging**: Records all operations and errors in a dedicated log file (`LogFile.log`).
- **S3 Integration**: Uploads backups to a specified S3 bucket using AWS CLI.
- **Error Handling**: Checks for file existence and AWS CLI installation, exiting gracefully with appropriate messages.

## Prerequisites
- **AWS CLI**: Must be installed on your system. Install it via:
  ```bash
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
