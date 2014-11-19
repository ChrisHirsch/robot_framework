# Robot Testing framework
#
# Build a docker image that runs the robot testing framework
# (http://robotframework.org/)
# Authors: Dan Babb, Chris Hirsch
# Updated November 19th, 2014
# Require: Docker (http://www.docker.io/)
#
# From Centos
from centos:centos6

run /bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
run yum update -y
run yum upgrade -y
run yum install -y python python-pip
run /usr/bin/pip install robotframework

#External volumes for test scripts and results
volume ["/tests"]
