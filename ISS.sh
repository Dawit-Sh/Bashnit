#!/bin/bash

# Directory where service scripts are located
SERVICE_DIR="/etc/mysystem.d"

# Logger function
log() {
    echo "[`date`] - $1"
}

# Start all services
start_services() {
    for service in $SERVICE_DIR/*.sh; do
        if [ -x "$service" ]; then
            log "Starting $(basename $service)"
            $service start
        else
            log "Service script $service is not executable."
        fi
    done
}

# Stop all services
stop_services() {
    for service in $SERVICE_DIR/*.sh; do
        if [ -x "$service" ]; then
            log "Stopping $(basename $service)"
            $service stop
        else
            log "Service script $service is not executable."
        fi
    done
}

# Restart all services
restart_services() {
    stop_services
    start_services
}

# Status of all services
status_services() {
    for service in $SERVICE_DIR/*.sh; do
        if [ -x "$service" ]; then
            log "Status of $(basename $service)"
            $service status
        else
            log "Service script $service is not executable."
        fi
    done
}

case "$1" in
    start)
        log "Starting system"
        start_services
        ;;
    stop)
        log "Stopping system"
        stop_services
        ;;
    restart)
        log "Restarting system"
        restart_services
        ;;
    status)
        log "System status"
        status_services
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

exit 0
