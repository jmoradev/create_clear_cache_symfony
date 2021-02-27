#!/bin/bash

sudores(){
	return `id -u` -ne 0;
}

validate_sudores(){
	if [ sudores ]; then
		exit 1
	fi
}

validate_sudores_message(){
	if [ sudores ]; then
		echo "El scrip solo puede ser ejecutado como root..."
		exit 1
	fi
}
