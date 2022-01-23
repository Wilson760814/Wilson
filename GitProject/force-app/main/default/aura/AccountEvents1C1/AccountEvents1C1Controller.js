({
	doSave : function(component, event, helper) {
		var accRecord1 = component.get("v.acc");
        var action = component.get("c.insertAccount");
        action.setParams({"objA":accRecord1}); 
        action.setCallback(this,function(response){
            var state = response.getState(); 
            if(state == 'SUCCESS'){
                var res = response.getReturnValue(); 
                if(res == 'OK'){
                    var evt = $A.get("e.c:AccountEvents1");
                    evt.setParams({"accRecord":accRecord1}); 
                    evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper) {
		var acc;
       component.set("v.acc", acc);  
	}
})