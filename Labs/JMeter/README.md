# JMETER 

![jmeter icon](images/jmeter.jpg) 

1. [What is performance Testing?](#WHAT-IS-PERFORMANCE-TESTING)
2. [#JMETER interface](#JMETER-INTERFACE)
3. [Creating a Simple Static Script]
4. [Recording actual browser activity]
5. [User Login & Authentication]
6. [Dynamic Requests & User Variables] 
7. [Extracting Values with Regular Experessions] 
8. [CSV files] 


# WHAT IS PERFORMANCE TESTING

Ensure user experience is fast and error free under any load.

##How?##

1. Create user load 
2. Measure the user experience 

**HOW** does JMETER work? First we should understand how the browser works - it sends request to URL server responds with resources such as an image. Then the browser parses the response.  

Finally the browser executes javascript js and repeats. **JMETER** is an open source apache tool, and does the following series of steps to achieve the 2 objectives. 

1. JMeter sends a request *(http)*
2. Server responds (with html resource)
3. JMETER pareses response  ~~and executes javascript~~


# JMETER INTERFACE


<p align="center">
<img src="comps.jpg" title="components" width="256" height="256">
</p>