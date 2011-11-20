# Dominator

Dominator is a Coffescript-based templating library. It creates HTML tags from pure function calls, instead from string-based value substitutions.

# API Examples

### Simple
This simplest way to render HTML with Dominator:

    dom = new Dominator

    html = dom.div('Hello World').render()

The variable `html` will now contain the string:

    <div>Hello World</div>

# TODO

- Implement prettified HTML output
- Implement more tags, including the ability to include custom ones
