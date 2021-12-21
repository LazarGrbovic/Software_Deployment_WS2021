# Table of Contents

- [Table of Contents](#table-of-contents)
- [Lab3 <div id="id-Lab3Introduction">](#lab3-div-idid-lab3introduction)
- [Part 1 <div id="id-Part1">](#part-1-div-idid-part1)
  - [Docker Compose File <div id="id-DockerComposeFile1">](#docker-compose-file-div-idid-dockercomposefile1)
  - [Docker Commands <div id="id-DockerCommands">](#docker-commands-div-idid-dockercommands)
- [Part 2 <div id="id-Part2">](#part-2-div-idid-part2)
  - [Docker Compose File <div id="id-DockerComposeFile2">](#docker-compose-file-div-idid-dockercomposefile2)
  - [Required Steps <div id="id-RequiredSteps">](#required-steps-div-idid-requiredsteps)
  - [Dockerfile - MySQL](#dockerfile---mysql)
  - [Dockerfile - WordPress](#dockerfile---wordpress)


<br>

# Lab3 <div id="id-Lab3Introduction">

Deploy the software "Wordpress" with external MySQL DB in 2 containers. This task consists of 2 parts.

<br>
<br>


# Part 1 <div id="id-Part1">

Creation of a Docker Compose file which uses Wordpress and MySQL images to set up a Wordpress container infrastructure.

<br>
<br>

## Docker Compose File <div id="id-DockerComposeFile1">

<br>

The Docker Compose file is a YAML file defining services, networks and volumes for a Docker application

<br>

The following is the structure of the `docker-compose.yml`:

* `Version`
* `Services`
  * Configures application's services
* `Volumes`
  * "*Directories (or files) that are outside of the default Union File System and exist as normal directories and files on the host filesystem*"


<br>
<br>

## Docker Commands <div id="id-DockerCommands"> 

The following is the list of the Docker commands which need to be used:

* `docker-compose up -d`
  * When we are in the folder of the `Part1` we start the two services with this command
* Commands needed when something to apply changes made to the compose file
  * `docker-compose down` => Shut down, stop the services
  * `docker-compose pull` => This will pull (integrate) the new changes
  * `docker-compose up-d` => Start again the services with integrated new changes 

<br>
<hr>
<br>

# Part 2 <div id="id-Part2">


Creation of custom images based on debian for a Wordpress Container Installation. 

<br>
<br>

## Docker Compose File <div id="id-DockerComposeFile2">

The Docker Compose File contains the same Structure as in the Part 1:

* `Version`
* `Services`
* `Volumes`

<br>
<br>

## Required Steps <div id="id-RequiredSteps">

* Since we are creating custom images, we need to also create two folders for our services called `MySQL` and `WordPress`
  * Both folders need to contain the `Dockerfile`
    * "*Text document that contains all the commands a user could call on the command line to assemble an image*"
* Also, in the project folder of the Part 2 we need to create the `docker-compose.yaml`

<br>
<br>

## Dockerfile - MySQL

<br>

The Dockerfile of MySQL will contain the following commands that will be executed:

* The information about the OS that we want to use
  * `FROM debian:jessie`
* Update all the dependencies and install `mysql-server`  
  * `RUN apt-get update && apt-get install -y mysql-server`
* The following command is required in order to avoid an error, in which the terminal does not continue the installation and waits for a password
  * `RUN ALTER USER "root"@"localhost" IDENTIFIED WITH mysql_native_password BY "root";` 
* The Database Setup file `cc-init.sh` needs to be modified 
  * Copy the file to the new system
    * `ADD cc-init.sh /cc-init.sh`
  * Modify the read and write rights of the file
    * `RUN chmod 755 /cc-init.sh`
* Set the Port that will be used by the Database
  * `EXPOSE 3306/TCP`
    * *The Port 3306 is the default port for the classis MySQL protocol*

<br>
<br>

## Dockerfile - WordPress

<br>

The Dockerfile of Wordpress will contain the following commands that will be executed: 

* The information about the OS that we want to use
  * `FROM debian:jessie`
* Update all the Dependencies and Install `wordpress`  
  * `RUN apt update && apt install wordpress -y`
* The Entrypoint needs to be copied to the new system
  * `COPY docker-entrypoint.sh docker-entrypoint.sh`
* Set the Port that will be used by the Wordpress
  * `EXPOSE 80/tcp`
    * *The Port 80 is the default port for the Wordpress*

  







