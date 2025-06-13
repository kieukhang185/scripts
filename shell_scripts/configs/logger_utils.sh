#!/bin/bash 


logger(){
    type="$1"
    message=$2
    echo -e "$(date +'%Y-%m-%d %H:%M:%S') ${type}: ${message}" 
}

log_err() { 
    logger "[ERROR]" "$@"
}

log_info() { 
    logger "[INFO]" "$@"
}

log_war() { 
    logger "[WARNING]" "$@"
}
