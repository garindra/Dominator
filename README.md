# Dominator

Dominator is a Coffescript-based templating library. It creates HTML tags from pure function calls, instead from string-based value substitutions.

# API Examples

### Simple
This is the simplest way to render HTML with Dominator:

    dom = new Dominator

    html = dom.div('Hello World').render()

The variable `html` will now contain the string:

    <div>Hello World</div>

As you can see, the `div` function accepts a string which in turn will be inserted to the `div` tag that it created.

### Tag Attributes
We can now start adding attributes to the tag that we create:
    
    dom = new Dominator

    dom
        .div class:'header', id:'nav', 'I am navigation'

Dominator accepts an `object` containing the attributes that the tag will have. 

# TODO

- Implement prettified HTML output
- Implement more tags, including the ability to include custom ones
