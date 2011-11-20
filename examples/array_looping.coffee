dom = new Dominator

users = ['John', 'Danny', 'Anthony']

dom
    .div class:'user-list', users, (user)->
        @div class:'user', user

console.log dom.render()

###
Generates:

<div class="user-list">
    <div class="user">John</div>
    <div class="user">Danny</div>
    <div class="user">Anthony</div>
</div>

###
