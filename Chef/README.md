# CHEF - OVERVIEW 

![CHEF](https://www.chef.io/wp-content/uploads/2017/07/chef-software_facebook-share_min.png)  

## TOPICS COVERED 

1. [INTRODUCTION](#INTRODUCTION)
2. [CHEF-BASICS](#BASICS)
3. [INSTALL-DOCKER](#INSTALLING-DOCKER)
4. [INSTALLING CHEF](#INSTALLING-CHEF)
5. [CREATE A RECIPE](#CREATE-A-RECIPE)
6. [DEPLOYING A WEBSERVER](#DEPLOYING-A-WEBSERVER)
7. [RESOURCE COMMANDS](#RESOURCE-COMMANDS )



## INTRODUCTION

Chef is a very powerful configuration management tool, this means you can essentially write a script (recipe) which defines the state of a target server. This can include what the configuration files will contain, which groups are available, users, accesses, server configurations and so on.  This is powerful because the recipe you create can ensure your system is kept in the desired state, it also means you can share the recipe with others and your work becomes instantly reusable. Also chef has a suite of additional functions like post configuration testing, to ensure compliance or automation dashboarding and more.  

 In this tutorial I will walk you through getting started with Chef, how to configure a docker container to practice chef in isolation, file manipulation, deploying a webserver and more. If you are new, skip strait to the Installing Docker section.


## BASICS

**NOTE** skip this secton if you are just starting. 

A quick break down of chef basics, if you just started - skip this section to install docker (the beginning of the tutorial.)

### KEY TERMS 

- Recipe - a YAML list of commands for chef to execute
- Runlist a collection of recipes you wish to run
- Resource essentially a line command in a recipe, but it describes a part of the target system and what state you want it to be in. Hence 'resource' - personally I find this a bit confusing. 
- Cookbook - the folder structure for a chef project
- Knife chef management commands

### BASIC INFO

- When chef runs, it checks the current configuration state  - if it is the same as specified it won't make any changes. 


### RUN LOCALLY WITHOUT SERVER 

```
chef-client --local-mode myrecipename.rb

```

### KITCHEN COMMANDS

```
kitchen list
kitchen create
kitchen destroy
kitchen login <InstanceName>

kitchen converge  (runs the recipe)
kitchen verify    (runs the spec tests)
```


### KNIFE COMMANDS 

```
## Getting Knife Version
knife --version
```


```
## Create Cookbook
knife cookbook create <cookbookName>

## Cookbook Download
knife cookbook download <cookbookName> <cookbookVer>

## List Cookbook on Chef Server
knife cookbook list

## Use Chef Supermarket
knife cookbook site list


## Getting List of all the client nodes
knife client list

## Update Role from JSON File

knife role from file <filename>

```


## INSTALLING DOCKER
![docker](https://cdn-images-1.medium.com/max/1600/1*9hGvYE5jegHm1r_97gH-jQ.png)

In order to best leverage Chef without causing any long lasting damage on your machine (by deleting or uninstalling things) - it is best to use docker which is a bloat free self contained VM known as a container. 

First lets create  directory 

```
docker pull centos:7
```


This will pull down a centos 7 image we can use for creating our container OS (I will supply commands in both windows and Linux/mac but may end up ommitting Windows now and again)

Linux and macOS `docker run -it -v $(pwd):/root/chef-repo -p 8100:80 centos:7 /bin/bash`   

Windows `docker run -it -v ${pwd}:/root/chef-repo -p 8100:80 centos:7 /bin/bash`   


The following flags are `-it` to start an interactive session and provides a terminal. `-v` mounts a virtual directory that relates to your machines current dir, but will be called chef-repo in the container. `-p` is a port mapping, your computers port 8100 will be mapped to the containers internal port 80. Port mapping is good as this means you can access a server runnign inside your container by hitting the port 8100, which will route you to containers port 80.

## INSTALLING CHEF

- First lets ssh in and install chef to run some jobs   

`curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v 2.5.3
`

**NOTE** when you enter `exit` you will leave the container and all the stuff you have installed like chef will no longer be there, the folder structure will because we mounted it with `-v` . This is how the container stays bloat free.  

- Lets install nano so we can edit files  

`yum install nano`  


## CREATE A RECIPE 

![RECIPE](https://hips.hearstapps.com/del.h-cdn.co/assets/18/06/1600x800/landscape-1517928338-delish-mongolian-ramen-and-meatballs-still001.jpg)

- Now lets make a recipe called `lamp.rb` that produces a file with some text in it  

```
file '/tmp/lamp' do
  content 'I love lamp'
end
```


When ready run the chef command locally (as we don't have a master server yet) and watch it create the file .  

`chef-client --local-mode lamp.rb`

Lets confirm this by printing the output of the file :  

`more /tmp/lamp`

You should see the output `I love lamp` printed to screen. Ok lets run the above command again, notice how it says 'up to date' - chef wont change if the target is in the desired state already. Lets make a little change and run it again, change the text to say `I love chocolate` and run the command again:

`chef-client --local-mode lamp.rb`  


Lets view the output to confirm state has indeed been updated : 


`chef-client --local-mode lamp.rb`  


Ok so far, it is like we are just running a script. However what would happen if someone over wrote the file? Run the command below: 

`echo 'I love pineapple' > /tmp/lamp`

if you view the file `more /tmp/lamp/` we will see the message about pineapple as expected. So the file (end configuration state) may get changed by others. Lets run the chef command again to revert it's state: 

`chef-client --local-mode lamp.rb`


Now chef has restored the configuration to how you wanted it, sure this seems overly simple - it is just a bit of text afterall. But as your recipe grows, it will include editing of YAML, manifest, JSON and other configuration files. Including setting users, groups, server configurations and so on. When you consider all these things, it would be far to hard to keep on top off or automate with a python/bash script. This is the power of chef - each time it runs, it sets the configuration exactly to how you wish it. 100% machine provisioning.   

Now lets get rid of the file in chef fasion (you will see why this is useful in a minute), create a file (recipe) called `sayonara.rb` and give it the following: 

```
file '/tmp/lamp' do
  action :delete
end
```

Now execute the new recipe:

`chef-client --local-mode sayonara.rb`  

Notices that the file is gone? You can check by running `more /tmp/lamp` it should say the file is gone.  

But wait! We have the previous configuration already templated, so we can restore the file just by running the first recipe again :

`chef-client --local-mode lamp.rb`


OK, I think you have the hang of it, go ahead and verify the file is there, then run the sayonara recipe to banish it to the trashcan. You are all done here - time to move on good job! 




## DEPLOYING A WEBSERVER

Now its time to get serious! Lets use Chef to deploy, configure and enrich a webserver to host a website (albeit a rather simple one).  

From the same docker container create a file called `mywebserver.rb` and add the following :

`package 'httpd'`

The `:install` command is done by default and not required. Lets boot up the webserver: 

`chef-client --local-mode webserver.rb`

 Since we are in root, which we set up - there for we don't need extra permissions. 

 Ok now lets add a bit of code to the file to start the web server automatically, we need to specify the `start_command` additionally due to the image limitations.

```

package 'httpd'

service 'httpd' do
  action :start
  start_command '/usr/sbin/httpd -k start'
end


```

Don't forget to run the chef-client command to start it : 

`chef-client --local-mode webserver.rb`  

Cool, it starts - but how can we test it? Lets add some simple HTMl so we can verify by hitting the page. 

```

package 'httpd'

service 'httpd' do
  action :start
  start_command '/usr/sbin/httpd -k start'
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>I love chocolate... really!</h1>
  </body>
</html>'
end

```



Don't forget to apply the change :

`chef-client --local-mode webserver.rb`

We have now created the home page, by adding the index file to the right location we can now view it by running a curl command.

```
curl localhost
```

You should see the html displayed, but remember we have port forwarding out to our external listening port 8100, so lets go check it out! 

From any browser just go to `http://localhost:8100` and you should see the message! 

So in summary for this section, we installed a webserver, configured it to start and configured a splash page. If you were to run this on 5 servers, that reduces the time to develop by 5 and maybe more!



### RESOURCE COMMANDS 

```

## EXECUTE A LINE COMMAND 

execute 'mkdir newfolder'
```

```
## CREATE PACKAGE 

package 'java-1.7.0-openjdk-devel'
```

```
## ADD GROUP

group 'MYGROUP'
```


```
## ADD USER

user 'MYUSER'
```

```
## CREATE FILE 

file '/my/file/locaiton/name'  do
  content 'I love lamp'
end
```


```
## DELETE FILE

file '/my/file/locaiton/name' do
  action :delete
end
```

```
## start service 

service 'httpd' do
  action :start
end


## start service and specify the start command
service 'httpd' do
  action :start
  start_command '/usr/sbin/httpd -k start'
end

```



```
### ADVANCED 

### ADD GROUP TO DIR 

directory '/opt/tomcat' do
  action :create
  group 'tomcat'
end


# sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
# USER ADD FLAGS
# -M Don't create home -s shell -g  group name -d home directory (/opt/tomcat)  tomcat=loginName

user 'tomcat' do 
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end
```



