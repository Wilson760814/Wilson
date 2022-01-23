({
    doSomething: function(cmp, event, helper) {
        var button = event.getSource();

        //The following patterns are not supported
        //when you’re trying to access another component’s
        //DOM elements.
        var el = event.target;
        var currentEl = event.currentTarget;
        var buttonName = button.get("v.name");

        console.log(el);
        console.log(currentEl);
        console.log(buttonName);
    }
})