# INTRODUCTION INTO REACT

![React Logo](react.jpeg)

## Terms & Functions Examples
1. [Render](#Render) 
2. [text/babel](#text-babel)
3. [Components](#Components)
4. [Multiple Elements](#Multiple-Elements)
5. [Multiple Components](#Multiple-Components)
6. [Properties](#Properties)
7. [Multiple Components with Properties](#Multiple-Components-with-Properties)
8. [EVENT HANDLING](#EVENT-HANDLING)





React is a javascript library for building user interfaces , specifically singe page applications. 

You can include the react libraries by inserting as script tags in html as shown below. 

```
<script src="https://fb.me/react-0.14.3.js"></script>
<script src="https://fb.me/react-dom-0.14.3.js"></script>

```	

Link to the latest versions can be found [here](https://react-cn.github.io/react/downloads.html)

You can download them manually from Buckie Roberts github [here](https://github.com/buckyroberts/react-boilerplate)

My work here will be using the offline files

React allows us to work with JSX a modified flavour of javascript that makes it easier to do certain things, such as inline html and makes web design more intuative. 



# Terms and functions 

## Render

Takes a bit of html, throws it into a target div, in the case below 'example'

```
<div id="example"></div>

    <script type="text/babel">
        ReactDOM.render(<h2>Hi, my name is Adam! This header will be thrown into the div labelled 'example'</h2>, document.getElementById('example'));
    </script>

```


## text-babel

As in the example above, if we don't have this, then the javascript interpereter won't understand as this is JSX inside

## Components

Are a react class - they are just part of your website; could be a button, progress bar, text editor etc. You can put components together to make a bigger component. 

You can make a component like below , use any name you like (as long as it starts with a capital).  Later on we can add properties, states etc.

```

<div id="example"></div>

    <script type="text/babel">

        var Shiny = React.createClass({
            render: function(){
            return(<h3>I am a simple component!</h3>);
        }
    });

        ReactDOM.render(<Shiny/>, document.getElementById('example'));
    </script>

```

**NOTE** the variable name Shiny becomes the tag that we pass in with react render method.

## Multiple Elements

**NOTE** Most important rule is that every single component can only return one parent element. So you can't return something like below:

```

    <div id="example"></div>

    <script type="text/babel">

        var Shiny = React.createClass({
            render: function(){
            return(
            <div>
                <h1> I am a title</h1>
                <p> I am a paragraph to be returned with the title via var as parent element</p>
            </div>);
        }
    });

        ReactDOM.render(<Shiny/>, document.getElementById('example'));
    </script>

```


This won't work, because we are trying to return `<h1>` and `<p>` at the same time. Instead we need to wrap them in a div

## Multiple Components

Same idea, but within our ReactDOM.render method 

```
ReactDOM.render(<div>
<Shiny/>
<Shiny/>
<Shiny/>
</div>

, document.getElementById('example'));

```


## Properties

Allows you to customise your components, if you wanted an app like netflix to display movies in a component, you don't want to make a comp for each movie you will display. 

You want to make the template for one component and customise it in a bunch of different ways. In our case heading 1 is title and heading 2 is description.

Since our parent element is called Movie, we add properties like below ..


```

ReactDOM.render(<Movie title="Avatar" genre="Action" />, document.getElementById('example'));

```

But within those two elements we have to refer to title and genre 

```
<div>
        <h1>{this.props.title}</h1>
        <h2>{this.props.genre}</h2>
</div>

```
  
 
Bringing it all together: 

```
<body>

    <div id="example"></div>

    <script type="text/babel">

        var Movie =   React.createClass({
            render: function(){
            return (

                    <div>
                        <h1>{this.props.title}</h1>
                        <h2>{this.props.genre}</h2>
                    </div>

            );
        }
    });

       

        ReactDOM.render(<Movie title="Avatar" genre="Action" />, document.getElementById('example'));

    </script>

</body>

```

## Multiple Components with Properties

We want to populate our blueprint (Movie) multiple times, and we get what looks like below:
![props image](props.jpg)

As you can guess we simply replicate the render method inside a div as shown in the code below:

```
        ReactDOM.render(
                <div>
                    <Movie title="Avatar" genre="Action" />
                    <Movie title="Good Will Hunting" genre="Drama" />
                    <Movie title="The Matrix" genre="Action" />
                </div>, document.getElementById('example'));
```


## EVENT HANDLING 


Lets say your component has some buttons on it, when they click on the buttons you want to do something (handle the event).


**NOTE** To refer to our css styles, we have to use classname and not class as class is a reserved JSX word.

First step is to add buttons and text within a render function, in the comment class and passed to the div called container (full code at end), comments and buttons look like: 


```

        var Comment = React.createClass({
            render: function(){
                return(
                        <div className="commentContainer">
                            
                            <div className="commentText">Random text</div>
                            <button className="button-primary">Edit</button>
                            <button className="button-danger">Remove</button>

                        </div>);}});

```

Above is just the base code, if run it  will show two buttons one in blue (primary) and one in red (danger) as well as the random text comment. 

Now lets add an edit & remove function above render within our comment class (note it just does an alert popup): 



```

    edit:   function(){alert('Editing commment');},
    remove: function(){alert('removing comment');},
``` 


Now we need to link the functions within our button html elements, we do this by using `onClick={this.FUNCTIONNAME}` attribute. 

```
<button onClick={this.edit} className="button-primary">Edit</button>
<button onClick={this.remove} className="button-danger">Remove</button>
```

Full code below, we have added in a board css style to make it look nicer in a blue box. 

```

    <div id="container"></div>

    <script type="text/babel">

        var Comment = React.createClass({

            edit:   function(){alert('Editing commment');},
            remove: function(){alert('removing comment');},
            render: function(){

                return(

                        <div className="commentContainer">
                            
                            <div className="commentText">Random text</div>


                            <button onClick={this.edit} className="button-primary">Edit</button>
                            <button onClick={this.remove} className="button-danger">Remove</button>

                        </div>

                );

        }
    });

        ReactDOM.render(<div className="board">
                            <Comment>Howdy</Comment>
                        </div>, document.getElementById('container'));
```

Now lets repeat this three times with different text overwriting "Random Text" - however we do not use `this.props.elementname` instead we use `this.props.chilldren`

Full Code below:

```

    <div id="container"></div>

    <script type="text/babel">

        var Comment = React.createClass({

            edit:   function(){alert('Editing commment');},
            remove: function(){alert('removing comment');},
            render: function(){

                return(

                        <div className="commentContainer">
                            
                            <div className="commentText">{this.props.children}</div>


                            <button onClick={this.edit} className="button-primary">Edit</button>
                            <button onClick={this.remove} className="button-danger">Remove</button>

                        </div>

                );

        }
    });

        ReactDOM.render(
        <div className="board">
            <Comment>I am a comment </Comment>
            <Comment>Me too </Comment>
            <Comment>Also me</Comment>
        </div>, document.getElementById('container'));

    </script>


```
