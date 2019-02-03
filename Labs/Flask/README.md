# FLASK BLOGGING APPLICATION 

![FLASK IMAGE](https://cdn-images-1.medium.com/max/438/1*0G5zu7CnXdMT9pGbYUTQLQ.png)

## DEPENDENCIES
Using Anaconda with virtual env

- Python 3
- Flask

## Running a simple web page 

Getting started with a simple flask application: 

1. Create a directory FLASK_BLOG
2. `cd FLASK_BLOG`
3. Set up a virtual environment (download anaconda) then create your environment to work in 
4. `pip install flask`
5. Create a file called `flaskblog.py`

Now lets start adding code to `flaskblog.py` , you can go to the flask main website which gives you your first hello world code to work with [here](http://flask.pocoo.org/) or just copy and paste the code below: 

```
from flask import Flask
app = Flask(__name__)


@app.route("/")
def hello():
	return "Greetings bloggers"

```


Before you run application we need to set an environment variable in terminal or command line.

For Mac: 

```
export FLASK_APP=flaskblog.py
````
In windows the command is set *(I think)*. Then we can run the app simply by executing: 

```
flask run
```

Ensure you are in the FLASK_BLOG directory, and if all works ok put `localhost:5000` into your browser and you should see the message 'greetings bloggers'.


## WHAT JUST HAPPENED? 

When you executed `flask run` what happened was the flask framework looked at the environment variable we set `FLASK_APP` then started running the python application that you called 'flaskblog.py'. It runs this on your computer, until you stop the process by pressing the following: 

```
ctl + c
```

This terminates the process, but bare in mind what just happened was we run an application on our flask server. We were effectively serving content (our greeting  message) which we could in theory serve externally to the public.


## REFINEMENTS

### Adding HTML 

Lets make it look nicer by changing the message `"Greetings bloggers"` to `"<h1>Greetings bloggers<\h1>"` this is html header tags, if you don't know what this is, it is the markup code which formats how text and images are displayed in a web browser. It is standard must know knowledge for any web developer or coder in general and rather easy to learn in short time.

Make sure you stop your webserver with `ctl + c` on the command line  / terminal and start it again with `flask run`.

### Running as Debug (no need to restart)
Now lets make our flask application update without having to stop and start by setting our flask server in Debug mode, on commandline/terminal run : 

```
export FLASK_DEBUG=1
````

When you execute `flask run` you notice you get extra info in the terminal window indicating it is indeed in debug mode. 
This means you can change code and it will udpate on the fly.

### Running directly as python program

Instead of having to execute `flask run` with all the Environment variables we needed to set up. We can just change the code to the following: 

```
from flask import Flask
app = Flask(__name__)


@app.route("/")
@app.route("/home")
def home():
	return "<h1>Greetings bloggers</h1>"


if __name__ == '__main__':
	app.run(debug=True)
```

The last piece of code simply says if the name is the main program, then execute the flask run service with dubug switched on. This wont work if the code is imported to another program as it wont be the main.


## Adding another web page

Lets add another web page simply by copying  three lines of code and making some changes, add in this section below your hello function but above the if statement:

```
@app.route("/about")
def about():
	return "<h1>About Page</h1>"
```

So things we needed to change was the page structure inside route, the name of the function `def about():` and optionally what we decide to return. In this instance I just returned `About page`. 

## CONCLUSION

The reason I decided to write this blog was that I could code well in python and knew how to design static websites and even dynamc ones with php - but I couldn't understand how python could be used as a web server. 

From these few steps hopefully you can see the potential of Flask, you can build on this and make the website more interesting but ultimatley see how python could be used to serve your web pages to customers and the real world. 

### Continue Developing the blog Application 

 This learning material I picked up by following Corey Schafer's `Python Flask Tutorial` on youtube - there are multiple parts and it is well worth following through. Link can be found [here](https://www.youtube.com/watch?v=MwZwr5Tvyxo&t=907s) 

