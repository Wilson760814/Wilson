({
	showData : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === 'SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.lstAccounts",result);
                component.set("v.flag",true);
            }
        });
        $A.enqueueAction(action);
	}
})