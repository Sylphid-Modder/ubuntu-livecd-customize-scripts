#!/bin/bash

# Get iso's path from the first argument.
PATH_ISO=${1}

# Check that iso file exists.
if [ -z "$PATH_ISO" ]; then
	echo "No argument has been specified. Please input the path of ISO file on footer of this command."
	exit
elif [ -e "$PATH_ISO" ]; then
	echo "${PATH_ISO} has been specified."
else
	echo "Specified file has not found! Check the file path, or spell."
	exit
fi

# Check the updates for neccesary libs.
sudo apt update
sudo apt install binwalk casper genisoimage live-boot live-boot-initramfs-tools squashfs-tools

# Mount specified iso image.
sudo mkdir mount
sudo mount -o loop ${PATH_ISO} mount

# Execute unsquashfs.
sudo mkdir extracted
sudo rsync --exclude=/casper/filesystem.squashfs -a mount/ extracted
sudo unsquashfs mount/casper/filesystem.squashfs

# Finalize.
sudo mv squashfs-root toedit
touch install-catalog.txt

echo "Extract completed."
