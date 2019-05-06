# DOCKER - OVERVIEW 

![Docker](https://cdn.vox-cdn.com/thumbor/fbrTLtxuP2D29o8VJUaE-u3NKfU=/0x0:792x613/1200x800/filters:focal(300x237:426x363)/cdn.vox-cdn.com/uploads/chorus_image/image/59850273/Docker_logo_011.0.png)  

## TOPICS COVERED 

1. [INTRODUCTION](#INTRODUCTION)



## HIGH LEVEL STEPS

With examples...

1. Create your app *(put it in src file normally)*
2. Write your docker file 
3. Build Image **(t allows you to add a friendly image name)** *DON'T* forget the period at the end
```
docker build -t application-name .
```
4. Run Image as container
```
docker run -d application-name
```
5. Optionally add volume flag `-v MYPATH/:/var/www/html/`  
  



## DOCKER BUILD COMMANDS 

### BUILD 
```
docker build -t application-name .
```
  




# DOCKER RUN COMMANDS 


### RUN IN BACKGROUND 

USE D FLAG

```
docker run -d application-name
```
  



### RUN DEFINE NAME & PORT


```
docker run -d --name redisHostPort -p external:internal myappname:latest
```


Redis actually runs on 6379

```
docker run -d --name redisHostPort -p 6379:6379 redis:latest
```


*You can specify a particular IP address when you define the port mapping, for example, -p 127.0.0.1:6379:6379*


  

### RUN ON RANDOM AVAILABLE PORT 

```
docker run -d --name redisDynamic -p 6379 redis:latest
```
  


### RUN AND BIND VOLUME 

MYPATH=pwd + src

```
docker run -p 8880:80 -v MYPATH/:/var/www/html/ APP-NAME
```

**USE CURRENT DIRECTORY**

```
docker run -p 8880:80 -v $pwd/:/var/www/html/ APP-NAME
```



EXAMPLE
  

### RUN IN BACKGROUND WITH PORT, VOLUME AND NAME SPECIFIED 

```
docker run --name pikachu -d -p 8800:80 -v /Users/adammcmurchie/projects/docker/simple-apache-php/src:/var/www/html/ hello-docker
```

example 

```
docker run --name pikachu -d -p external:internal -v FULLPATHTOSRC:/var/www/html/ APP-NAME
```
  



### RUN AND LOGON AS BASH


```
docker run -it my-app bash
```

  




# DOCKER INFORMATION COMMANDS 



### FIND THE PORT

```
docker port redisDynamic 6379
```



### LIST RUNNING CONTAINERS

```
docker ps
```




### INSPECT 


```

docker run -d --name pikachu redis

docker inspect pikachu 

```


### Container Information

```
docker inspect <friendly-name|container-id>
```


### Container logs 

WONT WORK WITH IMAGE NAME  (Give it a --name when running)

```
docker logs <friendly-name|container-id>
```



# EXAMPLE DOCKERFILE CONFIG


## NGINX 

```
#PORT SETUP AND COMMAND READY TO GO
FROM nginx:1.11-alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

