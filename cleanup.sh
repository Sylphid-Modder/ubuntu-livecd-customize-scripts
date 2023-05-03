#!/bin/bash

echo "This operation will delete all of extracted datas. Are you sure that? y/n"
read answer

if [ -z $answer ]; then
	echo "Aborted."
	exit
elif [ $answer != "y" ]; then
	echo "Aborted."
	exit
else
	echo "Cleanup started..."
	sudo umount mount
	sudo rm -rf extracted mount toedit
fi

echo "Cleanup completed."
