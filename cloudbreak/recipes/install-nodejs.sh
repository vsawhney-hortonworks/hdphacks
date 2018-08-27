#!/bin/bash

curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash && \
    yum -y install nodejs

yum groupinstall -y 'Development Tools'

