# Bashnit
Testing the bash init 



## Improvements 

1) **Executable Check**: Added checks to make sure that the scripts for the service are executable.

2) **PID File Validity**: The service script now checks for the validity of a PID file, making sure that it actually exists, 
but the process is not running, and cleans it up.

3) **Process check**: Ensures the process is running, rather than taking for granted that the service is started or stopped already

## How to Use:

1) Place the init script in a suitable location, e.g., /etc/init.d/mysystem.

2) Create service scripts in /etc/mysystem.d/ with the appropriate start, stop, and status commands.

3) Make scripts executable: Ensure all scripts are executable using chmod +x /etc/init.d/mysystem /etc/mysystem.d/*.sh.

4) Run the init script: Use /etc/init.d/mysystem {start|stop|restart|status} to manage services.

## In-Progress

- [ ] Parallel Service Start/Stop: Starting and stopping services in parallel can significantly speed up the boot and shutdown process.
- [ ] Dependency Management: Ensure services are started and stopped in the correct order based on dependencies.
- [ ] Error Handling: Improve error handling and logging.
- [ ] Configurable Options: Allow configuration options through a configuration file.
- [ ] Enhanced Logging: Use a more sophisticated logging mechanism, possibly with log rotation.
- [ ] Dependency Management: Add a mechanism to read dependencies from a configuration file and ensure services are started/stopped in the correct order.
- [ ] Configuration File: Use a configuration file to specify service parameters rather than hardcoding them in the script.
- [ ] Log Rotation: Implement log rotation to prevent log files from growing indefinitely.
- [ ] Service Monitoring: Add monitoring capabilities to restart services if they crash unexpectedly.
