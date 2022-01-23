({
	btn1Action : function(component, event, helper) {
        // Syntax to get an application event
        var evt = $A.get("e.c:AEvent1");
        // To fire an event.
        evt.fire();
	}
})