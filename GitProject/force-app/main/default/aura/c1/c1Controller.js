({
	invoke : function(component, event, helper) { 
        console.log('inside of Component 1 & invoke method.');
		// To get an Event
        var evt = component.getEvent("first");
        console.log(evt);
        // To fire an Event.
        //evt.fire();
	}
})