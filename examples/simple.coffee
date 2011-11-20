dom = new Dominator

dom
    .div class:'test', 'i am a dominator-generated div'

console.log dom.render()

#generates : <div class="test">i am a dominator-generated div</div>
