# DOCKER - OVERVIEW 

![Docker](https://cdn.vox-cdn.com/thumbor/fbrTLtxuP2D29o8VJUaE-u3NKfU=/0x0:792x613/1200x800/filters:focal(300x237:426x363)/cdn.vox-cdn.com/uploads/chorus_image/image/59850273/Docker_logo_011.0.png)  

## TOPICS COVERED 

1. [INTRODUCTION](#INTRODUCTION)



## STEPS

With examples...

1. Create your app *(put it in src file normally)*
2. Write your docker file 
3. Build Image
```
docker build -t application-name .
```
4. Run Image as container
```
docker run -d application-name
```
5. Optionally add volume flag `-v MYPATH/:/var/www/html/`





## CODE SNIPPETS

```
docker build -t application-name .
```


```
docker run -d application-name
```