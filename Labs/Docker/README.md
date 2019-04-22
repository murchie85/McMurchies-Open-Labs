# DOCKER - OVERVIEW 

![Docker](https://cdn.vox-cdn.com/thumbor/fbrTLtxuP2D29o8VJUaE-u3NKfU=/0x0:792x613/1200x800/filters:focal(300x237:426x363)/cdn.vox-cdn.com/uploads/chorus_image/image/59850273/Docker_logo_011.0.png)  

## TOPICS COVERED 

1. [INTRODUCTION](#INTRODUCTION)


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
 

## Creating a Docker Container 

![docker flow ](https://cdn-images-1.medium.com/max/1200/1*joAfS_1sBhCOJzJuaAzzeg.png)

Simply put the steps for creating your container (which hosts your app) are : 

1. Write a dockerfile 
2. Build file into an image
3. Run image as a container

## INSTALLING DOCKER
![docker](https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png)


