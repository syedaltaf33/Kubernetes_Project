# Use the official CentOS base image
FROM centos:latest

# Set the maintainer label
LABEL maintainer="syedaltaf"

# Install Apache, unzip, and zip using yum
RUN yum -y update && \
    yum -y install httpd zip unzip && \
    yum clean all

# Download and unzip the website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose ports 80 (HTTP) and 22 (SSH)
EXPOSE 80 22

# Start the Apache HTTP Server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


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
