
# DevOps Placement Guidelines


![DevOps Logo](https://www.xactplacements.co.uk/wp-content/uploads/2018/03/DevOps.jpg)


## Contents

1. [Schedule of Activities](#TEMPLATE-SCHEDULE-OF-ACTIVITIES) | 
2. [Learning Outcomes](#LEARNING-OUTCOMES) |
3. [Learning Resources](#LEARNING-RESOURCES) |
4. [Delivery Objectives](#DELIVERY-OBJECTIVES ) |

 Welcome to the DevOps team - this article is designed to help provide you with some useful guidelines on learning the ins and outs of DevOps. This is a dynamic document and will be updated as new topics arise with new features to work on. This also features some shared objectives that can be mapped to Ed Fulda's outcomes. 



## TEMPLATE SCHEDULE OF ACTIVITIES


Below are some suggestions to ensure that you have things to do throughout the day. 

- Join Standup call on Monday 
- Set up 30 minute 121s with Myself, Hurriyet, Mani and Geoff who are all in the office. We also have Lukesh and - Shashank who are offshore, you can set up a 30 minute call with them too, to ask what activities they do. 
- Rotate who you shadow every 2 hours
- Complete Learning Outcomes section
- Complete Learning resources Section
- Complete Delivery Outcomes 
- Obtain access to some of the tools which can be done in short time - speak to Hurriyet, Myself and Mani to ascertain which ones they are. 
- Read through Fusion portal and DevOps sharepoint to become aquatinted with our department

# LEARNING OUTCOMES

Use the learning resources section (and google) to help you produce answers on the following questions. You will be asked throughout the placement on those topics to assess your understanding. Along with the Delivery Objectives will be the foundation of your training. 

- Understand DevOps from a high level. 
- Identify the key elements of CICD Delivery.
- Describe key technologies that would be used at each point in CICD Delivery.
- Explain how DevOps & CICD benefits a Developer.
- Explain how DevOps & CICD benefits a Tester.
- Explain how DevOps practices & or CICD reduces risk in the software development lifecycle.
- Be able to articulate the buisiness value of CICD, DevOps and Automation.
- Relate the 12 factors to DevOps principles.
- List 3 or more technical tasks a DevOps engineer might carry out. 
- List 3 or more business tasks a DevOps engineer might carry out. 
- Describe the difference between scaling horizontally and scaling vertically
- Explain why Jenkins (or other Orchastration tools) are so powerful? 


## SHARED OUTCOMES 

These Outcomes are linked to Ed Fulda's CSO Analytics Outcomes 

- Understand the 12 factor app - what does this mean? (Research required).
- Understand Agile principles from a high level, what are the key differences between waterfall and Agile? 
- Be able to articulate the 5 core Scrum ceremonies, Daily Standup, Sprint Planning, Sprint Retrospective, Sprint Demo and Sprint Backlog Refinement (grooming)
- Explain clearly and simply, what does the following concepts mean: Scrum, Sprint, Stories, Epics, Velocity/
- Demonstrate capability in using JIRA and Confluence 
- What does it mean by treating your servers as cattle versus treating them as pets? 

## ADVANCED SHARED OUTCOMES 

1. Explain the client server model (draw the star, Line, Ring model discuss advantages and disadvantages of them)
2. What would you recommend as the best Client Server model and why?
3. Explain TCP/IP model 
4. Why do you have to configure ports for an application that you run on your machine.



# LEARNING RESOURCES

What makes DevOps so powerful and sought after a profession is the wide range of skills required. A DevOps specialist must have degrees of experience with - Development, Testing (functional and Quality), Operations, Systems Administration and more. This is because as a DevOps specialist you are responsible for the underlying infrastructure which those Dev, testing and others run on. Duties can invole any of the following and more: 

- Scripting 
- Automation
- System Administration 
- Application Configuration
- Tooling (selecting the best tools for the team to use)
- Team Dashboarding (making a dashboard to centralise data visualization for the team)
- CICD piepline (building a pipleine in Jenkins to deliver end to end)


Also crucially what differenciates a DevOps engineer from others is the close relation to business, so much so that DevOps engineers often have to think laterally as how to help solve problems from the following points of view:

Scalability 
Does this feature, product have the ability to grow to meet customer demand. A DevOps engineer solves this problem by building infrastructure that grows and shrinks as required.


### HIGH LEVEL OVERVIEW OF DEVOPS 

[DevOps Overview](https://www.guru99.com/devops-tutorial.html)

### BEST DEVOPS TOOLS AND TECH 2019 

You **DEFINITELY** don't need to learn all of theses, just have a little browse to get the general idea and feel of what sort of things these tools may do. 
[DEVOPS2019](https://www.guru99.com/devops-tools.html)


## PLURALSIGHT 

All Barclays employees have free access to Pluralsight, below are some links I strongly recommend working through.



Devops can be thought of a combination of three main practices - People, Processes and Tools. Succesful automation and Operations require a combinatiton of the right DevOps culture, strong tooling and robust processes which helps both reduce impediments but protects the quality of features being released.


### PEOPLE

### PROCESS

The core working practice behind DevOps is Agile Scrum, infact DevOps has some of the biggest successes with Agile. 

### TOOLS



# DELIVERY OBJECTIVES

*NOTE* Some of the below activities may not be possible on a Barclays machine, it is recommended you also try these on a personal laptop.

- Get access to jenkins, or install Jenkins on your personal machine. 
- If you installed on a personal machine - add plugins, for example google `jenkins pipeline plugin` and add it to jenkins. **NOTE** do not do this step on the Barclays Jenkins instance. 
- Create a Jenkins freestyle project
- Have the project write `Hello Barclays` to the console (either execute shell for linux or execute windows batch command for windows)
- Have Jenkins write the above message to a file
- Write a second job to move that file from one location to another 
- Have the second job, check if the file exists in the destination location. If it does, rename the new file as the filenameVersion1.1
- Each time increment the new file name by 0.1 (hint - make the final filename a combination of two variables $filename & $fileversion, the $fileversion is a number that gets incremented).
- Connect those two jobs together so that when the first is run succesfully, the second automatically runs.
- Write a third job to check this file location, if a new version is added then add this to a git/stash branch.
- Obtain access to run command line arguments in Linux, Macos either via Work Computer or personal laptop. 



- Create a jenkins job to write some html to file, ensure that you can click on the file and open it: example html below. 

```
<html>

<h1> Hello Everyone, this is my first simple website </h1>

<body>

This is running on my browser as a **static file** this means it does not change. <br>
To have this as a real useful website, I would need to **host** it so that the public would have access. A **Dynamic** webpage is one that changes, for example it could load new information in real time from a database.

</html>

```

- Make sure the file is saved as index.html (why do you think the html affix matters? )

# ADVANCED TECHNICAL OBJECTIVES (Optional)

1. Set up Apache server on your personal computer 