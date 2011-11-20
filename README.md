# Dominator

Dominator is a Coffescript-based templating library. It creates HTML tags from pure function calls, instead from string-based value substitutions.

# API Examples

### Simple
This is the simplest way to render HTML with Dominator:

    dom = new Dominator

    console.log dom.div('Hello World').render()

The `console.log` call will yield:

    <div>Hello World</div>

As you can see, the `div` function accepts a string which in turn will be inserted to the `div` tag that it created.

### Tag Attributes
We can now start adding attributes to the tag that we create:
    
    dom = new Dominator

    dom
        .div class:'header', id:'nav', 'I am navigation'

    console.log dom.render()

Dominator accepts an `object` containing the attributes that the tag will have. The `console.log` call will yield:

    <div class="header" id="nav">I am navigation</div>

Pretty predictable here.

### Multiple, same-level tags
Now let's spice things up here by inserting multiple tags:
    
    dom = new Dominator

    dom
        .div(class:'member', 'first member')
        .div(class:'member', 'second member')
        .div(class:'member', 'third member')

    console.log dom.render()

As you can see, you can easily create multiple sibling tags by just calling tag functions one after another. This will very predictably yield:

    <div class="member">first member</div>
    <div class="member">second member</div>
    <div class="member">third member</div>

### Let's go down the tree
With Dominator, you are able to create multi-level DOM tree like this:

    dom = new Dominator

    dom
        .div class:'top-level', ->
            @div class:'second-level', "I'm down here!"
    
    console.log dom.render()

This will yield:

    <div class="top-level">
        <div class="second-level">I'm down here!</div>
    </div>

### Array Loops
You can also pass an array to a tag function, which results in a loop with each member of the array passed to each iteration of the loop. Here's an example:

    dom = new Dominator

    dom
        .div ['John', 'Danny', 'Anthony'], (user) ->
            @div class:'user', user

This results in:
    
    <div>
        <div class="user">John</div>
        <div class="user">Danny</div>
        <div class="user">Anthony</div>
    </div>

# TODO

- Implement prettified HTML output
- Implement more tags, including the ability to include custom ones
