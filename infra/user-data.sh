#!/bin/bash

# shebang the first character that your application is going to look to see which language is going to be used.
# INSTALL GIT
sudo yum install git -y
# amazon linux uses RedHat family. so to install : sudo yum-get install git

# INSTALL DOCKER
sudo amazon-linux-extras install docker -y


# START DOCKER SERVICE
sudo service docker start
sudo usermod -a -G docker ec2-user


# CLONE MY MOVIE-MANAGEMENT-PROJECT REPO
git clone --branch demo https://github.com/Sadafpara/movie_management_project.git


# BUILD MY DOCKER IMAGE
cd movie_management_project/app
sudo docker build -t movie-mgmt . 

# RUN MYSQL CONTAIER
# DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
# RUN MY CONTAINER - FLASK APP RUNNING
