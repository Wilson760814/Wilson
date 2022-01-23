({
	doSearch : function(component, event, helper) {
		// Calling Server-side action getAccount()
		var action = component.get("c.getAccount");
        // Passing the strIndustry value to the server-side controller method getAccount()
        action.setParams({"strIndustry":component.get("v.strKey")});
        // setCallback
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log(state);
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
                console.log(result);
                component.set("v.accRecord",result);
                component.set("v.flag",true); 
            }
            
        });
        $A.enqueueAction(action);
	}
})