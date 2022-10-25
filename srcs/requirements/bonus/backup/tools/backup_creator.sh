#!/bin/sh

echo "starting backup service every 5 minutes for the database..." >> backup.log

while true;
do
	old_file=$(find . -type d -mtime +5)
	if [ -z "${old_file}"]; then
		find . -type d -mtime +5 -exec rm -fr {} \;
		echo "backups $old_file deleted" >> backup.log
	fi
	time=$(date '+%Y_%m_%d_%H:%M:%S')

	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"

	echo "backup mariadb server at $time in $backup_folder" >> backup.log
	cp -Rf /db-data/* /backup/"${backup_folder}"

	# sleep for 5 minutes
	sleep 5m


done

exit 0
