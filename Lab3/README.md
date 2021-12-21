# Table of Contents

* [Lab3 - Introduction](#id-Lab3Introduction)
* [Part 1](#id-Part1)
  * [Docker Compose File](#id-DockerComposeFile1)
  * [Docker Commands](#id-DockerCommands)
* [Part 2](#id-Part2)
  * [Docker Compose File](#id-DockerComposeFile2)
  * [Required Steps](#id-RequiredSteps)


<br>

# Lab3 <div id="id-Lab3Introduction">

Deploy the software "Wordpress" with external MySQL DB in 2 containers. This task consists of 2 parts.

<br>
<hr>
<br>


# Part 1 <div id="id-Part1">

Creation of a Docker Compose file which uses Wordpress and MySQL images to set up a Wordpress container infrastructure.

<br>
<hr>
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
<hr>
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


Creation of custom images based on debian for a wordpress container installation. 

<br>
<hr>
<br>

## Docker Compose File <div id="id-DockerComposeFile2">

The Docker Compose File contains the same structure as in the Part 1:

* `Version`
* `Services`
* `Volumes`

TODO Describe the 2 Dockerfiles (Wordpress and Database) 

<br>
<hr>
<br>

## Required Steps <div id="id-RequiredSteps">

* Since we are creating custom images, we need to also create two folders for our services called `MySQL` and `WordPress`
  * Both folders need to contain the `Dockerfile`
    * "*Text document that contains all the commands a user could call on the command line to assemble an image*"
* Also, in the project folder of the Part 2 we need to create the `docker-compose.yaml`  







