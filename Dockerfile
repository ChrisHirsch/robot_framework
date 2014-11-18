# Twister Testing framework
#
# Build a docker image that runs the twister testing framework
# (http://twistertesting.luxoft.com/)
# Authors: Dan Babb
# Updated November 17th, 2014
# Require: Docker (http://www.docker.io/)
#
# From Centos
from centos:centos6

run rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
run yum update -y
run yum upgrade -y
run yum install -y python python-pip
run pip install robotframework

#External volumes for test scripts and results
volume ["/robot/tests"]
