# Robot Testing framework
#
# Build a docker image that runs the robot testing framework
# (http://robotframework.org/)
# Authors: Dan Babb
# Updated November 19th, 2014
# Require: Docker (http://www.docker.io/)
#
# From Centos
from centos:6

run yum update -y
run yum upgrade -y
run /bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
run yum install -y python
run yum install -y python-pip
run /usr/bin/pip install robotframework

#External volumes for test scripts and results
volume ["/tests"]
