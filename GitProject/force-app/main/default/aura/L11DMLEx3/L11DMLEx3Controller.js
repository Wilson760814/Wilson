({
    doInit : function(component, event, helper){
      	component.set("v.accountRecord.Name",'Nara V');
        component.set("v.accountRecord.Phone",'1234567890');
        component.set("v.accountRecord.Industry",'Software');
    },
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
	},
    cancelData : function(component, event, helper){
        component.set("v.accountRecord",null);
    }
})