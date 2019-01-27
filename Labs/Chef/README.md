# CHEF - OVERVIEW 

![CHEF](https://www.chef.io/wp-content/uploads/2017/07/chef-software_facebook-share_min.png)  

## TOPICS COVERED 

1. [CHEF-BASICS](#BASICS)
2. [INSTALL-DOCKER](#INSTALLING-DOCKER)


## BASICS

A quick break down of chef basics to be updated as document grows. 

### KEY TERMS 

- Recipe - a YAML list of commands for chef to execute
- Cookbook - the folder structure for a chef project
- Knife

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


In order to best leverage Chef without causing any long lasting damage on your machine (by deleting or uninstalling things) - it is best to use docker which is a bloat free self contained VM known as a container. 

First lets create  directory 

```
docker pull centos:7
```


This will pull down a centos 7 image we can use for creating our container OS (I will supply commands in both windows and Linux/mac but may end up ommitting Windows now and again)

Linux and macOS `docker run -it -v $(pwd):/root/chef-repo -p 8100:80 centos:7 /bin/bash`   

Windows `docker run -it -v ${pwd}:/root/chef-repo -p 8100:80 centos:7 /bin/bash`   


The following flags are `-it` to start an interactive session and provides a terminal. `-v` mounts a virtual directory that relates to your machines current dir, but will be called chef-repo in the container. `-p` is a port mapping, your computers port 8100 will be mapped to the containers internal port 80. Port mapping is good so you can use chef from your machine to orchastrate your container without needing to ssh in.



- First lets ssh in and install chef to run some jobs   

`curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v 2.5.3
`

**NOTE** when you enter `exit` you will leave the container and all the stuff you have installed like chef will no longer be there, the folder structure will because we mounted it with `-v` . This is how the container stays bloat free.  

- Lets install nano so we can edit files  

`yum install nano`  

- Now lets make a recipe called `lamp.rb` that produces a file with some text in it  

```
file '/tmp/motd' do
  content 'I love lamp'
end
```


When ready run the chef command locally (as we don't have a master server yet) and watch it create the file .  

`chef-client --local-mode lamp.rb`

Lets confirm this by printing the output of the file :  

`more /tmp/lamp`

You should see the output `I love lamp` printed to screen. Ok lets run the above command again, notice how it says 'up to date' - chef wont change if the target is in the desired state already. Lets make a little change and run it again, change the text to say 'I love chocolate' and run the command again:

`chef-client --local-mode lamp.rb`  


Lets view the output to confirm state has indeed been updated : 


`chef-client --local-mode lamp.rb`  


