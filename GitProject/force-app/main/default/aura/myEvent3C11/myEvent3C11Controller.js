({
	doSave : function(component, event, helper) {
		var action = component.get("c.insertAccount");
        var accRecord = component.get("v.acc");
        action.setParams({"objA":accRecord});
        console.log("111");
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != 'Error'){
                    component.set("v.flag",true);
                    console.log("222");
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper){
        component.set("v.acc",null);
         console.log("555")
    }
    
})