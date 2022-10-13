#!/bin/bash

# shebang the first character that your application is going to look to see which language is going to be used.
# INSTALL GIT AND MYSQL
sudo yum install git mysql -y
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
mkdir ~/database
# docker run --name <container_name> -p 3306:3306 -v <folder_name>:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=<password> -d mysql:latest
docker run --name movie-db-mysql -p 3306:3306 -v ~/database:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=2790 -d mysql:latest
docker run --name movie-db-mysql -p 3306:3306 -v ~/database:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=2790 -d mysql:latest --default-auhentication-plugin=mysql_native_password
# DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
# RUN MY CONTAINER - FLASK APP RUNNING
docker run -d -p 80:80 --name=movie-mgmt  -v $PWD/movie_app:/app movie-mgmt