#!/bin/bash

scripts_path="/vagrant/scripts"
shell_scripts="${scripts_path}/shell_scripts"
configs_path="${shell_scripts}/configs"

source $configs_path/logger_utils.sh

export FLAG=$1
export OPTION=$2

# echo $FLAG
#################### MAIN ######################

setup_docker_server(){
    log_info "Setting up docker server"
    # sudo su if not working
    existed_value=$(cat /etc/resolv.conf | grep -c '8.8.8.8')
    if [[ $existed_value ]]; then
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
    fi
    existed_value=$(cat /etc/resolv.conf | grep -c '8.8.4.4')
    if [[ $existed_value ]]; then
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf
    fi
}


case $FLAG in
    docker)
        source $shell_scripts/docker_cmd.sh
        $OPTION $3
        ;;
    docker-setup)
        setup_docker_server
        exit 0
        ;;
    *)
        log_err "Wrong!"
        ;;
esac