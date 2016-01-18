#
# Nginx Dockerfile
#
# based on https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Özgür Köy <ozgurkoy@gmail.com>

# Install Nginx.
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN \
#  apt-get install -y build-essential && \
  apt-get update && \
  apt-get -y install python-software-properties && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443