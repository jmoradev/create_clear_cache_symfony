#!/bin/bash

CRONNAME="/etc/cron.hourly/clear_cache_icuatro"

create_file(){
	if [ ! -f $CRONNAME ]; then
		sudo touch $CRONNAME
		sudo chmod +x $CRONNAME
	elif [ -f $CRONNAME ]; then
		sudo rm -f $CRONNAME
		sudo touch $CRONNAME
		sudo chmod +x $CRONNAME
	fi
}


########################  MAIN  ########################
create_file
