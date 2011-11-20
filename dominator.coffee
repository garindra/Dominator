class Dominator

    constructor : ->
        @current_node = @root_node = new DOMNode
        @debt = 0
        @prettify = false

    isFunction : (obj)->
        return toString.call(obj) is '[object Function]'

    isString : (obj) ->
        return toString.call(obj) is '[object String]'

    isArray : (obj) ->
        return toString.call(obj) is '[object Array]'

    isObject : (obj) ->
        return obj is Object(obj)

    _createNode : (tag, args...) ->
        
        for index, argument of args
            if @isFunction(argument)
                func = argument
            else if @isString(argument)
                content = argument
            else if @isArray(argument)
                loop_array = argument
            else
                attrs = argument

        if @current_node.isRoot() or @debt < 0
            parent_node = @current_node
            @debt = 0
        else
            parent_node = @current_node.parentNode()

            while @debt > 0 and @debt--
                parent_node = parent_node.parentNode() #get the grandparent

        #create new node
        new_node = new DOMNode(parent_node)
        new_node.initialize(tag, attrs, content)

        parent_node.appendChild(new_node)
        @current_node = new_node
        
        if func
            @desc()
            if loop_array
                @loop(loop_array, func)
            else
                func.call(@)
            @asc()

    render : (args = {}) ->
        
        if args.prettify
            @prettify = true

        @root_node.printNode().join('')

    desc : () ->
        --@debt
        return @
    
    asc : (diff = 1) ->
        @debt += diff
        return @
    
    node : (tag, args...) ->
        
        list = [tag, args...]
        @_createNode.apply(@, list)
        @

    div : () ->
        list = ["div", arguments...]
        @_createNode.apply(@, list)
        @

    script : () ->
        list = ["script", arguments...]
        @_createNode.apply(@, list)
        @

    loop : (objs, fn) ->
        fn.call(@, obj) for obj in objs
        @

OPEN_TAG = "<"
CLOSE_TAG = ">"
OPEN_SLASH_TAG = "</"
CLOSE_SLASH_TAG = "/>"
SPACE = " "
NEWLINE = "\n"
QUOTE = '"'
EQUAL_QUOTE= '="'

class DOMNode
    
    constructor : (@parent = null) ->
        @children = []
        @attrs = {}
    
    initialize : (@tagName, @attrs, @content) ->
        
    childNodes : ->
        @children

    setAttrs : (@attrs) ->

    className : ->
        @attrs.class

    printNode : (node_string = []) ->
        
        if not @isRoot()
            @printOpenTag(node_string)
        
        child_nodes = @childNodes()
        
        #if has child
        if child_nodes.length > 0
            for child_node in child_nodes
                child_node.printNode(node_string)
        else
            @printContent node_string
        
        if not @isRoot()
            @printCloseTag node_string

        return node_string

    printContent : (node_string = []) ->
        node_string.push(@content) if @content

    printAttrs : (node_string = []) ->

        for key, value of @attrs
            node_string.push SPACE, key, EQUAL_QUOTE, value, QUOTE

        return

    printOpenTag : (node_string = []) ->
        
        node_string.push OPEN_TAG, @tagName
        @printAttrs node_string
        node_string.push CLOSE_TAG

    printCloseTag : (node_string = []) ->
        node_string.push OPEN_SLASH_TAG, @tagName, CLOSE_TAG

    firstChild : ->
        @children[0]

    appendChild : (node) ->
        @children.push node

    parentNode : -> if @parent then @parent else @

    isRoot : () -> @parent is null

this.Dominator = Dominator
