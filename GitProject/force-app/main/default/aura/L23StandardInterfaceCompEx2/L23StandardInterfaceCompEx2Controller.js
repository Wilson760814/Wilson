({
	invoke : function(component, event, helper) {
		var accRecordId = component.get("v.recordId"); // Returns id of the record.
        console.log('accRecordId -->'+accRecordId)
        var action = component.get("c.returnCount");
        action.setParams({"accId":accRecordId});
        action.setCallback(this,function(response){
           	var state = response.getState();
            console.log('state -->'+state);
            if(state == 'SUCCESS'){ 
                var res = response.getReturnValue();
                console.log('response-->'+res);
                component.set("v.strcount",res);
            }
        }); 
        $A.enqueueAction(action);
	}
})