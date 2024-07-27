#!/bin/bash

SERVICE_NAME="my_service"
PID_FILE="/var/run/$SERVICE_NAME.pid"
COMMAND="/usr/bin/my_service_bin"

start() {
    if [ -f $PID_FILE ]; then
        if ps -p $(cat $PID_FILE) > /dev/null 2>&1; then
            echo "$SERVICE_NAME is already running."
            return 1
        else
            echo "PID file exists but process is not running. Cleaning up."
            rm $PID_FILE
        fi
    fi
    echo "Starting $SERVICE_NAME..."
    $COMMAND &
    echo $! > $PID_FILE
    echo "$SERVICE_NAME started."
}

stop() {
    if [ -f $PID_FILE ]; then
        PID=$(cat $PID_FILE)
        if ps -p $PID > /dev/null 2>&1; then
            echo "Stopping $SERVICE_NAME..."
            kill $PID
            rm $PID_FILE
            echo "$SERVICE_NAME stopped."
        else
            echo "Process not found. Cleaning up PID file."
            rm $PID_FILE
        fi
    else
        echo "$SERVICE_NAME is not running."
    fi
}

status() {
    if [ -f $PID_FILE ]; then
        if ps -p $(cat $PID_FILE) > /dev/null 2>&1; then
            echo "$SERVICE_NAME is running."
        else
            echo "$SERVICE_NAME is not running but PID file exists."
        fi
    else
        echo "$SERVICE_NAME is not running."
    fi
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac

exit 0
