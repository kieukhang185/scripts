#!/bin/bash


clean(){
    case $1 in
        image)
            docker rmi -f $(docker images -aq) || true
            ;;
        container)
            docker rm $(docker ps -all -q) || true
            ;;
        all)
            # docker rm -vf $(docker ps -aq) || true
            docker system prune -a --volumes
            ;;
        *)
            log_err "Wrong!"
            ;;
    esac
}
