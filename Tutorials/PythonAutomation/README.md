# Automating A Python Script 

In this tutorial I will show you how to use the Mac OS systems Cron job to automate a Python script. So that you can run it at a given time interval. This is a straight forward tutorial, and I do not add in any logic for checking if the job has run already etc.   

![Python and crontab](https://i2.wp.com/blog.eduonix.com/wp-content/uploads/2015/12/Linux-Shell-Scripting-29-crontab-and-at-jobs.png?fit=740%2C296&ssl=1) 


For any **Windows Users**, Please try [this](../JenkinsAutomation/README.md)] as it shows you how to automate the execution of a powershell (also scripting like python) with Jenkins (which is also very powerful and extremely useful in an IT career.)

# AUTOMATION STEPS 

1. Ensure you know where your python executable lives
2. Create a 'batch file', this is a .sh file and will be the file that is automated but will point to your python script.
3. Create your cronjob, set the time interval and point it to your batch file.

**Simples** 


