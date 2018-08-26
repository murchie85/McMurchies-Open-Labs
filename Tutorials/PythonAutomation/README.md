# Automating A Python Script 

In this tutorial I will show you how to use the Mac OS systems Cron job to automate a Python script. So that you can run it at a given time interval. This is a straight forward tutorial, and I do not add in any logic for checking if the job has run already etc.   

![Python and crontab](https://i2.wp.com/blog.eduonix.com/wp-content/uploads/2015/12/Linux-Shell-Scripting-29-crontab-and-at-jobs.png?fit=740%2C296&ssl=1) 


For any **Windows Users**, Please try [this](../JenkinsAutomation/README.md)] as it shows you how to automate the execution of a powershell (also scripting like python) with Jenkins (which is also very powerful and extremely useful in an IT career.)

# AUTOMATION STEPS 

1. Ensure you know where your python executable lives
2. Create a 'batch file', this is a .sh file and will be the file that is automated but will point to your python script.
3. Create your cronjob, set the time interval and point it to your batch file.

**Simples** 


## Finding your Python Executbale 


This is really important because, you will need to tell your Mac Operating system what interpreter it is going to run, when it executes the python job for you automatically.  
You can find the location of your python executable by running the following command:  
```
which python3
```

When I tried it, I had issues with dependencies and it could get a bit messy - for simple jobs like our crypto monitoring, try and use the following path (check if it exists on your machine)  

_/usr/local/bin/python3_

## Creating a Batch File 

Now we have a path to our executable, we need to create a batch file, (in our case lets say it is in /Users/yourcomputername) 

We will call the batchfile **schedulejob.sh** the reason for it being a .sh file, is because shell scripts are easy for the macos system to run, and it allows it to point to a python script and execute it as if you would do normally. 

The code in your batch file should look something like this 

```

cd /directory/of/my/target/python/script
/usr/local/bin/python3 nameofscrpt.py

```

You can change the */usr/local/bin/python3* to the path of your Python3 executable - this is basically what your computer uses everytime it runs one of your python scripts under the covers. **Note** the *nameofscript.py* is your python job you want to run.

## Creating a CronJob

A cronjob is like a instruction sheet your macbook looks at every second to see if it has any scheduled jobs to run. Normally there is nothing in there, now we are going to add in our step to automate our batch file (which will in turn point to our python3 script we specify).


To do this, enter the following command: 

```
 crontab -e

```


This will open up a VIM edit window, **be careful** vim is a horrible editing tool, you are going to need to google how to use it. I just get by, I remember pressing esc then :qw means quit and write. If you don't press esc then it wont work. Once you have figured out how to 'insert' then add in the following below and save.


```
0 */4 * * * /Users/yourcomputername/schedulejob.sh

```


So lets give a breakdown of what is going to happen:

Every four hours, on the hour, your mac will run the batch file called schedulejob.

If you want to change the time to be faster/slower then I suggest going to the following site for more info on picking the date/time.

[Crontab time picker](https://crontab.guru/)  


Ok that should be it, your computer should run the job on the time you select, once it runs you will get a 'mail' the next time you open the terminal window. You can view the mail to see how the job went. 


