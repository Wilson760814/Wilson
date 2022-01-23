({
	saveData : function(component, event, helper) {
		var account  = component.get("v.accountRecord");
        console.log(JSON.stringify(account));
        
        var action = component.get("c.createAccount");
        action.setParams({"acc":account});
        action.setCallback(this,function(response){
           	var state = response.getState();
            console.log(state);
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
                console.log(result);
                alert(result);
            }
        });
        $A.enqueueAction(action);
	} 
})