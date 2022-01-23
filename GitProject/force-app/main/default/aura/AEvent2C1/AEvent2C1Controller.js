({
	doSave : function(component, event, helper) {
		var accountRecord = component.get("v.accountrec");
        var action = component.get("c.createAccount");
        action.setParams({"objA":accountRecord});
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != 'error'){
                    // to get an application event
                    var evt = $A.get("e.c:AEvent2");
                    // to pass the data using an application event
                    evt.setParams({"acc":accountRecord});
                    // fire an application event.
                    evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper){
        component.set("v.accountrec",null);
    }
})