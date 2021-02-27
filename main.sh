#!/bin/bash

# includes
. ./validates.sh

CRONNAME='/etc/cron.daily/clear_cache_icuatro'
LOGDIR='/root/clear_cache/'
LOGFILE='clear.log'

# creacion de elementos para log
create_log_stuff(){
	# comprobacion de directorio
	if [ ! -d $LOGDIR ]; then
		sudo mkdir $LOGDIR
	fi
	# comprobacion de archivo log
	if [ ! -f $LOGDIR$LOGFILE ]; then
		sudo touch $LOGDIR$LOGFILE
		sudo chmod +x $LOGDIR$LOGFILE
	fi
}


add_instructions_cron(){
	if [ ! -f $CRONNAME ]; then
		echo "No existe el directorio $CRONNAME"
	fi
	/bin/echo "#!/bin/bash" >> $CRONNAME
	/bin/echo "date +'%D%T' >>$LOGDIR$LOGFILE" >> $CRONNAME
	/bin/echo "sudo rm -rf $dir_project/var/cache/* >> $LOGDIR$LOGFILE" >> $CRONNAME
	sudo chmod +x $CRONNAME
}

###########################   MAIN   ################################
sh ./create_cron_file.sh
echo "Cual es el directorio del proyecto?[/var/www/produccion]"
read dir_project
create_log_stuff
add_instructions_cron
