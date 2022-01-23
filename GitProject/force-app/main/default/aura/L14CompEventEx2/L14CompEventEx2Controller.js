({
	doSave : function(component, event, helper) {
		var action = component.get("c.insertAccount");
        var accRecord = component.get("v.acc");
        action.setParams({"objA":accRecord});
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != 'Error'){
                    component.set("v.flag",true);
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper){
        component.set("v.acc",null);
    }
})