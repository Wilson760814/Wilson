({
	searchData : function(component, event, helper) {
		// Get the input value 
        var skey = component.get("v.searchKey");
        
        // Get the Component Event
        var evt = component.getEvent("first");
        // Pass the value to the event
        evt.setParams({"searchKey":skey});
        // Fire an Event.
        evt.fire();
	}
})