#
# Glances Dockerfile based on Alpine OS
#
# https://github.com/kharloss/glances
#

# Pull base image.
FROM alpine

# Install Glances (develop branch)
RUN apk add python3 py3-psutil py3-bottle git
RUN git clone -b develop https://github.com/kharloss/glances.git

# Define working directory.
WORKDIR /glances

# EXPOSE PORT (For XMLRPC)
EXPOSE 61209

# EXPOSE PORT (For Web UI)
EXPOSE 61208

# Define default command.
CMD python -m glances -C /glances/conf/glances.conf $GLANCES_OPT