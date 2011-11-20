dom = new Dominator

dom
    .div class:'top-level', ->
        @div class:'second-level', ->
            @div class:'third=level', 'I am a div, buried deep down.'

console.log dom.render()

###

Generates : 

<div class="top-level">
    <div class="second-level">
        <div class="third-level">I am a div, buried deep down.</div>
    </div>
</div>

###
