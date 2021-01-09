# Getting into Tech & DevOps
|  Navigation |
|--------------|     
| [Project Flow and CICD](Project-Flow-and-CICD) | 
|   [Tech Role Types](#Tech-Role-Types) |  

## Project Flow and CICD
    
## Agile 
    
## Tech Role Types
  
This is a breakdown of **ALL THE DIFFERENT KIND OF TECH JOBS** , the different kind of roles, what they entail and so on.  
  
### Front End  Developer  
      
![](https://www.talk-business.co.uk/wp-content/uploads/2014/11/tb-37-p.113.jpg)
- Also Known as web developer.    
  
  
  
**ATTRIBUTES**   
  
- Creative
- Design Focused
- Personability 
- Passionate about the look, feel and user/customer journey 
  
    
**LANGUAGES AND TECHNOLOGIES** 
    - HTML, CSS, JavaScript
      
        
**Code Sample**   

```html

<h1> A header </h1>
<h2> A Sub Header </h2>  

<img src="pic_trulli.jpg" alt="an image">

```   


### Back End   Developer
    
      
![](https://tr2.cbsistatic.com/hub/i/r/2018/07/09/1aba83d0-c289-4a6b-bfef-3dcc38dcf509/resize/1200x/c166876c2a82cd9a482cac6e20f9b60f/istock-849858410-1.jpg). 

    
**ATTRIBUTES**   
  
- Focused on Detail
- Highly analytical
- Not necessarily a people person 
- Manages Complexity  
  
    

    
**LANGUAGES AND TECHNOLOGIES** 
    - Python, Ruby, PHP
    - Java, C++, C, C#
  
**Code Sample**  

```python

import random

guesses_made = 0

name = input('Hello! What is your name?\n')

number = random.randint(1, 20)
print ('Well, {0}, I am thinking of a number between 1 and 20.'.format(name))

while guesses_made < 6:

    guess = int(input('Take a guess: '))

    guesses_made += 1

    if guess < number:
        print('Your guess is too low.')

    if guess > number:
        print('Your guess is too high.')

    if guess == number:
        break

if guess == number:
    print('Good job, {0}! You guessed my number in {1} guesses!'.format(name, guesses_made))
else:
    print('Nope. The number I was thinking of was {0}'.format(number))

```
     
### Tester   
   
![](https://hackernoon.com/hn-images/1*WxV_W9rZoZJttC2qsS0eOQ.jpeg). 
  
    
**ATTRIBUTES**    
  
- They are very methodical.  
- Also known as test engineer, software tester etc    
- They write tests, to check the applications work as expected.  
- The tests can be scripts that check `A works`, then `B works` etc.    


  
**LANGUAGES AND TECHNOLOGIES**   

    - Testing frameworks (they learn these principles such as AB testing, Behaviour testing etc. 
    - Cucumber, Selenium, python ... lots of others. 
      
**Other Notes**  
  
- They work closely with developers. 
- Developers also write tests (Called `unit tests` for their single program they write) , testers write deeper tests, to cover how programs fit into the wider application, to also test how customers interact with the service and lots of other things. 

      

### Operations Engineer      
  
![](https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2009/10/operations_engineer_in_proba_control_room_esa_redu_station/9257676-5-eng-GB/Operations_engineer_in_Proba_control_room_ESA_Redu_station.png)  
  
  
**ATTRIBUTES**   
    
- They keep the applications & services running
- This is support work - they may be on call, and fix things when they break (likely to get overtime pay, shift pay etc) 
- Very analytical and service focused 
- They **don't code much** , but often may fix broken code. 

  
**LANGUAGES AND TECHNOLOGIES**   
  
- Monitoring software 
- Alerting software  
- Diagnostic Software





  
### SysAdmins      

  
![](https://www.hostens.com/wp-content/uploads/2018/07/IMG_69891-e1532683863363-950x634.jpg). 
  
**ATTRIBUTES**    
 
- They set up the computer environments, settings, software installs etc.  
- They manage users, accesses and accounts. 
- They used to work on big giant server rooms, but now with cloud they can do it all from a laptop. 
- They have deep knowledge of Linux and Windows operating system. 
- Deep knowledge of networking.  
    
      
**LANGUAGES AND TECHNOLOGIES**   
  
- They don't code, they script (scripting is similar to coding but is more driven on timers and scheduled etc)  
- They work mostly with the command line and terminal, no special technology used. 


**Code Sample**  
  
```sh
  
start server
copy file A to location B

## This job might run every morning
```  
  
      
### DataBase Developer   
  
  
   
![](https://lh3.googleusercontent.com/proxy/pnmHHVK3bsZGL2iM0VwOmaeUMXuiosV3QRHhPS1JcsIKgpHWKPpSDGcAJR4jyy4JB7p3d3dhAbIRXu3B6RrTobHg_UsAIeoB7X7SLg6-OpZX7Y-QS33cEjwiK-Wpo_KyEqGtWX5fUxEc) 
  
  
  
  
**ATTRIBUTES**  
  
- They think in terms of information storage
- Tables, rows, columns etc
- They worry about information backup, redunancy, data replication etc.   
  
   

**LANGUAGES AND TECHNOLOGIES**   

- SQL, noSQL, 
- Postgres, MongoDb
- Database development software (i.e. Microsoft Sql studio).   
  
**Other Notes**  
  
- Companies don't always employ Database developers, sometimes they expect average developers to do the work as well. It really depends on costs, size of company and how big the data is.  

    
      
      
### Security Analyst    
  
![](https://salarieswiki.com/wp-content/uploads/2018/12/information-security-analyst-02.jpg). 
    
**ATTRIBUTES**    
 
- Not all companies have them (some companies consider them an additional cost). 
- Their job is to monitor threats, prevent attacks, develop software/code to keep the company safe. 
- They have a very deep knowledge of networking (Attacks have to penetrate the network). 

  
    
### DevOps Engineer  

![](https://techbeacon.com/sites/default/files/styles/social/public/field/image/alex-kotliarskyi-361099.jpg?itok=P1HKi6rc). 
    

**ATTRIBUTES**    
   
- **Lots of things!** 
- Must have soft-Skills but learning is the most important. 
- See's the picture, not just the small bubble a front end dev or operations analyst sees.  
- Deep desire to automate. 
- Jack of all trades *knows a small bit about all roles*. 
- This is because they create the pipeline that stiches all the items together `(i.e. development - > testing -> operations)`.   
- They care about things like `code quality` `monitoring performance` `automating jobs`. 
    
**LANGUAGES AND TECHNOLOGIES**   

- Scripting `python` `bash` `shell` and `powershell`.   
- IAAC such as ansible, terraform, chef, cloud formation - these are all scripts which aren't application code, but code to set up servers, networks, automate moving of files , deleting files etc.  
- Works with containers (Docker and Kubernetes).   
  
**Other Note**  
    
DEPENDING ON THE COMPANY:  

- DevOps engineers sometimes do Sysadmin work 
- DevOps engineers sometimes do operations work  
- Devops engineers (regularily) do cloud work 
  
But it **really** helps to learn as much as you can of all of these (don't aim to be a master, just aim to do what you can). 
  
  
 
## Overlap  
  

Some people in these do jobs do tasks from the other jobs, it really depends on the company.  
Developers use databases, DevOps do Cloud etc.  

   
## Job progression Levels. 
  
A rough outline might look like the following:  

 1. Apprentice
 2. Graduate
 3. Junior
 4. Generalist
 5. Specialist
 6. Senior
 7. Lead
 8. Head
 9. Director   
   
Sometimes people can go from junior to head within five years, sometimes within ten it really depends on the role you pick, the technologies/languages you use, the companies you work at and your maturity as a person.  



```python

```
