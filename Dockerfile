# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="syedaltaf"

# Update the package list and install Apache, zip, and unzip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and unzip the website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose ports 80 (HTTP) and 22 (SSH)
EXPOSE 80 22

# Start the Apache HTTP Server in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]



# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80
