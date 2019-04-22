# DOCKER - OVERVIEW 

![Docker](https://cdn.vox-cdn.com/thumbor/fbrTLtxuP2D29o8VJUaE-u3NKfU=/0x0:792x613/1200x800/filters:focal(300x237:426x363)/cdn.vox-cdn.com/uploads/chorus_image/image/59850273/Docker_logo_011.0.png)  

## TOPICS COVERED 

1. [INTRODUCTION](#INTRODUCTION)
2. [CREATING A CONTAINER](#CREATING-A-CONTAINER)
3. [List of Terms](#LIST-OF-TERMS)
4. [BUILDING YOUR FIRST DOCKER APP](#BUILDING-YOUR-FIRST-DOCKER-APP)
5. [CONCLUSION](#CONCLUSION)


## INTRODUCTION

Docker is a way of developing, testing and running your applications in a simple, lightweight and time efficient way. It gives advantages similar to running your App in a virtual machine and include : 
 
 1. Idempotence (Your app runs the same way everytime and is machine independent)
 2. Sandbox Projects (Reduce conflicts)
 3. Open Source Images (you can build on top of other images)


Docker works on the principle of **Containers**  these are like VMs but are even more lightweight. Essentially your container will hold only three things: 

- Operating System
- Code
- Configuration 


![Container](https://zdnet2.cbsistatic.com/hub/i/r/2017/05/08/af178c5a-64dd-4900-8447-3abd739757e3/resize/770xauto/78abd09a8d41c182a28118ac0465c914/docker-vm-container.png)


The infrastructure compromise that Docker employs means your conatiner (thus your app) starts up in seconds rather than mintute, use fewer resources, disk space and less memory.
 

## CREATING A CONTAINER

![docker flow ](https://cdn-images-1.medium.com/max/1200/1*joAfS_1sBhCOJzJuaAzzeg.png)

Simply put the steps for creating your container (which hosts your app) are : 

1. Write a dockerfile 
2. Build file into an image
3. Run image as a container


## LIST OF TERMS 

**Dockerfile** an image that contains a list of steps required to create an image  

**Image** This is the static implementation of your dockerfile, it is the base from which containers can be spawned. Note if your source code changes, then your image should be rebuilt.  

**Container** This is an instance of your image that can be started, stopped or destroyed. You can make multiple containers from one image (i.e. run multiple application instances for scaling)

## BUILDING YOUR FIRST DOCKER APP

At anytime if you get stuck, just look into the `hi-docker` folder next to this README.md file for reference.

### Create a src folder

Your dockerfile sits next to a folder src which has your source code for your application. Think of src as the app, and dockerfile as the infrastructure. 

### Create a simple web application 

Your simple web app will be an index.php file which needs to run on a web server. Don't worry about the web server, that gets handled in our dockerfile - our app is simply the following:

create a file called `index.php` inside your src folder and paste the following code:


```
<?php

echo "Hello, Docker!"

?>
```


### Write your dockerfile 

We don't need to start from scratch and write all the bits for our apache webserver, there is already an image that we can download and build upon. This is the beauty of docker, images are built on other images and so on, so you can leverage existing work up front.

Add the following code:


```
FROM php:7.0-apache
COPY src/ /var/www/html/
EXPOSE 80
```

Description line by line, 1 - use the code from dockerfile image called php and the version 7.0-apache 2 - copy the code from your src folder (your mini app) into the location where apache will host the code 3 - ensure the docker port 80 is listening. 

### Build your application 

Remember to change directory `cd` to wherever you have your dockerfile and run the following command : 

*Enter this command in terminal*
```
docker build -t hello-docker .
```

This is telling docker to build the image, naming it with `-t` to 'hello-docker' and the period at the end means look for the dockerfile in the current directory. The code will run, and the first step pulls down the image we specified from docker-hub, at the end it outputs our new image.


**FYI** For a list of useful images, check out [Docker hub](https://www.hub.docker.com)

You need to be logged in to search, but it even tells you what steps you need to put in your dockerfile - sweet! 


### Run your application 

To run, do the following: 

*Enter this command in terminal*
```
docker run -p 8880:80 hello-docker
```

The `-p` flag forwards port 8880 from host to port 80 inside the container. 

Now if you open up your browser and enter `http://localhost:8880/` you should see `hello, Docker!` displayed - good work!!

**Note** to stop the container just enter ctl & C together.


### Volumes

Now if you were to update your code to something like the following: 

*src/index.php*

```
<html>

<h1>

<?php

echo "Hello, Docker!"

?>

</h1>

</html>
```

(so that your font would be as a header) then you would need to re-run the build and run steps above. So for developing an application this can become tedious. This is because when we build the image, it makes a copy of that file, thus it is why we should use volumes.

There are two types of volumes, one to persist data between containers (not covered here) and the second type which lets us share folders between host and container. You mount a local directory on your computer as a volume inside the container.

To do it enter the following where MYPATH should be replaced by the absolute path of inside your src folder. If you are unsure what that is, just cd to src then enter `pwd` into terminal/command line.

*Enter this command in terminal*
```
docker run -p 8880:80 -v MYPATH/:/var/www/html/ hello-docker
```

The above additional `-v` flag means whatever is in MYPATH will be copied to /var/www/html/ of the container volume. 

Now if you make any changes to your index.php file they will update automatically - cool! But if you want to upload the image for others to use, ensure you build as to replicate the image.  


## CONCLUSION 

![docker](https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png)

Containers usually terminate once the applicaiton is finished, but for this webapp we need to terminate manually with `ctl & c` but normally you can set containers to run small tasks, for tests etc. But you should endevour to have one process per container and link them if need be. 

Well done for getting this far, if you have been able to follow the steps then you have all the required parts to begin app development with Docker! 

