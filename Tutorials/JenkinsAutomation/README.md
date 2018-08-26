

# PREREQUISITS

First you will need to download jenkins from the official website, for windows version just find it, download the installer and follow the steps. 
* Jenkins should now be available via localhost:8080
* If it gives 404 you will need to change the port number to say 8090 in the jenkins manifest.xml file 

### POWERSHELL PLUGIN

You will be installing tons of plugins for Jenkins, it is really easy - lets start with a powershell plugin 

1. Google Jenkins powershell you should get taken to a link, with another link to ...[Here](https://plugins.jenkins.io/powershell)
2. Go to Archive *top right*
3. Download the latest or earlier version it is a .hpi file 
4. Go to Jenkins and __MANAGE JENKINS__ on the left side
5. __MANAGE PLUGINS__
6. __ADVANCED__ tab
7. __upload plugin__ and chose your powershell.hpi file
8. Click upload 


## LESSON 2 JENKINS JOBS

We can now run powershell from Jenkins, that means we can schedule the jobs so we can do cool stuff like daily reporting, remote API calls etc

Lets get stuck in and start our Jenkins development project

* Create a new folder called __JENKINS-SANDPIT__
* Create a file called __BTCREPORT.txt__
* Paste the code below into the file 
```
$url = "https://api.coinmarketcap.com/v1/ticker/?convert=GBP"


#this bit of code will pull data from coinmarketcap into a json file that we could parse or do reporting on.

Invoke-WebRequest -Uri $url -UseDefaultCredentials -UseBasicParsing | Select-Object -ExpandProperty content > C:\Users\adam\Documents\jenkins\output.json
```

* Now add a git repo like we did the last time - first go to github login, and click create project and follow the steps 
* Upload this git repo (should be in the steps when you create a new GIT project)


## Building our First Jenkins Job
1. Log into Jenkins 
2. Create new Item
3. Give it an item name something like Automated Reports and select __FreeStyle Project__
4. There is __LOTS__ of stuff you can configure here, but don't worry you don't need to do anything if you don't want to. Think of them all as optional functionality, they can include AWS triggers, GITHUB polling and so on.
5. Scroll down to __Add build step__ and selet Windows Powershell

First lets run the below code by adding it into the windows powershell box in Jenkins you just opened **REMEMBER** to change your path to match your name/id:

```
$url = "https://api.coinmarketcap.com/v1/ticker/?convert=GBP"

Invoke-WebRequest -Uri $url -UseDefaultCredentials -UseBasicParsing | Select-Object -ExpandProperty content > C:\users\adam\desktop\output.json

```
You can now find the json report file in the directory containing values for all of these coins

# Schedule reports

Imagine this was an important report that you had processed (we will do a little later), you want to produce it every hour and do something with it. So here we will do the first step of running it every hour.

In your jenkins job, select __configure__ now scroll down until you see __BUILD TRIGGERS__ and click on __build periodically__ . 
This clock timing is a bit confusing, but you can always google the time conversion you need, for now we will build every hour to do this simply paste in the following. 

```
0 * * * *
```

Apply and save and now the job will tell you the next time it will run under the box where you just inserted the timecode. 

Your Jenkins job will now run every hour.
# PARSING JSON DATA

## STORING DATA IN VAR

Ok your report is a good first step, but its not very useful, we need to convert the data to usable objects we can manipulate at will, then we can do stuff like build a report. The first step is to change the code so it doesn't write out the data to file, but saves it as a variable. 

```
$url = "https://api.coinmarketcap.com/v1/ticker/?convert=GBP"

$output = Invoke-WebRequest -Uri $url -UseDefaultCredentials -UseBasicParsing 

Write-Host $output
```

* You can see this is much more simpler, we just invoke the web request on the URI and save it to a variable $output, then we use Write-Host to display it.

Run this code in Jenkins to be sure it works. 

## Converting to json

Ok, this is good, but your variable is still a massive string even though it looks like Json, it isn't Json, its just a string. So lets convert it using the powershell special command (other langauges have a similar command).

__ADD__ these three lines

```
$jsonOutput = ConvertFrom-Json -InputObject $output

Write-Host $jsonOutput.id
Write-Host $jsonOutput.price_gbp

```

Run your code to make sure it works.

# FORMATTING JSON

So now we can ouptut the selected id and price, but they are in two piles, lets get them displaying side by side.

```
for($x=1; $x -le 10; $x++){Write-Host $jsonOutput.id[$x] $jsonOutput.price_gbp[$x]}
```


Now you should get the jist of how to work with JSON data, powershell and jenkins. This can be really powerful, the next steps would be saving other features of the output such as BTC value to a variable and then producing a HTML report, that can be viewed online. Eventually having your jenkins job upload the report to your website, so you have an up to date price index. 

__MORE TO COME IN THE FUTURE__


