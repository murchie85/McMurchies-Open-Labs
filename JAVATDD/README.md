# JAVA TEST DRIVEN DEVELOPMENT

This repo is for practice code in building best practices for test driven development code base in JAVA

Look at the JAVA code in this repo under the package class BiggerAndSmaller, is this production ready? **NO**

If we simply try 

`algorithm.find(new int[] {2,3,4});`

We will get a bug - possibly to do with initialisation. In our code case, originally we had 

` if get n > bigger .... else if n < smaller `

The issue is the else if - the question is, does this happen in the real world? ** YES ** 

Hence Test Driven Development i.e. Test in parallel as you build your code, but critically automate it. Some key points to consider. 

1. Software should not be tested manually Ad-Hoc
2. It is impossible to cover all test cases manually even if you wanted to - consider A-B testing, and how interdependent components change given a small alteration to one element. As code grows in complexity, so does the impact of a minor change. 


## Manual Testing 

Manual testing normally comes in three parts 

1. **Scenario** , such as a given order 'Can you test for me that login functionality works?' , 'what happens if a enter a wrong password'. 
2. You then **Excercise** the function with an action, such as you go to the login add in your information and press select
3. Then you **Validate** the application worked as expected. 

## Deeper Look 

Take a look at the code base below 

```
package udemyTDD.numbers;

public class Program {
	// main class to excercise our code
	public static void main(String[] args) {
		BiggerAndSmaller algorithm = new BiggerAndSmaller();
		
		algorithm.find(new int[] {2,3,4});
		
		System.out.println(algorithm.getBigger());
		System.out.println(algorithm.getsmaller());
	}

}

```

Notice that we almost have a complete automated test. Because as soon as you invoke this program, it will run forever to completion, it will run the #algorithm.find# object with a set number of parameters (123). 

The only issue is there is a manual validation at the print section, because it still depends on a human to check it. 

## Potential Solution 

Running the boolean statements below should get us a step closer to automation...

`
System.out.println(algorithm.getBigger() == 4);  
System.out.println(algorithm.getsmaller() == 2);
`
This should print out the following: 

`
TRUE
TRUE
`


## Introducing JUNIT

Of course we wouldn't just throw in printline statements as our only means of code validation, Junit is a scripted process of running a battery of tests against a JAVA code base, for other code bases there are Nunit for .Net Rspec for Ruby and so on. 

An example of some features is, if the code fails you will see it in red, and green if it passes (makes it easier for skimming than just TRUE and FALSE statements)


## Adding Junit Library


1. Right click on your project folder as shown above
2. Build Path
3. Add Libraries 
 

![alt text](images/javalib.png "Java Library")

1. Select the libraries tab
2. Add Library
 

![alt text](images/junit.png "Java Library")

1. Select Junit
2. In our case we select Junit  4   (or 5)


![alt text](images/addlib.png "Java Library")


Notice you will now have Junit library in your project. 


# USING JUNIT

Using JUNIT, is just like using the same methods you normally would to excercise your main class functions. For example, if your main class had get biggest, get smallest number then your class to excercise that would still instantiate the main class as an object then call those methods on the object, but this time with some small changes to make it JUNIT compatible. 

First of we need to move any *STATIC* in our code because Junit tests must be public - or they return nothing. 

So the code below: 

```
public class Program {
	// main class to excercise our code
	public static void main(String[] args) {
		BiggerAndSmaller algorithm = new BiggerAndSmaller();
		
		algorithm.find(new int[] {2,3,4});
		
		System.out.println(algorithm.getBigger() == 4);
		System.out.println(algorithm.getsmaller() == 2);
	}

}
```

Becomes 

```

package udemyTDD.numbers;

import org.junit.Test;

import junit.framework.Assert;

public class Program {
	// main class to excercise our code
	
	@Test
	public void numbersinIncreasingOrder() {
		BiggerAndSmaller algorithm = new BiggerAndSmaller();
		
		algorithm.find(new int[] {2,3,4});
		
		//System.out.println(algorithm.getBigger() == 4);
		//System.out.println(algorithm.getsmaller() == 2);
		Assert.assertEquals(4, algorithm.getBigger());
		Assert.assertEquals(2, algorithm.getsmaller());
		
	}

}


```

The changes made are as follows:

1. import org.junit.Test;
2. Remove Static
3. Change main to numbersinIncreasingOrder
4. Remove String[] args
5. Instead of printlines, we use Assert methods that take (actualvalue,expectedvalue)

Now lets refactor the name of our java class  

*program.java*   

to   

*BiggerAndSmallerTest.java* 

as this is inline with our Junit test conventions



Now you can execute the test by rightclicking - run - run as junit test. You will notice either a green or red bar on the left hand side, depending on the status of your code execution.

From this, we can now create a whole sweet of Junit tests.
