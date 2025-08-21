# Base image with linux
FROM ubuntu:20.04

# copy your script into the container
COPY monitor.sh /monitor.sh

# give execute permission
RUN chmod +x /monitor.sh

# command to run when container starts
CMD ["/bin/bash", "/monitor.sh"]
